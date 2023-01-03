import 'package:carousel_slider/carousel_slider.dart';
import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/network/set_local_datas.dart';
import 'package:family_garden/screens/product_details_screen/controllers/product_details_controller.dart';
import 'package:family_garden/widgets/LoginWidget/pop_up_notification_view.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../../../widgets/custom_textfield.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  @override
  Widget build(BuildContext context) {
    controller.getCartCount();
    return WillPopScope(
      onWillPop: () async {
        int res = await controller.hitAddCartAPI();
        if(res == 0){
          Get.back();
          return true;
        }else{
          Get.back();
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: CustomAppbarView(
            leading_width: 50,
            appbar_leading: Container(
              width: 14,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: GestureDetector(
                        onTap: () async{
                          int res = await controller.hitAddCartAPI();
                          if(res == 0){
                            Get.back();
                          }else{
                            Get.back();
                          }
                        },
                        child: SvgPicture.asset(
                          'assets/icons/BackIcon.svg',
                          height: 24,
                          width: 24,
                        )),
                  )
                ],
              ),
            ),
            font_size: 19,
            appbar_title: controller.productDetails?.productName ?? "Orders",
            center_title: true,
            leading_image: "Add",
            appBarActions: GestureDetector(
              onTap: () async{

                int res = await controller.hitAddCartAPI();
                if(res == 0){
                  Get.toNamed(Routes.CART_SCREEN)?.then((value) {
                    controller.clearAll();
                    controller.getCartCount();
                  });
                }else{
                  Get.toNamed(Routes.CART_SCREEN)?.then((value) {
                    controller.clearAll();
                    controller.getCartCount();
                  });
                }
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 15),
                    child: Image.asset("assets/icons/cart.png",
                        height: 25, width: 25),
                  ),
                  Obx(
                    () => controller.cartCount.value == 0
                        ? Container()
                        : Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.topRight,
                            margin: const EdgeInsets.only(top: 7, left: 9.0),
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white,
                                  border: Border.all(
                                      color: AppColors.white, width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Center(
                                    child: TextWidget(
                                  "${controller.cartCount.value}",
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Obx(
          () => Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            child: Column(
              children: [
                controller.productDetailLoader.value
                    ? Spacer()
                    : Container(),
                GetBuilder<ProductDetailsController>(
                  builder: (value) => controller.productDetailLoader.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                          child: Column(
                            children: [
                              AppSize.size.h15,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15),
                                child: TextWidget(
                                  // 'Carrot',
                                  controller
                                      .productDetails?.productNameEnglish,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  textAlign: TextAlign.center,
                                  color: AppColors.black,
                                  // textOverflow: TextOverflow.ellipsis,
                                  // maxLines: 1,
                                ),
                              ),
                              AppSize.size.h8,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15),
                                child: TextWidget(
                                  // 'கேரட்',
                                  controller
                                      .productDetails?.productNameTamil,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                  textAlign: TextAlign.center,
                                  // textOverflow: TextOverflow.ellipsis,
                                  // maxLines: 1,
                                ),
                              ),
                              controller.carousalImages.value.length > 0
                                  ? SizedBox(
                                      height: 215,
                                      width: Get.width,
                                      child: Stack(
                                        children: [
                                          CarouselSlider.builder(
                                              carouselController: controller
                                                  .carouselController,
                                              itemCount: controller
                                                      .carousalImages
                                                      .isEmpty
                                                  ? 0
                                                  : controller
                                                      .carousalImages
                                                      .length,
                                              itemBuilder: (context, index,
                                                  realIndex) {
                                                return Container(
                                                  margin:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 15),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  10)),
                                                  child: controller
                                                          .carousalImages
                                                          .isEmpty
                                                      ? Image.asset(
                                                          controller
                                                                  .carouselImage[
                                                              index],
                                                          width: Get.width /
                                                              1.5,
                                                          fit: BoxFit.fill,
                                                        )
                                                      : Image.network(
                                                          controller
                                                              .carousalImages[
                                                                  index]
                                                              .thumb!),
                                                );
                                              },
                                              options: CarouselOptions(
                                                  // autoPlay: true,
                                                  viewportFraction: 1,
                                                  // scrollPhysics:
                                                  //     NeverScrollableScrollPhysics(),
                                                  enableInfiniteScroll:
                                                      true,
                                                  onPageChanged:
                                                      (index, reason) {
                                                    // controller.pageChanged(index);
                                                  })),
                                          Align(
                                            alignment:
                                                Alignment.centerRight,
                                            child: IconButton(
                                                onPressed: () {
                                                  controller
                                                      .carouselController
                                                      .nextPage();
                                                },
                                                icon: Icon(Icons
                                                    .arrow_forward_ios_outlined)),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: IconButton(
                                                onPressed: () {
                                                  controller
                                                      .carouselController
                                                      .previousPage();
                                                },
                                                icon: Icon(Icons
                                                    .arrow_back_ios_outlined)),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      height: 215,
                                      width: Get.width,
                                      child: Image.network((controller
                                          .productDetails?.thumb)!),
                                    ),
                              SizedBox(
                                height: 20,
                              ),
                              controller.productDetails?.options
                                          ?.isNotEmpty ??
                                      false
                                  ? SizedBox(
                                      height: 25,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                controller.selecteIndex
                                                    .value = index;
                                                controller
                                                    .onProductWeightSelected(
                                                        index);
                                                controller.update();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: controller
                                                                    .selecteIndex
                                                                    .value ==
                                                                10 ||
                                                            controller
                                                                    .selecteIndex
                                                                    .value !=
                                                                index
                                                        ? AppColors.white
                                                        : Color(0xffB6F1E7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    border: Border.all(
                                                        color: controller
                                                                        .selecteIndex
                                                                        .value ==
                                                                    10 ||
                                                                controller
                                                                        .selecteIndex
                                                                        .value !=
                                                                    index
                                                            ? Color(0xffE8E8E7)
                                                            : Colors.transparent)),
                                                child: Center(
                                                    child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8),
                                                  child: TextWidget(
                                                    controller
                                                        .productDetails
                                                        ?.options?[0]
                                                        .productOptionValue?[
                                                            index]
                                                        .name,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w600,
                                                    color: AppColors.black,
                                                  ),
                                                )),
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (context, index) {
                                            return AppSize.size.w7;
                                          },
                                          itemCount: controller
                                                  .productDetails
                                                  ?.options?[0]
                                                  .productOptionValue
                                                  ?.length ??
                                              0),
                                    )
                                  : Container(),
                              AppSize.size.h25,
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          'Description',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.black,
                                        ),
                                        AppSize.size.h5,
                                        Container(
                                          child: IntrinsicHeight(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Html(
                                                    data: controller
                                                        .productDetails
                                                        ?.description,
                                                    style: {
                                                      "h6": Style(
                                                        fontSize:
                                                            FontSize(14),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            AppColors.black,
                                                      ),
                                                      ".page-list": Style(
                                                          margin: EdgeInsets
                                                              .only(top: 0))
                                                    },
                                                  ),
                                                  // child: TextWidget(
                                                  //   'Carrot the juicy and crunchy vegetable is the favorite of many, and can be eaten raw, cooked, or prepared as a salad. Loaded with vitamins and minerals like calcium, vitamin K, A, beta carotene, and many more it takes care of our bone health and eyesight. Carrot is a veggie that is a must in your pantry.',
                                                  //   fontSize: 11,
                                                  //   fontWeight: FontWeight.w500,
                                                  //   color: Color(0xff333333),
                                                  // ),
                                                ),
                                                AppSize.size.w5,
                                                VerticalDivider(
                                                  width: 1.5,
                                                  thickness: 1.5,
                                                  color: Color(0xffE5E5E5),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        )),
                ),
                controller.productDetailLoader.value
                    ? Spacer()
                    : Container(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (controller.isLoggedIn.value) {
                            controller.onFavouriteButtonSelected();
                          } else {
                            Get.toNamed(Routes.LOGIN)?.then((value) {
                              controller.getLocalDatas();
                              controller.getCartCount();
                            });
                          }
                        },
                        child: controller
                                    .productDetails?.options?.isEmpty ??
                                true
                            ? Container()
                            : Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Color(0xffE9E9EA)),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/icons/favourite.png',
                                    color:
                                        controller.favourite.value == false
                                            ? Color(0xffDEDEDE)
                                            : Color(0xffFF8A00),
                                  ),
                                ),
                              ),
                      ),
                      AppSize.size.w15,
                      Container(
                        height: 32,
                        width: 127,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                  color: Color(0xff000000).withOpacity(
                                      controller.addToCart.value
                                          ? 0.2
                                          : 0)),
                            ],
                            color: controller.addToCart.value
                                ? AppColors.white
                                : AppColors.primaryColor),
                        child: controller.counter.value != 0
                            ? Container(
                                height: 26,
                                width: 71,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    // border: Border.all(),

                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 0),
                                          blurRadius: 3,
                                          spreadRadius: 3,
                                          color: Color(0xff000000)
                                              .withOpacity(controller
                                                          .counter.value !=
                                                      0
                                                  ? 0.2
                                                  : 0)),
                                    ],
                                    color: controller.counter.value != 0
                                        ? AppColors.white
                                        : AppColors.primaryColor),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 3.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 30,
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                                "assets/icons/minus_icon.svg"),
                                          ),
                                          Spacer(),
                                          // TextWidget('-',color: AppColors.white,fontSize: 8,),
                                          TextWidget(
                                            controller.counter.toString(),
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              controller.add();
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                  "assets/icons/plus_icon.svg"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        top: 0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller.minus();
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 63.5,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller.add();
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 63.5,
                                                color: Colors.transparent,
                                              ),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  controller.add();
                                },
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/addToCart.png',
                                              height: 13,
                                              width: 13,
                                              fit: BoxFit.fill,
                                            ),
                                            AppSize.size.w5,
                                            TextWidget(
                                              'Add',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        child: Container(
                                      height: 50,
                                      width: 127,
                                      color: Colors.transparent,
                                    ))
                                  ],
                                ),
                              ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextWidget(
                            controller.offerPrice.value,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          TextWidget(
                            controller.price.value,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff6A6A6A),
                            decoration: TextDecoration.lineThrough,
                          ),
                          TextWidget(controller.productDetails?.percentOff,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFF8A00)),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
