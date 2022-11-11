import 'package:family_garden/routes/app_pages.dart';
import '../../../network/api_helper.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/loading_widget.dart';
import '../controllers/wishlist_screen_controller.dart';

class WishListScreenView extends GetView<WishListScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListScreenController>(
      builder: (s) => WillPopScope(
        onWillPop: () async {
          // controller.hitAddCartAPI();
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
              appbar_title: "Wishlist",
              center_title: true,
              leading_image: "Add",
              appBarActions: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.CART_SCREEN)
                          ?.then((value) => controller.getCartCount());
                      // controller.hitAddCartAPI();
                      // Get.toNamed(Routes.CART_SCREEN)?.then((value) =>
                      //     controller.getCategoryProduct(
                      //         controller.categoryId.value));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, top: 15),
                      child: Image.asset("assets/icons/cart.png",
                          height: 25, width: 25),
                    ),
                  ),
                  Obx(
                    () => controller.cartCount.value == "0"
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
                                  controller.cartCount.value,
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
          body: Obx(
            () => Container(
              height: Get.size.height,
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: controller.isProductLoader.value
                  ? Center(
                      child: const Loading(),
                    )
                  : controller.products.length == 0
                      ? Container(
                          width: Get.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/wishlist-empty.png'),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Your wishlist was empty!")
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                          children: [
                            ListView.separated(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                primary: false,
                                padding: EdgeInsets.only(bottom: 30),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.PRODUCT_DETAILS_SCREEN,
                                              arguments: controller
                                                  .products[index].productId)
                                          ?.then((value) =>
                                              controller.getCartCount());
                                    },
                                    child: Container(
                                      height: 130,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 14,
                                                bottom: 12,
                                                top: 29,
                                                right: 20),
                                            child: SizedBox(
                                                height: 90,
                                                width: 90,
                                                child: Image.network(
                                                  controller
                                                      .products[index].thumb!,
                                                  fit: BoxFit.fill,
                                                  height: 90,
                                                  width: 90,
                                                )),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              var productData = {
                                                "product_info": [
                                                  {
                                                    "product_id": controller
                                                        .products[index]
                                                        .productId,
                                                    "qty": 1,
                                                    "product_option_id":
                                                        controller
                                                            .products[index]
                                                            .selectedOptionId,
                                                    "prodcut_option_value_id":
                                                        controller
                                                            .products[index]
                                                            .selectedOptionValueId,
                                                    "action": "ADD"
                                                  }
                                                ]
                                              };
                                              var response =
                                                  await ApiHelper.addCart(
                                                      productData);
                                              print(response.responseCode);
                                              if (response.responseCode ==
                                                  200) {
                                                int count = int.parse(controller
                                                            .cartCount.value ==
                                                        ""
                                                    ? "0"
                                                    : controller
                                                        .cartCount.value);
                                                controller.cartCount.value =
                                                    "${count + 1}";
                                                controller.products[index]
                                                    .addToCart = true;
                                                controller.products.refresh();
                                              }
                                              print("OnTap");
                                            },
                                            child: SizedBox(
                                              width: Get.width / 2.40,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      // width: Get.width / 2.6,
                                                      child: TextWidget(
                                                        controller
                                                            .products[index]
                                                            .name,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        maxLines: 3,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                      ),
                                                    ),
                                                    AppSize.size.h5,
                                                    Text(controller
                                                            .products[index]
                                                            .optionValue ??
                                                        ""),
                                                    Spacer(),
                                                    Obx(
                                                      () => Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20.0,
                                                                right: 20.0,
                                                                top: 5.0,
                                                                bottom: 5.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0),
                                                          color: controller
                                                                      .products[
                                                                          index]
                                                                      .addToCart ==
                                                                  true
                                                              ? AppColors
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      0.5)
                                                              : AppColors
                                                                  .primaryColor,
                                                        ),
                                                        child: TextWidget(
                                                          "Add to Cart",
                                                          fontSize: 12,
                                                          color:
                                                              AppColors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Padding(
                                            padding: EdgeInsets.only(right: 17),
                                            child: SizedBox(
                                              width: 75,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    TextWidget(
                                                      controller.products[index]
                                                          .stock,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      maxLines: 1,
                                                      color: Colors.red,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    AppSize.size.h5,
                                                    TextWidget(
                                                      controller.products[index]
                                                          .special,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      maxLines: 1,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 2.0)),
                                                    TextWidget(
                                                      controller.products[index]
                                                          .price,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                    Spacer(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller.removeWishlist(
                                                            controller
                                                                .products[index]
                                                                .wishlistId!);
                                                        Get.snackbar('success',
                                                            "Removed");
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 10,
                                                                top: 5.0,
                                                                bottom: 5.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0),
                                                          color: Colors.amber,
                                                        ),
                                                        child: TextWidget(
                                                          "Remove",
                                                          fontSize: 12,
                                                          color:
                                                              AppColors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: AppColors.lightGrey,
                                    height: 1,
                                  );
                                },
                                itemCount: controller.products.length)
                          ],
                        )),
            ),
          ),
          bottomNavigationBar: controller.products.length == 0
              ? SizedBox()
              : Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: SizedBox(
                      height: 50,
                      width: Get.width,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13))),
                          child: TextWidget(
                            'Continue',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          )),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
