import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:family_garden/screens/Home_screen/controllers/homescreen_controller.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../routes/app_pages.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  @override
  var controller = Get.put(HomeScreenController());

  HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
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
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Container(
                        height: 42,
                        width: Get.size.width,
                        decoration: BoxDecoration(
                            color: AppColors.limeGreen,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(13, 8, 16, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: Get.size.width / 2,
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  "Special Launch Offer - Flat ",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: AppColors.black)),
                                          TextSpan(
                                              text: "10% ",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.black)),
                                          TextSpan(
                                              text: "Discount",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: AppColors.black)),
                                        ]),
                                      )),
                                  Container(
                                    width: Get.size.width / 1.50,
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                " on all Products. Use Coupon Code ",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: AppColors.black)),
                                        TextSpan(
                                            text: "FAMILYGARDEN10",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.black))
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 9.0, bottom: 6),
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
                            height: 140,
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
                                            child: CircularProgressIndicator(),
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
                              padding: const EdgeInsets.symmetric(vertical: 10),
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
                                              controller.currentIndex.value == i
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
                    // GetBuilder<HomeScreenController>(
                    //   builder: (homeController) => Center(
                    //         child: Padding(
                    //           padding: const EdgeInsets.symmetric(vertical: 10),
                    //           child: SizedBox(
                    //             height: 6,
                    //             child: ListView.builder(
                    //                 scrollDirection: Axis.horizontal,
                    //                 shrinkWrap: true,
                    //                 itemCount: controller.carousel.length,
                    //                 itemBuilder: (context, i) {
                    //                   return Container(
                    //                     width: 6.0,
                    //                     height: 6.0,
                    //                     margin: const EdgeInsets.symmetric(
                    //                         horizontal: 3),
                    //                     decoration: BoxDecoration(
                    //                       shape: BoxShape.circle,
                    //                       //  borderRadius: BorderRadius.circular(4),
                    //                       color: controller.currentIndex.value == i
                    //                           ? Color(0xff1B1B1B)
                    //                           :  Color(0xffB5B5B5),
                    //                     ),
                    //                   );
                    //                 }),
                    //           ),
                    //         ),
                    //       )),
                    AppSize.size.h30,
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: Container(
                        height: 140,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 36,
                                      width: 36,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Color(0xfff9f9f9)),
                                      child: Image.asset(
                                        controller.category.value[index]
                                            ["image"],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    AppSize.size.h10,
                                    Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 70),
                                        child: TextWidget(
                                          controller.category.value[index]
                                              ["name"],
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          textAlign: TextAlign.center,
                                          height: 1.5,
                                          maxLines: 2,
                                          textOverflow: TextOverflow.ellipsis,
                                        ))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return AppSize.size.w10;
                            },
                            itemCount: controller.category.value.length),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextWidget(
                        "Shop by Category",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppSize.size.h15,
                    Obx(() => controller.isCategoryLoader.value
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            height: 140,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.fruitsHitAddCartAPI();
                                      controller.vegHitAddCartAPI();
                                      Get.toNamed(Routes.PRODUCT_LISTING_SCREEN,
                                          arguments: index);
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 90,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Color(0xfff9f9f9)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 10),
                                              child: controller
                                                          .categoryList[index]
                                                          .image ==
                                                      null
                                                  ? Image.asset(
                                                      controller.staticImage,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : Image.network(controller
                                                      .categoryList[index]
                                                      .image),
                                            ),
                                          ),
                                          AppSize.size.h10,
                                          Container(
                                              constraints:
                                                  BoxConstraints(maxWidth: 70),
                                              child: TextWidget(
                                                controller
                                                    .categoryList[index].name,
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
                                  return AppSize.size.w10;
                                },
                                itemCount:
                                    controller.categoryList.value.length),
                          )),
                    AppSize.size.h30,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextWidget(
                        "Vegetables",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppSize.size.h15,
                    GetBuilder<HomeScreenController>(
                      builder: (homeController) => homeController
                              .isVegetableLoader.value
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              height: 170,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          width: 140,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            border: Border.all(
                                                color: Color(0xffDEDCDC),
                                                width: 0.75),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppSize.size.h10,
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Image.network(
                                                  (homeController.vegetableList
                                                      .value[index].image)!,
                                                  height: 60,
                                                  width: 70,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              AppSize.size.h3,
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: TextWidget(
                                                  homeController.vegetableList
                                                      .value[index].productName,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w800,
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              AppSize.size.h3,
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: TextWidget(
                                                  homeController
                                                      .vegetableList[index]
                                                      .productTamilName,
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w500,
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              AppSize.size.h5,
                                              // DropdownButtonHideUnderline(
                                              //   child: Padding(
                                              //     padding: const EdgeInsets.symmetric(
                                              //         horizontal: 10.0),
                                              //     child: Container(
                                              //       height: 20,
                                              //       child: ,
                                              //     ),
                                              //   ),
                                              // ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Container(
                                                  height: 20,
                                                  // width:70,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 0.5)),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: DropdownButton2(
                                                      items: controller
                                                          .vegetableList
                                                          .value[index]
                                                          .options?[0]
                                                          .productOptionValue
                                                          ?.map((item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: item
                                                                    .productOptionValueId
                                                                    .toString(),
                                                                child:
                                                                    Container(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            5.0),
                                                                    child: Text(
                                                                        "${item.name}-${item.price?.substring(0, item.price!.length - 2)}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                9)),
                                                                  ),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      value: controller
                                                              .selectedVegDropdownValue
                                                              .value[index]
                                                              .isNotEmpty
                                                          ? controller
                                                              .selectedVegDropdownValue
                                                              .value[index]
                                                          : controller
                                                              .vegetableList[
                                                                  index]
                                                              .options?[0]
                                                              .productOptionValue?[
                                                                  0]
                                                              .productOptionValueId,
                                                      onChanged: (value) {
                                                        controller.vegOptionId
                                                                .value[index] =
                                                            controller
                                                                .vegetableList[
                                                                    index]
                                                                .options?[0]
                                                                .productOptionId;
                                                        controller
                                                                .selectedVegDropdownValue
                                                                .value[index] =
                                                            value as String;
                                                        controller
                                                                .vegOptionValueId
                                                                .value[index] =
                                                            value as String;
                                                        controller.update();
                                                        // controller
                                                        //     .changeLocation(
                                                        //         value);
                                                      },
                                                      buttonHeight: 35,
                                                      buttonWidth: 160,
                                                      itemHeight: 50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              AppSize.size.h5,
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        TextWidget(
                                                          homeController
                                                              .vegetableList[
                                                                  index]
                                                              .offerPrice
                                                              ?.substring(
                                                                  0,
                                                                  homeController
                                                                          .vegetableList[
                                                                              index]
                                                                          .offerPrice!
                                                                          .length -
                                                                      2),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        TextWidget(
                                                          homeController
                                                              .vegetableList[
                                                                  index]
                                                              .price
                                                              ?.substring(
                                                                  0,
                                                                  homeController
                                                                          .vegetableList[
                                                                              index]
                                                                          .price!
                                                                          .length -
                                                                      2),
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                        ),
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    Obx(
                                                      () =>
                                                          controller.vegBoolList
                                                                  .value[index]
                                                              ? Container(
                                                                  height: 26,
                                                                  width: 71,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          // border: Border.all(),

                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                                offset: Offset(0, 0),
                                                                                blurRadius: 3,
                                                                                spreadRadius: 3,
                                                                                color: Color(0xff000000).withOpacity(controller.vegBoolList[index] == true ? 0.2 : 0)),
                                                                          ],
                                                                          color: controller.vegBoolList[index] == true
                                                                              ? AppColors.white
                                                                              : AppColors.primaryColor),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          controller
                                                                              .vegMinusBtn(index);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              30,
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Image.asset("assets/icons/minus.png"),
                                                                        ),
                                                                      ),
                                                                      Spacer(),
                                                                      // TextWidget('-',color: AppColors.white,fontSize: 8,),
                                                                      TextWidget(
                                                                        controller
                                                                            .vegCounterList[index]
                                                                            .toString(),
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                      Spacer(),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          controller
                                                                              .vegAddBtn(index);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Image.asset("assets/icons/add.png"),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .vegAddToCart(
                                                                            index);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 29,
                                                                    width: 28,
                                                                    decoration: BoxDecoration(
                                                                        color: AppColors
                                                                            .primaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(7)),
                                                                    child: Center(
                                                                        child: Image.asset(
                                                                      'assets/icons/addToCart.png',
                                                                      height:
                                                                          15,
                                                                      width: 15,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    )),
                                                                  ),
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
                                                color: Color(0xffFE6400),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(3))),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, top: 3),
                                              child: TextWidget(
                                                "${controller.vegetablePercentage[index]}% off",
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return AppSize.size.w10;
                                  },
                                  itemCount:
                                      controller.vegetableList.value.length),
                            )
                          : Center(child: CircularProgressIndicator()),
                    ),

                    AppSize.size.h30,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextWidget(
                        "Fruits",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppSize.size.h15,
                    GetBuilder<HomeScreenController>(
                      builder: (homeController) => homeController
                              .isFruitLoader.value
                          ? Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              height: 170,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          width: 140,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            border: Border.all(
                                                color: Color(0xffDEDCDC),
                                                width: 0.75),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppSize.size.h10,
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Image.network(
                                                  homeController
                                                      .fruitsList[index].image!,
                                                  height: 60,
                                                  width: 70,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              AppSize.size.h3,
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: TextWidget(
                                                  homeController.fruitsList
                                                      .value[index].productName,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w800,
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              AppSize.size.h3,
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: TextWidget(
                                                  homeController
                                                      .fruitsList[index]
                                                      .productTamilName,
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w500,
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              AppSize.size.h5,
                                              // DropdownButtonHideUnderline(
                                              //   child: Padding(
                                              //     padding: const EdgeInsets.symmetric(
                                              //         horizontal: 10.0),
                                              //     child: Container(
                                              //       height: 20,
                                              //       child: ,
                                              //     ),
                                              //   ),
                                              // ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Container(
                                                  height: 20,
                                                  // width:70,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 0.5)),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: DropdownButton2(
                                                      items: controller
                                                          .fruitsList
                                                          .value[index]
                                                          .options?[0]
                                                          .productOptionValue
                                                          ?.map((item) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: item
                                                                    .productOptionValueId
                                                                    .toString(),
                                                                child:
                                                                    Container(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            5.0),
                                                                    child: Text(
                                                                        "${item.name}-${item.price?.substring(0, item.price!.length - 2)}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                9)),
                                                                  ),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      value: controller
                                                              .selectedFruitDropdownValue
                                                              .value[index]
                                                              .isNotEmpty
                                                          ? controller
                                                              .selectedFruitDropdownValue
                                                              .value[index]
                                                          : controller
                                                              .fruitsList[index]
                                                              .options?[0]
                                                              .productOptionValue?[
                                                                  0]
                                                              .productOptionValueId,
                                                      onChanged: (value) {
                                                        controller.fruitOptionId
                                                                .value[index] =
                                                            controller
                                                                .fruitsList[
                                                                    index]
                                                                .options?[0]
                                                                .productOptionId;
                                                        controller
                                                                .selectedFruitDropdownValue
                                                                .value[index] =
                                                            value as String;
                                                        controller
                                                                .fruitOptionValueId
                                                                .value[index] =
                                                            value as String;
                                                        controller.update();
                                                      },
                                                      buttonHeight: 35,
                                                      buttonWidth: 160,
                                                      itemHeight: 50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              AppSize.size.h5,
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        TextWidget(
                                                          homeController
                                                              .fruitsList[index]
                                                              .offerPrice
                                                              ?.substring(
                                                                  0,
                                                                  homeController
                                                                          .fruitsList[
                                                                              index]
                                                                          .offerPrice!
                                                                          .length -
                                                                      2),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        TextWidget(
                                                          homeController
                                                              .fruitsList[index]
                                                              .price
                                                              ?.substring(
                                                                  0,
                                                                  homeController
                                                                          .fruitsList[
                                                                              index]
                                                                          .price!
                                                                          .length -
                                                                      2),
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                        ),
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    Obx(
                                                      () =>
                                                          controller
                                                                  .fruitBoolList
                                                                  .value[index]
                                                              ? Container(
                                                                  height: 26,
                                                                  width: 71,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          // border: Border.all(),

                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                                offset: Offset(0, 0),
                                                                                blurRadius: 3,
                                                                                spreadRadius: 3,
                                                                                color: Color(0xff000000).withOpacity(controller.fruitBoolList[index] == true ? 0.2 : 0)),
                                                                          ],
                                                                          color: controller.fruitBoolList[index] == true
                                                                              ? AppColors.white
                                                                              : AppColors.primaryColor),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          controller
                                                                              .fruitMinusBtn(index);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              30,
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Image.asset("assets/icons/minus.png"),
                                                                        ),
                                                                      ),
                                                                      Spacer(),
                                                                      // TextWidget('-',color: AppColors.white,fontSize: 8,),
                                                                      TextWidget(
                                                                        controller
                                                                            .fruitCounterList
                                                                            .value[index]
                                                                            .toString(),
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                      Spacer(),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          controller
                                                                              .fruitAddBtn(index);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Image.asset("assets/icons/add.png"),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .fruitAddToCart(
                                                                            index);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 29,
                                                                    width: 28,
                                                                    decoration: BoxDecoration(
                                                                        color: AppColors
                                                                            .primaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(7)),
                                                                    child: Center(
                                                                        child: Image.asset(
                                                                      'assets/icons/addToCart.png',
                                                                      height:
                                                                          15,
                                                                      width: 15,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    )),
                                                                  ),
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
                                                color: Color(0xffFE6400),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(3))),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, top: 3),
                                              child: TextWidget(
                                                "${controller.fruitPercentage[index]}% off",
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return AppSize.size.w10;
                                  },
                                  itemCount:
                                      controller.fruitsList.value.length),
                            )
                          : Center(child: CircularProgressIndicator()),
                    ),
                    AppSize.size.h55,
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
