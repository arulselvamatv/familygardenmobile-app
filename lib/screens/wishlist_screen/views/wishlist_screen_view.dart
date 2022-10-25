import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:family_garden/screens/product_details_screen/controllers/product_details_controller.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../../../widgets/custom_textfield.dart';
import '../controllers/wishlist_screen_controller.dart';

class WishListScreenView extends GetView<WishListScreenController> {
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
              child:  CustomAppbarView(
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
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.only(top: 10, left: 3.0),
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                              border:
                              Border.all(color: AppColors.white, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Center(
                                child: TextWidget(
                                  "0",
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

            ),
            body: Container(
              decoration: const BoxDecoration(
                  color: Color(0xffF3F3F3),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: controller.isProductLoader.value
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : Column(
                    children: [

                      Flexible(
                        child: SizedBox(
                          height: double.infinity,
                          child: SingleChildScrollView(
                            child: GetBuilder<WishListScreenController>(
                              builder: (WishListScreenController) => Expanded(
                                child: controller.isProductLoader.value
                                    ? Center(child: CircularProgressIndicator())
                                    : ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    primary: false,
                                    padding: EdgeInsets.only(bottom: 30),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        // onTap: () {
                                        //   controller.categoriesIndex.value =
                                        //       index;
                                        //   controller.hitAddCartAPI();
                                        //   Get.toNamed(
                                        //       Routes.PRODUCT_DETAILS_SCREEN,
                                        //       arguments: controller
                                        //           .products[index]
                                        //           .productId)
                                        //       ?.then((value) => controller
                                        //       .getCategoryProduct(controller
                                        //       .categoryId.value));
                                        //   controller.update();
                                        // },
                                        child: Container(
                                          height: 130,
                                          width: Get.width,
                                          child: Row(
                                            children: [

                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 14, bottom: 12, top: 29, right: 20),
                                                  child: SizedBox(
                                                      height: 90,
                                                      width: 90,
                                                      child: Image.asset(
                                                        controller.staticImage.value,
                                                        fit: BoxFit.fill,
                                                      )
                                                  ),
                                                ),
                                              ),

                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [

                                                      SizedBox(
                                                        width: Get.width / 2.5,
                                                        child: TextWidget(
                                                          "Carrot",
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          maxLines: 1,
                                                          textOverflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),

                                                      AppSize.size.h5,

                                                      SizedBox(
                                                        width:
                                                        Get.width / 2.5,
                                                        child: TextWidget(
                                                          "கேரட்",
                                                          fontSize: 13,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          maxLines: 1,
                                                          textOverflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),

                                                      TextWidget(
                                                        "250 grams",
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w600,
                                                        color: AppColors.black.withOpacity(0.5),
                                                      ),

                                                      Spacer(),

                                                      Container(
                                                        padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 5.0,bottom: 5.0),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(25.0),
                                                          color: AppColors.primaryColor,
                                                        ),
                                                        child: TextWidget(
                                                          "Add to Cart",
                                                          fontSize: 12,
                                                          color: AppColors.white,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),


                                              Expanded(
                                                child: Padding(
                                                    padding: const EdgeInsets.only(right: 20,top: 16,bottom: 16),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [

                                                      TextWidget(
                                                        "out of stock",
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w600,
                                                        maxLines: 1,
                                                        color: Colors.red,
                                                        textOverflow: TextOverflow.ellipsis,
                                                      ),

                                                      AppSize.size.h5,

                                                      TextWidget(
                                                        "₹32",
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        maxLines: 1,
                                                        textOverflow:
                                                        TextOverflow
                                                            .ellipsis,
                                                      ),

                                                      Padding(padding: EdgeInsets.only(top: 2.0)),

                                                      TextWidget(
                                                        "₹35.00",
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        decoration: TextDecoration.lineThrough,
                                                      ),

                                                      Spacer(),

                                                      Container(
                                                        padding: EdgeInsets.only(left: 6.0,right: 6.0,top: 5.0,bottom: 5.0),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(25.0),
                                                          color: Colors.amber,
                                                        ),
                                                        child: TextWidget(
                                                          "Remove",
                                                          fontSize: 12,
                                                          color: AppColors.white,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                        ),
                                                      )
                                                    ],
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
                                   // itemCount: controller.products.value.length
                                    itemCount: 10
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                        child: SizedBox(
                          height: 50,
                          width: Get.width,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13))),
                              child: TextWidget(
                                'Continue',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              )),
                        ),
                      )
                    ],
                  ),
            )
        ),
      ),
    );
  }
}


