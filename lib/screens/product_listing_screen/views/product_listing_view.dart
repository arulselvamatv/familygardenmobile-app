import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:family_garden/screens/product_listing_screen/controllers/products_listing_controller.dart';
import '../../../models/category_product_model.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../../../widgets/custom_text.dart';

class ProductListingView extends GetView<ProductListingController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          controller.hitAddCartAPI();
          Get.back();
          return true;
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
                            onTap: () {
                              controller.hitAddCartAPI();
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/icons/backButton.png',
                              height: 24,
                              width: 24,
                            )),
                      )
                    ],
                  ),
                ),
                font_size: 19,
                appbar_title: controller.title.value == ""
                    ? controller.categoryName.value
                    : controller.title.value,
                center_title: true,
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                  color: Color(0xffF3F3F3),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: controller.isCategoryLoader.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSize.size.h15,
                        SizedBox(
                          width: Get.width,
                          child: Stack(
                            fit: StackFit.loose,
                            children: [
                              Positioned(
                                bottom: 2,
                                child: Container(
                                  height: 0.75,
                                  width: Get.width,
                                  color: Color(0xffDBDBDB),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                height: 85,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          controller.hitAddCartAPI();
                                          controller.categoriesOnTap(index);
                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.white,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: controller
                                                              .categoriesList[
                                                                  index]
                                                              .image ==
                                                          null
                                                      ? Image.asset(controller
                                                          .staticImage.value)
                                                      : Image.network(controller
                                                          .categoriesList[index]
                                                          .image),
                                                ),
                                              ),
                                              AppSize.size.h10,
                                              Container(
                                                  constraints: BoxConstraints(
                                                      maxWidth: 64),
                                                  child: TextWidget(
                                                    controller
                                                        .categoriesList[index]
                                                        .name,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.black,
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                              Spacer(),
                                              Visibility(
                                                visible: controller
                                                        .categoriesIndex
                                                        .value ==
                                                    index,
                                                child: Container(
                                                  height: 4.5,
                                                  width: 45,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: AppColors
                                                          .primaryColor),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return AppSize.size.w20;
                                    },
                                    itemCount:
                                        controller.categoriesList.length),
                              ),
                            ],
                          ),
                        ),
                        AppSize.size.h15,
                        GetBuilder<ProductListingController>(
                          builder: (productListController) => Expanded(
                            child: controller.isCategoryProductLoader.value
                                ? Center(child: CircularProgressIndicator())
                                : ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(bottom: 30),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          controller.hitAddCartAPI();
                                          Get.toNamed(
                                              Routes.PRODUCT_DETAILS_SCREEN,
                                              arguments: controller
                                                  .products[index].productId);
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 130,
                                              color: AppColors.white,
                                              width: Get.width,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14,
                                                            bottom: 12,
                                                            top: 29,
                                                            right: 20),
                                                    child: Container(
                                                      height: 90,
                                                      width: 90,
                                                      child: controller
                                                                  .products[
                                                                      index]
                                                                  .thumb ==
                                                              null
                                                          ? Image.asset(
                                                              controller
                                                                  .staticImage
                                                                  .value,
                                                              fit: BoxFit.fill,
                                                            )
                                                          : Image.network(
                                                              controller
                                                                  .products[
                                                                      index]
                                                                  .thumb!,
                                                              fit: BoxFit.fill,
                                                            ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 12),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width:
                                                              Get.width / 2.5,
                                                          child: TextWidget(
                                                            controller
                                                                .products[index]
                                                                .name,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            maxLines: 1,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        AppSize.size.h5,
                                                        Container(
                                                          width:
                                                              Get.width / 2.5,
                                                          child: TextWidget(
                                                            controller
                                                                .products[index]
                                                                .pnameTamil,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            maxLines: 1,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        AppSize.size.h5,
                                                        controller
                                                                .products
                                                                .value[index]
                                                                .option!
                                                                .isNotEmpty
                                                            ? Container(
                                                                height: 21,
                                                                width:
                                                                    Get.width /
                                                                        2.6,
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
                                                                child: controller
                                                                        .isCategoryProductLoader
                                                                        .value
                                                                    ? null
                                                                    : controller
                                                                            .products
                                                                            .value[index]
                                                                            .option!
                                                                            .isNotEmpty
                                                                        ? DropdownButtonHideUnderline(
                                                                            child:
                                                                                DropdownButton2(
                                                                              // iconDisabledColor: MyColors.white,
                                                                              // iconEnabledColor: MyColors.white,
                                                                              // style: TextStyle(color: MyColors.white, fontSize: 16),
                                                                              // hint: const Text(
                                                                              //   'Select Location',
                                                                              //   style: TextStyle(color: MyColors.white, fontSize: 15),
                                                                              // ),
                                                                              items: controller.products.value[index].option?[0].productOptionValue
                                                                                  ?.map((item) => DropdownMenuItem<String>(
                                                                                        value: item.productOptionValueId.toString(),
                                                                                        child: SizedBox(
                                                                                          width: Get.width / 3.2,
                                                                                          child: Text(
                                                                                            "${item.name}-${item.price}",
                                                                                            maxLines: 1,
                                                                                            // overflow: TextOverflow.ellipsis,
                                                                                            style: const TextStyle(
                                                                                              // color: MyColors.gray,
                                                                                              fontSize: 12,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ))
                                                                                  .toList(),
                                                                              value: controller.selectedDropdownValue.value[index].isNotEmpty ? controller.selectedDropdownValue.value[index] : controller.products.value[index].option?[0].productOptionValue?[0].productOptionValueId.toString(),
                                                                              onChanged: (value) {
                                                                                controller.optionId.value[index] = controller.products[index].option?[0].productOptionId;
                                                                                controller.selectedDropdownValue.value[index] = value as String;
                                                                                controller.optionValueId.value[index] = value as String;
                                                                                controller.update();
                                                                              },
                                                                              buttonHeight: 35,
                                                                              buttonWidth: 160,
                                                                              itemHeight: 50,
                                                                            ),
                                                                          )
                                                                        : null)
                                                            : Container(),
                                                        AppSize.size.h5,
                                                        TextWidget(
                                                          controller
                                                              .products[index]
                                                              .special,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        Spacer(),
                                                        TextWidget(
                                                          controller
                                                              .products[index]
                                                              .price,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 16,
                                                              bottom: 14),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          // controller
                                                          //     .cartButton(index);
                                                        },
                                                        child: Container(
                                                          height: 26,
                                                          width: 71,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  // border: Border.all(),

                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        offset: Offset(
                                                                            0,
                                                                            0),
                                                                        blurRadius:
                                                                            3,
                                                                        spreadRadius:
                                                                            3,
                                                                        color: Color(0xff000000).withOpacity(controller.cartBoolList[index] ==
                                                                                true
                                                                            ? 0.2
                                                                            : 0)),
                                                                  ],
                                                                  color: controller.cartBoolList[
                                                                              index] ==
                                                                          true
                                                                      ? AppColors
                                                                          .white
                                                                      : AppColors
                                                                          .primaryColor),
                                                          child: controller
                                                                          .cartBoolList[
                                                                      index] ==
                                                                  true
                                                              ? Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        // controller
                                                                        //     .minus(index);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            30,
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child: Image.asset(
                                                                            "assets/icons/minus.png"),
                                                                      ),
                                                                    ),
                                                                    Spacer(),
                                                                    // TextWidget('-',color: AppColors.white,fontSize: 8,),
                                                                    TextWidget(
                                                                      controller
                                                                          .counterList[
                                                                              index]
                                                                          .toString(),
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                    Spacer(),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        // controller
                                                                        //     .add(index);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child: Image.asset(
                                                                            "assets/icons/add.png"),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              : Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          15,
                                                                      vertical:
                                                                          6),
                                                                  child: Row(
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        'assets/icons/addToCart.png',
                                                                        height:
                                                                            13,
                                                                        width:
                                                                            13,
                                                                        fit: BoxFit
                                                                            .fill,
                                                                      ),
                                                                      AppSize
                                                                          .size
                                                                          .w5,
                                                                      TextWidget(
                                                                        'Add',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color: Colors
                                                                            .white,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.cartButton(
                                                        index, "plus");
                                                  },
                                                  child: Container(
                                                    height: 60,
                                                    width: 50,
                                                    // color: Colors.brown,
                                                  ),
                                                )),
                                            Positioned(
                                                bottom: 0,
                                                right: 50,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.cartButton(
                                                        index, "minus");
                                                  },
                                                  child: Container(
                                                    height: 60,
                                                    width: 50,
                                                    // color: Colors.blueGrey,
                                                  ),
                                                )),
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                height: 21,
                                                width: 53,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffFE6400),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, top: 5),
                                                  child: TextWidget(
                                                    controller.products[index]
                                                        .percentOff,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return AppSize.size.h10;
                                    },
                                    itemCount:
                                        controller.products.value.length),
                          ),
                        ),
                      ],
                    ),
            )),
      ),
    );
  }
}
