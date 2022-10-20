import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            appbar_title: 'My Cart',
            center_title: true,
            leading_image: "Add",
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
            child: controller.productListLength.value > 0
                ? cartDatasDesign()
                : cartEmptyDesign(),
          ),
        ));
  }

  Widget cartDatasDesign() {
    return Column(
      children: [
        AppSize.size.h20,
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
                  child: Container(
                      width: Get.size.width / 1.50,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Free delivery on all orders above",
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.black)),
                          TextSpan(
                              text: " ₹199",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black)),
                        ]),
                        maxLines: 1,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 9.0, bottom: 6),
                  child: Image.asset(
                    "assets/images/free_price-tag.png",
                    height: 36,
                    width: 36,
                  ),
                )
              ],
            ),
          ),
        ),
        // AppSize.size.h20,
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 15),
        //   child: Container(
        //     height: 45,
        //     child: TextFormField(
        //       controller: controller.search,
        //       maxLines: 1,
        //       style: TextStyle(
        //           color: Color(0xff000000),
        //           fontSize: 15,
        //           fontWeight: FontWeight.w400),
        //       onChanged: (value) {},
        //       decoration: InputDecoration(
        //         prefixIcon:
        //             ImageIcon(AssetImage('assets/icons/search.png')),
        //         hintText: "Search for vegetables and fruits",
        //         contentPadding: EdgeInsets.symmetric(vertical: 4),
        //         hintStyle: TextStyle(
        //             color: Color(0xff464646),
        //             fontWeight: FontWeight.w500),
        //         border: OutlineInputBorder(
        //             borderSide: BorderSide.none,
        //             borderRadius: BorderRadius.circular(30)),
        //         fillColor: Color(0xfff1f1f1),
        //         filled: true,
        //       ),
        //     ),
        //   ),
        // ),
        AppSize.size.h20,
        TextWidget(
          'Orders',
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        AppSize.size.h10,
        GetBuilder<CartController>(
          builder: (cart) => Expanded(
            child: SingleChildScrollView(
              child: cart.isProductsLoader.value
                  ? Column(
                      children: [
                        ListView.separated(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 30, top: 10),
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: Get.width,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Padding(
                                                //   padding:
                                                //       const EdgeInsets.only(
                                                //           left: 15, top: 10),
                                                //   child: SizedBox(
                                                //     height: 13,
                                                //     width: 13,
                                                //     child: Checkbox(
                                                //       shape:
                                                //           RoundedRectangleBorder(
                                                //         borderRadius:
                                                //             BorderRadius
                                                //                 .circular(
                                                //                     2.0),
                                                //       ),
                                                //       side:
                                                //           MaterialStateBorderSide
                                                //               .resolveWith(
                                                //         (states) => BorderSide(
                                                //             width: 0.75,
                                                //             color: Color(
                                                //                 0xffC0BEBE)),
                                                //       ),
                                                //       activeColor: AppColors
                                                //           .primaryColor,
                                                //       value: cart
                                                //           .checkBoxBoolList
                                                //           .value[index],
                                                //       onChanged: (value) {
                                                //         controller
                                                //             .onCheckBoxClick(
                                                //                 value, index);
                                                //       },
                                                //     ),
                                                //   ),
                                                // ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, top: 5),
                                                  child: Container(
                                                    height: 75,
                                                    width: 90,
                                                    child: Image.network(
                                                      (cart
                                                          .products
                                                          .value
                                                          .products?[index]
                                                          .thumb)!,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    // child: Image.asset(
                                                    //   cart.staticImage,
                                                    //   fit: BoxFit.contain,
                                                    // ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            AppSize.size.w10,
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    constraints: BoxConstraints(
                                                        maxWidth:
                                                            Get.width / 2.5),
                                                    child: TextWidget(
                                                      controller
                                                          .products
                                                          .value
                                                          .products?[index]
                                                          .name,
                                                      fontSize: 14.5,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.black,
                                                    )),
                                                AppSize.size.h5,
                                                Container(
                                                  width: Get.size.width / 2.5,
                                                  child: TextWidget(
                                                    cart
                                                        .products
                                                        .value
                                                        .products?[index]
                                                        .pnameTamil,
                                                    maxLines: 1,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.black,
                                                  ),
                                                ),
                                                AppSize.size.h5,
                                                TextWidget(
                                                    cart.products.value.weight,
                                                    fontSize: 10.5,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff666666)),
                                              ],
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  TextWidget(
                                                    cart
                                                        .products
                                                        .value
                                                        .products?[index]
                                                        .offerPrice,
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.black,
                                                  ),
                                                  TextWidget(
                                                    cart
                                                        .products
                                                        .value
                                                        .products?[index]
                                                        .actualPrice
                                                        ?.substring(
                                                            0,
                                                            (cart
                                                                    .products
                                                                    .value
                                                                    .products?[
                                                                        index]
                                                                    .actualPrice!
                                                                    .length)! -
                                                                2),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.black,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                  TextWidget(
                                                    "17%",
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffFF8A00),
                                                  ),
                                                  AppSize.size.h10,
                                                  Container(
                                                      height: 26,
                                                      width: 71,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        // border: Border.all(),

                                                        boxShadow: [
                                                          BoxShadow(
                                                            offset:
                                                                Offset(0, 0),
                                                            blurRadius: 3,
                                                            spreadRadius: 3,
                                                            color: Color(
                                                                    0xff000000)
                                                                .withOpacity(
                                                                    0.2),
                                                          )
                                                        ],
                                                        color: AppColors.white,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              cart.minus(index);
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image.asset(
                                                                  "assets/icons/minus.png"),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          TextWidget(
                                                            cart.counterList
                                                                .value[index]
                                                                .toString(),
                                                            color:
                                                                AppColors.black,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                          Spacer(),
                                                          GestureDetector(
                                                            onTap: () {
                                                              cart.add(index);
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
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        AppSize.size.h15,
                                        Divider(
                                          color: Color(0xffE5E5E5),
                                          height: 0.75,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {
                                        cart.add(index);
                                        // controller.cartButton(
                                        //     index, "plus");
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
                                        cart.minus(index);
                                        // controller.cartButton(
                                        //     index, "minus");
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 50,
                                        // color: Colors.blueGrey,
                                      ),
                                    )),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 0,
                            );
                          },
                          itemCount: (cart.products.value.products?.length)!,
                        )
                      ],
                    )
                  : CircularProgressIndicator(),
            ),
          ),
        ),
        Divider(
          color: Color(0xffE5E5E5),
          height: 0.75,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            children: [
              SizedBox(
                height: 33,
                width: 82,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.ADDRESS);
                  },
                  child: TextWidget(
                    'Checkout',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      primary: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                ),
              ),
              AppSize.size.w10,
              Container(
                height: 23,
                width: 136,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Color(0xffD6D6D6))),
                child: TextFormField(
                  controller: controller.cuponCode,
                  maxLines: 1,
                  onChanged: (value) {},
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 9.5,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    hintText: "Cupon Code",
                    contentPadding: EdgeInsets.only(left: 8, right: 5),
                    suffixIcon: SizedBox(
                      height: 23,
                      width: 49,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: TextWidget(
                          'Apply',
                          fontSize: 9.5,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColor,
                            padding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            )),
                      ),
                    ),
                    hintStyle: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 9.5,
                        fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6)),
                    fillColor: Color(0xffffffff),
                    filled: true,
                  ),
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Total: ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff141414)),
                        children: <TextSpan>[
                          TextSpan(
                            text: controller.products.value.totals?[1].text !=
                                    null
                                ? '${controller.products.value.totals?[1].text}'
                                : "₹0.00",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000)),
                          )
                        ]),
                  ),
                  TextWidget(
                    'Saved: ₹ ${controller.savedPrice.value}',
                    fontSize: 10.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff4A8D30),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget cartEmptyDesign() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppSize.size.h20,
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
                  child: Container(
                      width: Get.size.width / 1.50,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Free delivery on all orders above",
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.black)),
                          TextSpan(
                              text: " ₹199",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black)),
                        ]),
                        maxLines: 1,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 9.0, bottom: 6),
                  child: Image.asset(
                    "assets/images/free_price-tag.png",
                    height: 36,
                    width: 36,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 58,
        ),
        Text(
          "Your Shopping Cart is",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Empty!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SvgPicture.asset("assets/icons/Emoji.svg"),
          ],
        ),
      ],
    );
  }
}
