import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:family_garden/screens/Home_screen/controllers/homescreen_controller.dart';
import 'package:family_garden/screens/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../routes/app_pages.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  @override
  var controller = Get.put(HomeScreenController());

  HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              height: Get.height,
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SingleChildScrollView(
                  // physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 45,
                          child: TextFormField(
                            controller: controller.search,
                            maxLines: 1,
                            onChanged: (value) {},
                            onTap: () {
                              Get.toNamed(Routes.SEARCH_SCREEN)?.then((value) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                Get.find<DashboardController>().getCartCount();
                              });
                            },
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              prefixIcon: ImageIcon(
                                  AssetImage('assets/icons/search.png')),
                              hintText: "Search for vegetables and fruits",
                              contentPadding: EdgeInsets.symmetric(vertical: 4),
                              hintStyle: TextStyle(
                                  color: Color(0xff464646),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30)),
                              fillColor: Color(0xfff1f1f1),
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                      AppSize.size.h10,
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: Container(
                            height: 40,
                            width: Get.size.width,
                            decoration: BoxDecoration(
                                color: AppColors.limeGreen,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(13, 0, 16, 0),
                                  child: Container(
                                    width: Get.size.width / 1.50,
                                    child: SizedBox(
                                      child: Html(
                                          data: controller.informationData.value
                                                  .description ??
                                              "<p></p>",
                                          shrinkWrap: true,
                                          style: {
                                            "p": Style(
                                              fontSize: FontSize(12),
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.black,
                                            ),
                                          }),
                                    ),
                                    // child: RichText(
                                    //   text: TextSpan(children: [
                                    //     TextSpan(
                                    //         text:
                                    //             "Special Launch Offer - Flat ",
                                    //         style: TextStyle(
                                    //             fontSize: 10,
                                    //             color: AppColors.black)),
                                    //     TextSpan(
                                    //         text: "10% ",
                                    //         style: TextStyle(
                                    //             fontSize: 10,
                                    //             fontWeight: FontWeight.bold,
                                    //             color: AppColors.black)),
                                    //     TextSpan(
                                    //         text: "Discount",
                                    //         style: TextStyle(
                                    //             fontSize: 10,
                                    //             color: AppColors.black)),
                                    //   ]),
                                    // )
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 9.0, bottom: 6),
                                  child: Image.asset(
                                    "assets/images/price-tag.png",
                                    height: 36,
                                    width: 36,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // AppSize.size.h10,
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 15),
                      //   height: 130,
                      //   width: Get.width,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       image: DecorationImage(
                      //           image: AssetImage(
                      //               'assets/images/freeDeliveryBanner.png'),
                      //           fit: BoxFit.fill)),
                      // ),
                      AppSize.size.h15,
                      GetBuilder<HomeScreenController>(
                        builder: (homeController) => Column(
                          children: [
                            SizedBox(
                              height: 150,
                              width: Get.width,
                              child: CarouselSlider.builder(
                                  carouselController:
                                      controller.carouselController,
                                  itemCount: controller.carousel.length,
                                  itemBuilder: (context, index, realIndex) {
                                    return homeController.iscarouselLoader.value
                                        ? Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          )
                                        : Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(controller
                                                      .carousel[index].image
                                                      .toString()),
                                                  fit: BoxFit.fill),
                                            ),
                                            // child: Image.network(controller.carousel[index].image.toString(),width: Get.width,fit: BoxFit.fill,),
                                          );
                                  },
                                  options: CarouselOptions(
                                      autoPlay: true,
                                      viewportFraction: 1,
                                      onPageChanged: (index, reason) {
                                        controller.pageChanged(index);
                                      })),
                            ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  height: 6,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: controller.carousel.length,
                                      itemBuilder: (context, i) {
                                        return Container(
                                          width: 6.0,
                                          height: 6.0,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 3),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            //  borderRadius: BorderRadius.circular(4),
                                            color:
                                                controller.currentIndex.value ==
                                                        i
                                                    ? Color(0xff1B1B1B)
                                                    : Color(0xffB5B5B5),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      AppSize.size.h30,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 100,
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 50,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),),
                                          // color: Color(0xfff9f9f9)),
                                      // child: ScalableImageWidget.fromSISource(
                                      //     si: ScalableImageSource
                                      //         .fromSvgHttpUrl(Uri.parse(
                                      //             'https://jovial.com/images/jupiter.svg'))),
                                      child: Image.asset(
                                        controller.category.value[0]["image"],
                                        fit: BoxFit.contain,
                                        matchTextDirection: false,
                                      ),
                                    ),
                                    AppSize.size.h10,
                                    Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 75),
                                        height: 50,
                                        child: TextWidget(
                                          controller.category.value[0]["name"],
                                          fontSize: 9,
                                          fontWeight: FontWeight.w600,
                                          textAlign: TextAlign.center,
                                          height: 1.5,
                                          maxLines: 2,
                                          textOverflow: TextOverflow.ellipsis,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                width: 50,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 36,
                                      width: 42.85,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),),
                                      // child: ScalableImageWidget.fromSISource(
                                      //     si: ScalableImageSource
                                      //         .fromSvgHttpUrl(Uri.parse(
                                      //             'https://jovial.com/images/jupiter.svg'))),
                                      child: Image.asset(
                                        controller.category.value[1]["image"],
                                        fit: BoxFit.contain,
                                        matchTextDirection: false,
                                      ),
                                    ),
                                    AppSize.size.h10,
                                    Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 75),
                                        height: 50,
                                        child: TextWidget(
                                          controller.category.value[1]["name"],
                                          fontSize: 9,
                                          fontWeight: FontWeight.w600,
                                          textAlign: TextAlign.center,
                                          height: 1.5,
                                          maxLines: 2,
                                          textOverflow: TextOverflow.ellipsis,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                width: 50,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 36.48,
                                      width: 36,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),),
                                      // child: ScalableImageWidget.fromSISource(
                                      //     si: ScalableImageSource
                                      //         .fromSvgHttpUrl(Uri.parse(
                                      //             'https://jovial.com/images/jupiter.svg'))),
                                      child: Image.asset(
                                        controller.category.value[2]["image"],
                                        fit: BoxFit.contain,
                                        matchTextDirection: false,
                                      ),
                                    ),
                                    AppSize.size.h10,
                                    Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 75),
                                        height: 50,
                                        child: TextWidget(
                                          controller.category.value[2]["name"],
                                          fontSize: 9,
                                          fontWeight: FontWeight.w600,
                                          textAlign: TextAlign.center,
                                          height: 1.5,
                                          maxLines: 2,
                                          textOverflow: TextOverflow.ellipsis,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                width: 50,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 36,
                                      width: 39.62,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),),
                                      // child: ScalableImageWidget.fromSISource(
                                      //     si: ScalableImageSource
                                      //         .fromSvgHttpUrl(Uri.parse(
                                      //             'https://jovial.com/images/jupiter.svg'))),
                                      child: Image.asset(
                                        controller.category.value[3]["image"],
                                        fit: BoxFit.contain,
                                        matchTextDirection: false,
                                      ),
                                    ),
                                    AppSize.size.h10,
                                    Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 75),
                                        height: 50,
                                        child: TextWidget(
                                          controller.category.value[3]["name"],
                                          fontSize: 9,
                                          fontWeight: FontWeight.w600,
                                          textAlign: TextAlign.center,
                                          height: 1.5,
                                          maxLines: 2,
                                          textOverflow: TextOverflow.ellipsis,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                width: 50,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),),
                                      // child: ScalableImageWidget.fromSISource(
                                      //     si: ScalableImageSource
                                      //         .fromSvgHttpUrl(Uri.parse(
                                      //             'https://jovial.com/images/jupiter.svg'))),
                                      child: Image.asset(
                                        controller.category.value[4]["image"],
                                        fit: BoxFit.contain,
                                        matchTextDirection: false,
                                      ),
                                    ),
                                    AppSize.size.h10,
                                    Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 50),
                                        height: 50,
                                        child: TextWidget(
                                          controller.category.value[4]["name"],
                                          fontSize: 9,
                                          fontWeight: FontWeight.w600,
                                          textAlign: TextAlign.center,
                                          height: 1.5,
                                          maxLines: 2,
                                          textOverflow: TextOverflow.ellipsis,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      AppSize.size.h15,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextWidget(
                          "Shop by Category",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      AppSize.size.h15,
                      Obx(() => Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            height: 140,
                            child: controller.isCategoryLoader.value
                                ? Center(child: CircularProgressIndicator())
                                : ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          controller.hitAddCartAPI();
                                          // Get.toNamed(
                                          //     Routes.PRODUCT_LISTING_SCREEN,
                                          //     arguments: [
                                          //       index,
                                          //       controller.categoryList[index]
                                          //           .categoryId
                                          //     ])?.then((value) {
                                          //   controller.getHomeFeatures();
                                          //   Get.find<DashboardController>()
                                          //       .getCartCount();
                                          // });
                                          Get.toNamed(
                                              Routes.PRODUCT_LIST_SCREEN,
                                              arguments: [
                                                index,
                                                controller.categoryList[index]
                                                    .categoryId
                                              ])?.then((value) {
                                            controller.getHomeFeatures();
                                            Get.find<DashboardController>()
                                                .getCartCount();
                                          });
                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 90,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: Color(0xfff9f9f9)),
                                                child: controller
                                                            .categoryList[index]
                                                            .image ==
                                                        null
                                                    ? ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          controller
                                                              .staticImage,
                                                          fit: BoxFit.fill,
                                                          height: 90,
                                                          width: 90,
                                                        ),
                                                      )
                                                    : ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          controller
                                                              .categoryList[
                                                                  index]
                                                              .image,
                                                          fit: BoxFit.fill,
                                                          height: 90,
                                                          width: 90,
                                                        ),
                                                      ),
                                              ),
                                              AppSize.size.h10,
                                              Container(
                                                  constraints: BoxConstraints(
                                                      maxWidth: 70),
                                                  child: TextWidget(
                                                    controller
                                                        .categoryList[index]
                                                        .name,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                    textAlign: TextAlign.center,
                                                    height: 1.5,
                                                    maxLines: 2,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return AppSize.size.w15;
                                    },
                                    itemCount:
                                        controller.categoryList.value.length),
                          )),
                      AppSize.size.h30,
                      Obx(() => controller.ishomeFeatureLoader.value
                          ? Center(child: CircularProgressIndicator())
                          : ListView.separated(
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.homeFeaturesData.value
                                      .categories?.length ??
                                  0,
                              padding: EdgeInsets.only(bottom: 30, top: 10),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: TextWidget(
                                        controller.homeFeaturesData.value
                                            .categories?[index].module,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    AppSize.size.h15,
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      height: 170,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, indexx) {
                                            return Stack(
                                              children: [
                                                Container(
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 0.75),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AppSize.size.h10,
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller
                                                                      .homeFeaturesData
                                                                      .value
                                                                      .categories?[
                                                                          index]
                                                                      .products?[
                                                                          indexx]
                                                                      .quantity ==
                                                                  "0"
                                                              ? null
                                                              : Get.toNamed(
                                                                      Routes
                                                                          .PRODUCT_DETAILS_SCREEN,
                                                                      arguments: controller
                                                                          .homeFeaturesData
                                                                          .value
                                                                          .categories?[
                                                                              index]
                                                                          .products?[
                                                                              indexx]
                                                                          .productId)
                                                                  ?.then(
                                                                      (value) {
                                                                  controller
                                                                      .getHomeFeatures();
                                                                  Get.find<
                                                                          DashboardController>()
                                                                      .getCartCount();
                                                                });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          child: Image.network(
                                                            (controller
                                                                .homeFeaturesData
                                                                .value
                                                                .categories?[
                                                                    index]
                                                                .products?[
                                                                    indexx]
                                                                .image)!,
                                                            height: 60,
                                                            opacity: AlwaysStoppedAnimation(controller
                                                                        .homeFeaturesData
                                                                        .value
                                                                        .categories?[
                                                                            index]
                                                                        .products?[
                                                                            indexx]
                                                                        .quantity ==
                                                                    "0"
                                                                ? .5
                                                                : 1),
                                                            width: 70,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                      AppSize.size.h3,
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: TextWidget(
                                                          controller
                                                              .homeFeaturesData
                                                              .value
                                                              .categories?[
                                                                  index]
                                                              .products?[indexx]
                                                              .productName,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          maxLines: 1,
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                        ),
                                                      ),
                                                      AppSize.size.h3,
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: TextWidget(
                                                          controller
                                                              .homeFeaturesData
                                                              .value
                                                              .categories?[
                                                                  index]
                                                              .products?[indexx]
                                                              .productTamilName,
                                                          fontSize: 9,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          maxLines: 1,
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                        ),
                                                      ),
                                                      AppSize.size.h5,
                                                      (controller
                                                                  .homeFeaturesData
                                                                  .value
                                                                  .categories?[
                                                                      index]
                                                                  .products?[
                                                                      indexx]
                                                                  .options
                                                                  ?.length)! >
                                                              0
                                                          ? Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                              child: Container(
                                                                height: 20,
                                                                // width:70,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            0.5)),
                                                                child:
                                                                    DropdownButtonHideUnderline(
                                                                  child:
                                                                      IgnorePointer(
                                                                    ignoring: controller.homeFeaturesData.value.categories?[index].products?[indexx].quantity ==
                                                                            "0"
                                                                        ? true
                                                                        : false,
                                                                    child:
                                                                        DropdownButton2(
                                                                      items: controller
                                                                          .homeFeaturesData
                                                                          .value
                                                                          .categories?[
                                                                              index]
                                                                          .products?[
                                                                              indexx]
                                                                          .options?[
                                                                              0]
                                                                          .productOptionValue
                                                                          ?.map((item) =>
                                                                              DropdownMenuItem<String>(
                                                                                value: item.productOptionValueId.toString(),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(left: 5.0),
                                                                                  child: Text("${item.name}-${item.price}", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 9)),
                                                                                ),
                                                                              ))
                                                                          .toList(),
                                                                      value: controller.homeFeaturesData.value.categories?[index].products?[indexx].options?[0].selectedDropdownValue !=
                                                                              ""
                                                                          ? (controller
                                                                              .homeFeaturesData
                                                                              .value
                                                                              .categories?[
                                                                                  index]
                                                                              .products?[
                                                                                  indexx]
                                                                              .options?[
                                                                                  0]
                                                                              .selectedDropdownValue)!
                                                                          : (controller
                                                                              .homeFeaturesData
                                                                              .value
                                                                              .categories?[index]
                                                                              .products?[indexx]
                                                                              .options?[0]
                                                                              .productOptionValue?[0]
                                                                              .productOptionValueId)!,
                                                                      onChanged:
                                                                          (value) {
                                                                        // controller.fruitOptionId
                                                                        //             .value[
                                                                        //         index] =
                                                                        //     controller
                                                                        //         .fruitsList[
                                                                        //             index]
                                                                        //         .options?[
                                                                        //             0]
                                                                        //         .productOptionId;
                                                                        controller
                                                                            .homeFeaturesData
                                                                            .value
                                                                            .categories?[index]
                                                                            .products?[indexx]
                                                                            .options?[0]
                                                                            .selectedDropdownValue = value as String;
                                                                        controller
                                                                            .homeFeaturesData
                                                                            .refresh();
                                                                        // controller.fruitOptionValueId
                                                                        //             .value[
                                                                        //         index] =
                                                                        //     value
                                                                        //         as String;
                                                                        controller
                                                                            .update();
                                                                      },
                                                                      buttonHeight:
                                                                          35,
                                                                      buttonWidth:
                                                                          160,
                                                                      itemHeight:
                                                                          50,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                      AppSize.size.h5,
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        child: Row(
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                TextWidget(
                                                                  controller
                                                                      .homeFeaturesData
                                                                      .value
                                                                      .categories?[
                                                                          index]
                                                                      .products?[
                                                                          indexx]
                                                                      .offerPrice,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                                TextWidget(
                                                                  controller
                                                                      .homeFeaturesData
                                                                      .value
                                                                      .categories?[
                                                                          index]
                                                                      .products?[
                                                                          indexx]
                                                                      .price
                                                                      .toString(),
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                ),
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            controller
                                                                        .homeFeaturesData
                                                                        .value
                                                                        .categories?[
                                                                            index]
                                                                        .products?[
                                                                            indexx]
                                                                        .quantity ==
                                                                    "0"
                                                                ? Container()
                                                                : controller
                                                                            .homeFeaturesData
                                                                            .value
                                                                            .categories?[index]
                                                                            .products?[indexx]
                                                                            .count !=
                                                                        0
                                                                    ? Stack(
                                                                      children: [
                                                                        Container(
                                                                            height:
                                                                                26,
                                                                            width:
                                                                                71,
                                                                            decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(20),
                                                                                // border: Border.all(),

                                                                                boxShadow: [
                                                                                  BoxShadow(offset: Offset(0, 0), blurRadius: 3, spreadRadius: 3, color: Color(0xff000000).withOpacity(controller.homeFeaturesData.value.categories?[index].products?[indexx].count != 0 ? 0.2 : 0)),
                                                                                ],
                                                                                color: controller.homeFeaturesData.value.categories?[index].products?[indexx].count != 0 ? AppColors.white : AppColors.primaryColor),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 30,
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: SvgPicture.asset("assets/icons/minus_icon.svg"),
                                                                                ),
                                                                                Spacer(),
                                                                                // TextWidget('-',color: AppColors.white,fontSize: 8,),
                                                                                TextWidget(
                                                                                  controller.homeFeaturesData.value.categories?[index].products?[indexx].count.toString(),
                                                                                  color: Colors.black,
                                                                                  fontSize: 13,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                                Spacer(),
                                                                                Container(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: SvgPicture.asset("assets/icons/plus_icon.svg"),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        Positioned(top: 0,
                                                                        left: 0,
                                                                        child: GestureDetector(
                                                                          onTap: (){
                                                                            controller.homeFeatureMinusBtn(index, indexx);
                                                                          },
                                                                          child: Container(
                                                                            height: 26,width: 35.5,color: Colors.transparent,),
                                                                        )),
                                                                        Positioned(top: 0,
                                                                            right: 0,
                                                                            child: GestureDetector(
                                                                              onTap: (){
                                                                                controller.homeFeatureAddBtn(index, indexx);
                                                                              },
                                                                              child: Container(
                                                                                height: 26,width: 35.5,color: Colors.transparent,),
                                                                            ))
                                                                      ],
                                                                    )
                                                                    : GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          controller.homeFeatureAddBtn(
                                                                              index,
                                                                              indexx);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              29,
                                                                          width:
                                                                              28,
                                                                          decoration: BoxDecoration(
                                                                              color: AppColors.primaryColor,
                                                                              borderRadius: BorderRadius.circular(7)),
                                                                          child: Center(
                                                                              child: Image.asset(
                                                                            'assets/icons/addToCart.png',
                                                                            height:
                                                                                15,
                                                                            width:
                                                                                15,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          )),
                                                                        ),
                                                                      )
                                                          ],
                                                        ),
                                                      ),
                                                      AppSize.size.h5,
                                                      AppSize.size.h3,
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 15,
                                                    width: 45,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffFE6400),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                topRight: Radius
                                                                    .circular(
                                                                        3))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8, top: 3),
                                                      child: Center(
                                                        child: TextWidget(
                                                          // "${controller.fruitPercentage[index]}% off",
                                                          "${controller.homeFeaturesData.value.categories?[index].products?[indexx].percentage}% off",
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                controller
                                                            .homeFeaturesData
                                                            .value
                                                            .categories?[index]
                                                            .products?[indexx]
                                                            .quantity ==
                                                        "0"
                                                    ? Positioned(
                                                        top: 30,
                                                        left: 25,
                                                        child: Container(
                                                          height: 25,
                                                          width: 70,
                                                          child: SvgPicture.asset(
                                                              "assets/icons/out-of-stock.svg"),
                                                        ))
                                                    : Container()
                                              ],
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return AppSize.size.w10;
                                          },
                                          itemCount: controller
                                                  .homeFeaturesData
                                                  .value
                                                  .categories?[index]
                                                  .products
                                                  ?.length ??
                                              0),
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 30,
                                );
                              },
                            ))
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
