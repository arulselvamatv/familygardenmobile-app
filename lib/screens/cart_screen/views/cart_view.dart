import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/network/set_local_datas.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/LoginWidget/pop_up_notification_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  // const CartView({super.key});
  @override
  var controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        int response = await controller.hitAddCartAPI();
        if (response == 0) {
          Get.back();
          return true;
        } else {
          Get.back();
          return true;
        }
      },
      child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: CustomAppbarView(
              leading_width: 50,
              appbar_leading: Container(
                width: 14,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: GestureDetector(
                          onTap: () async {
                            int response = await controller.hitAddCartAPI();
                            if (response == 0) {
                              Get.back();
                            } else {
                              Get.back();
                            }
                          },
                          child: SvgPicture.asset(
                            'assets/icons/BackIcon.svg',
                            fit: BoxFit.scaleDown,
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
              child: controller.isProductsLoader.value
                  ? const Center(child: CircularProgressIndicator())
                  : controller.productListLength.value <= 0 ||
                          controller.counterList.value.isEmpty
                      ? cartEmptyDesign(context)
                      : cartDatasDesign(context),
            ),
          )),
    );
  }

  Widget cartDatasDesign(context) {
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
                        text: const TextSpan(children: [
                          const TextSpan(
                              text: "Free delivery on all orders above",
                              style: TextStyle(
                                  fontSize: 14, color: AppColors.black)),
                          const TextSpan(
                              text: " ₹199",
                              style: const TextStyle(
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
              child: Column(
                children: [
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 30, top: 10),
                    itemBuilder: (context, index) {
                      return controller.counterList.value[index] == "0"
                          ? Container()
                          : Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.PRODUCT_DETAILS_SCREEN,arguments: controller.products.value.products?[index].productId)?.then((value) =>controller.getCartListDatas());
                                  },
                                  child: SizedBox(
                                    width: Get.width,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
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
                                                cart
                                                            .products
                                                            .value
                                                            .products?[index]
                                                            .value ==
                                                        "null"
                                                    ? Container()
                                                    : TextWidget(
                                                        cart
                                                            .products
                                                            .value
                                                            .products?[index]
                                                            .value
                                                            .toString(),
                                                        // "Just to check",
                                                        fontSize: 10.5,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xff666666)),
                                              ],
                                            ),
                                            const Spacer(),
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
                                                        .actualPrice,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.black,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                  TextWidget(
                                                    "${cart.products.value.products?[index].offerPercentage} %",
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        const Color(0xffFF8A00),
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
                                                                const Offset(
                                                                    0, 0),
                                                            blurRadius: 3,
                                                            spreadRadius: 3,
                                                            color: const Color(
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
                                                              child: SvgPicture.asset(
                                                                  "assets/icons/minus_icon.svg"),
                                                            ),
                                                          ),
                                                          const Spacer(),
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
                                                          const Spacer(),
                                                          GestureDetector(
                                                            onTap: () {
                                                              cart.add(index);
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: SvgPicture.asset(
                                                                  "assets/icons/plus_icon.svg"),
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
                                        const Divider(
                                          color: const Color(0xffE5E5E5),
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
                      return const SizedBox(
                        height: 0,
                      );
                    },
                    itemCount: (cart.products.value.products?.length)!,
                  )
                ],
              ),
            ),
          ),
        ),
        const Divider(
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
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    int response = await controller.hitAddCartAPI();
                    if (response == 0) {
                      if (prefs.containsKey("Login")) {
                        String nameText = prefs.getString('Login') ?? '';
                        if (nameText == "true") {
                          Get.toNamed(Routes.ADDRESS, arguments: [
                            controller.totalPrice.value,
                            controller.savedPrice.value
                          ]);
                        } else {
                          Get.toNamed(Routes.LOGIN, arguments: "Cart")
                              ?.then((value) => controller.getCartListDatas());
                        }
                      } else {
                        Get.toNamed(Routes.LOGIN, arguments: "Cart")
                            ?.then((value) => controller.getCartListDatas());
                      }
                    }
                  },
                  child: TextWidget(
                    'Checkout',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      backgroundColor: AppColors.primaryColor,
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
                    border: Border.all(color: const Color(0xffD6D6D6))),
                child: TextFormField(
                  controller: controller.cuponCode,
                  maxLines: 1,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //       content: Text("Enter coupon code to complete"),
                  //     ));
                  //     return null;
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  onChanged: (value) {},
                  style: const TextStyle(
                      color: Color(0xff000000),
                      fontSize: 9.5,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    hintText: "Coupon Code",
                    contentPadding: const EdgeInsets.only(left: 8, right: 5),
                    suffixIcon: SizedBox(
                      height: 23,
                      width: 49,
                      child: ElevatedButton(
                        onPressed: () async {
                          var vals = await controller
                              .getCoupon(controller.cuponCode.text);
                          // Get.snackbar('warning', vals);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(milliseconds: 750),
                            content: Text(vals),
                          ));
                        },
                        child: TextWidget(
                          'Apply',
                          fontSize: 9.5,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            padding: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            )),
                      ),
                    ),
                    hintStyle: const TextStyle(
                        color: const Color(0xff999999),
                        fontSize: 9.5,
                        fontWeight: FontWeight.w400),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6)),
                    fillColor: const Color(0xffffffff),
                    filled: true,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Total: ',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff141414)),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${controller.totalPrice.value}0",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000)),
                          )
                        ]),
                  ),
                  TextWidget(
                    'Saved: ₹ ${controller.savedPrice.value}0',
                    fontSize: 10.5,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff4A8D30),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget cartEmptyDesign(context) {
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
                        text: const TextSpan(children: [
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
                  child: SvgPicture.asset(
                    "assets/icons/free-price-tag.svg",
                    height: 36,
                    width: 36,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 58,
        ),
        const Text(
          "Your Shopping Cart is",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Empty!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            AppSize.size.w10,
            SvgPicture.asset("assets/icons/Emoji.svg",height: 19,width: 19,),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: SvgPicture.asset("assets/icons/CartIcon.svg",height: 200,fit: BoxFit.scaleDown,),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
              "Once you have added items to your shopping cart, you can check out from here"),
        ),
        AppSize.size.h30,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SizedBox(
            height: 50,
            width: Get.width,
            child: ElevatedButton(
                onPressed: () {
                  // controller.hitAddCartAPI();
                  Get.find<DashboardController>().tabController?.animateTo(0);
                  Get.find<DashboardController>().selectedIndex.value = 0;
                  Get.find<DashboardController>().selectedIndex.refresh();
                  Get.toNamed(Routes.DASHBOARD);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13))),
                child: TextWidget(
                  'Continue Shopping',
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                )),
          ),
        ),
        AppSize.size.h55
      ],
    );
  }
}
