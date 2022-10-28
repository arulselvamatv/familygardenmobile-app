import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:family_garden/screens/offers_screen/controller/offers_controller.dart';
import 'package:family_garden/screens/product_listing_screen/controllers/products_listing_controller.dart';
import '../../../models/category_product_model.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../../../widgets/custom_text.dart';

class OffersView extends GetView<OffersController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OffersController());
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        height: Get.height,
        decoration: const BoxDecoration(
            color: Color(0xffF3F3F3),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )),
        child: Container(
          height: Get.height,
          width: Get.width,
          child: GetBuilder<OffersController>(
            builder: (OffersController) => controller
                    .isCategoryProductLoader.value
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemCount: controller.products.value.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // controller.categoriesIndex.value =
                          //     index;
                          // controller.hitAddCartAPI();
                          Get.toNamed(Routes.PRODUCT_DETAILS_SCREEN,
                              arguments: controller.products[index].productId);
                          controller.update();
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 130,
                              color: AppColors.white,
                              width: Get.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 14,
                                        bottom: 12,
                                        top: 29,
                                        right: 20),
                                    child: Container(
                                      height: 90,
                                      width: 90,
                                      child: controller.products[index].thumb ==
                                              null
                                          ? Image.asset(
                                              controller.staticImage.value,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.network(
                                              controller.products[index].thumb!,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: Get.width / 2.5,
                                          child: TextWidget(
                                            controller.products[index].name,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            maxLines: 1,
                                            textOverflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        AppSize.size.h5,
                                        Container(
                                          width: Get.width / 2.5,
                                          child: TextWidget(
                                            controller
                                                .products[index].pnameTamil,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            maxLines: 1,
                                            textOverflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        AppSize.size.h5,
                                        TextWidget(
                                          controller.products[index].special,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        Spacer(),
                                        TextWidget(
                                          controller.products[index].price,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration
                                              .lineThrough, //updated this
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 16, bottom: 14),
                                      child: GestureDetector(
                                        onTap: () {
                                          // controller
                                          //     .cartButton(index);
                                        },
                                        child: Container(
                                          height: 26,
                                          width: 71,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              // border: Border.all(),

                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(0, 0),
                                                    blurRadius: 3,
                                                    spreadRadius: 3,
                                                    color: Color(0xff000000)
                                                        .withOpacity(
                                                            controller.cartBoolList[
                                                                        index] ==
                                                                    true
                                                                ? 0.2
                                                                : 0)),
                                              ],
                                              color: controller.cartBoolList[
                                                          index] ==
                                                      true
                                                  ? AppColors.white
                                                  : AppColors.primaryColor),
                                          child: controller
                                                      .cartBoolList[index] ==
                                                  true
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        // controller
                                                        //     .minus(index);
                                                      },
                                                      child: Container(
                                                        width: 30,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Image.asset(
                                                            "assets/icons/minus.png"),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    // TextWidget('-',color: AppColors.white,fontSize: 8,),
                                                    TextWidget(
                                                      controller
                                                          .counterList[index]
                                                          .toString(),
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    Spacer(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // controller
                                                        //     .add(index);
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Image.asset(
                                                            "assets/icons/add.png"),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15,
                                                      vertical: 6),
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white,
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
                                  //this block working
                                  onTap: () {
                                    controller.cartButton(index, "plus");
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
                                    controller.cartButton(index, "minus");
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
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(15))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 5),
                                  child: TextWidget(
                                    controller.products[index].percentOff,
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
                  ),
          ),
        ),
      ),
    );
  }
}
