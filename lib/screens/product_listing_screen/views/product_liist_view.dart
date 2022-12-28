import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter_svg/svg.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: Obx(
          () => CustomAppbarView(
            leading_width: 50,
            appbar_leading: Container(
              width: 14,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: GestureDetector(
                        onTap: () {
                          Get.back();
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
            appbar_title: controller.title.value,
            center_title: true,
            leading_image: "Add",
            appBarActions: GestureDetector(
              onTap: () async {
                print("Data");
                int isSuccess = await controller.hitAddCartAPI();
                if(isSuccess == 0){
                  Get.toNamed(Routes.CART_SCREEN)?.then((value) {
                    controller.productData.value = {"product_info": []};
                    controller.refresh();
                  });
                }else{
                  Get.toNamed(Routes.CART_SCREEN)?.then((value) {
                    controller.productData.value = {"product_info": []};
                    controller.refresh();
                  });
                }
                controller.update();
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 15),
                    child: Image.asset("assets/icons/cart.png",
                        height: 25, width: 25),
                  ),
                  controller.cartCount.value == 0
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
                                  child: Obx(
                                () => TextWidget(
                                  controller.cartCount.value.toString(),
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(
          ()=> Container(
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
              : Padding(
                  padding: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 45,
                    child: TextFormField(
                      controller: controller.searchController,
                      maxLines: 1,
                      onChanged: (value) {},
                      onTap: () {
                        Get.toNamed(Routes.SEARCH_SCREEN)
                            ?.then((value) {
                          controller.getCartCount();
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
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 4),
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
                                onTap: (){
                                  controller.categoriesOnTap(index);
                                  // controller.categoriesIndex.value = index;
                                  // controller.title.value = (controller.categoriesList.value[index].name)!;
                                  // controller.update();
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.white,
                                      ),
                                      child: controller
                                          .categoriesList[
                                      index]
                                          .image ==
                                          null
                                          ? CircleAvatar(
                                        backgroundImage:
                                        AssetImage(
                                            controller
                                                .staticImage
                                                .value),
                                      )
                                          : CircleAvatar(
                                        backgroundImage:
                                        NetworkImage(
                                            controller
                                                .categoriesList[
                                            index]
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
                                          fontWeight:
                                          FontWeight.w400,
                                          color: AppColors.black,
                                          textAlign:
                                          TextAlign.center,
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
                                              BorderRadius
                                                  .circular(10),
                                              color: AppColors
                                                  .primaryColor),
                                        ),
                                      ),
                                  ],
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
               Expanded(
                  child: controller.isProductLoader.value
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                      controller: controller.scrollController,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 30),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            if( controller.products.value[index]
                                .quantity! !=
                                "0"){
                              int isSuccess = await controller.hitAddCartAPI();
                              if(isSuccess == 0){
                                Get.toNamed(
                                    Routes
                                        .PRODUCT_DETAILS_SCREEN,
                                    arguments: controller
                                        .products[index]
                                        .productId)
                                    ?.then((value) {
                                  controller.productData.value = {"product_info": []};
                                  controller.getCartCount();
                                });
                              }else{
                                Get.toNamed(
                                    Routes
                                        .PRODUCT_DETAILS_SCREEN,
                                    arguments: controller
                                        .products[index]
                                        .productId)
                                    ?.then((value) {
                                  controller.productData.value = {"product_info": []};
                                  controller.getCartCount();
                                });
                              }
                            }
                            controller.update();
                          },
                          child: Stack(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 135,
                                    color: AppColors.white,
                                    width: Get.width,
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .end,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets
                                              .only(
                                              left: 14,
                                              bottom: 12,
                                              top: 29,
                                              right: 7),
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
                                              fit: BoxFit
                                                  .fill,
                                            )
                                                : Image.network(
                                              controller
                                                  .products[
                                              index]
                                                  .thumb!,
                                              fit: BoxFit
                                                  .fill,
                                              opacity: AlwaysStoppedAnimation(
                                                  controller.products.value[index].quantity! ==
                                                      "0"
                                                      ? 0.5
                                                      : 1),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets
                                              .symmetric(
                                              vertical: 12),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .start,
                                            children: [
                                              Container(
                                                width:
                                                Get.width /
                                                    1.6,
                                                child:
                                                TextWidget(
                                                  controller
                                                      .products[
                                                  index]
                                                      .name,
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight
                                                      .w600,
                                                  maxLines: 1,
                                                  textOverflow:
                                                  TextOverflow
                                                      .ellipsis,
                                                ),
                                              ),
                                              AppSize.size.h5,
                                              SizedBox(
                                                width:
                                                Get.width /
                                                    1.6,
                                                child:
                                                TextWidget(
                                                  controller
                                                      .products[
                                                  index]
                                                      .pnameTamil,
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight
                                                      .w500,
                                                  maxLines: 1,
                                                  textOverflow:
                                                  TextOverflow
                                                      .ellipsis,
                                                ),
                                              ),
                                              AppSize.size.h5,
                                              controller
                                                  .products
                                                  .value[
                                              index]
                                                  .option!
                                                  .isNotEmpty
                                                  ? Container(
                                                  height:
                                                  21,
                                                  width: Get
                                                      .width /
                                                      2.6,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(
                                                          5),
                                                      border: Border.all(
                                                          color: Colors
                                                              .grey,
                                                          width:
                                                          0.5)),
                                                  child: controller
                                                      .isProductLoader
                                                      .value
                                                      ? null
                                                      : controller.products.value[index].option!.isNotEmpty
                                                      ? DropdownButtonHideUnderline(
                                                    child: DropdownButton2(
                                                      items: controller.products.value[index].option?[0].productOptionValue
                                                          ?.map((item) => DropdownMenuItem<String>(
                                                        value: item.productOptionValueId.toString(),
                                                        child: SizedBox(
                                                          width: Get.width / 3.2,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 5.0),
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
                                                        ),
                                                      ))
                                                          .toList(),
                                                      value: controller.products.value[index].selectedProductOptionValueId!= "" ? controller.products.value[index].selectedProductOptionValueId : controller.products.value[index].option?[0].productOptionValue?[0].productOptionValueId.toString(),
                                                      onChanged: (value) {
                                                        controller.dropdownChanged(index,value);
                                                      },
                                                      buttonHeight: 35,
                                                      buttonWidth: 160,
                                                      itemHeight: 50,
                                                    ),
                                                  )
                                                      : null)
                                                  : Container(),
                                              AppSize.size.h5,
                                              SizedBox(
                                                width:
                                                Get.width /
                                                    1.45,
                                                height: 40,
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        TextWidget(
                                                          controller
                                                              .products[index]
                                                              .special,
                                                          fontSize:
                                                          17,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                        ),
                                                        Spacer(),
                                                        TextWidget(
                                                          controller
                                                              .products[index]
                                                              .price,
                                                          fontSize:
                                                          12,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          decoration:
                                                          TextDecoration.lineThrough,
                                                        )
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    controller.products.value[index].quantity ==
                                                        "0"
                                                        ? Container()
                                                        : Container(
                                                      child:
                                                      Padding(
                                                        padding: const EdgeInsets.only(right: 16, bottom: 14),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            controller.addCartBtn(index, "CART");
                                                            // controller
                                                            //     .cartButton(index);
                                                          },
                                                          child: Obx(
                                                            ()=> Container(
                                                              height: 26,
                                                              width: 71,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(20),
                                                                  // border: Border.all(),
                                                                  boxShadow: [
                                                                    BoxShadow(offset: Offset(0, 0), blurRadius: 3, spreadRadius: 3, color: Color(0xff000000).withOpacity(controller.products[index] != 0 ? 0.2 : 0)),
                                                                  ],
                                                                  color: controller.products[index].counter != 0 ? AppColors.white : AppColors.primaryColor),
                                                              child: controller.products[index].counter != 0
                                                                  ? Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      controller.addCartBtn(index,controller.products[index].counter ==0 ?"ADD":"MINUS");
                                                                      // controller
                                                                      //     .minus(index);
                                                                    },
                                                                    child: Container(
                                                                      width: 30,
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: Image.asset("assets/icons/minus.png"),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  // TextWidget('-',color: AppColors.white,fontSize: 8,),
                                                                  TextWidget(
                                                                    controller.products[index].counter.toString(),
                                                                    color: Colors.black,
                                                                    fontSize: 13,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      controller.addCartBtn(index,"ADD");
                                                                      // controller
                                                                      //     .add(index);
                                                                    },
                                                                    child: Container(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: Image.asset("assets/icons/add.png"),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                                  : Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                                                                child: Row(
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
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      top: 30,
                                      left: 0,
                                      child: controller
                                          .products
                                          .value[index]
                                          .quantity ==
                                          "0"
                                          ? Padding(
                                        padding:
                                        const EdgeInsets
                                            .only(
                                            bottom:
                                            12,
                                            top: 29,
                                            right:
                                            20),
                                        child: Container(
                                          height: 35,
                                          width: 115,
                                          child: Image.asset(
                                              "assets/images/out-of-stock.png"),
                                        ),
                                      )
                                          : Container())
                                ],
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: controller
                                      .products
                                      .value[index]
                                      .quantity! !=
                                      "0"
                                      ? InkWell(
                                    onTap: () {
                                      controller.addCartBtn(index, "ADD");
                                      // controller
                                      //     .cartButton(
                                      //     index,
                                      //     "plus");
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 50,
                                      // color: Colors.brown,
                                    ),
                                  )
                                      : Container()),
                              Positioned(
                                  bottom: 0,
                                  right: 50,
                                  child: controller
                                      .products
                                      .value[index]
                                      .quantity! !=
                                      "0"
                                      ? InkWell(
                                    onTap: () {
                                      controller.addCartBtn(index,controller.products[index].counter==0? "ADD":"MINUS");
                                      // controller
                                      //     .cartButton(
                                      //     index,
                                      //     "minus");
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 50,
                                      // color: Colors.blueGrey,
                                    ),
                                  )
                                      : Container()),
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
                                          Radius
                                              .circular(
                                              15))),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        left: 5, top: 5),
                                    child: TextWidget(
                                      controller.products[index]
                                          .percentOff,
                                      fontSize: 10,
                                      fontWeight:
                                      FontWeight.w600,
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
                controller.isBottomLoader.value?const Center(child: CircularProgressIndicator()):Container()
              ],
            ),
                ),
        ),
      ),
    );
  }
}
