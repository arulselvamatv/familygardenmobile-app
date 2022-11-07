import 'package:family_garden/network/api_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../../account_screen/controllers/account_controller.dart';
import '../../drawer_screen/controllers/drawer_controller.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  var controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
                  ? cartDatasDesign(context)
                  : cartEmptyDesign(context),
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
                                                    ? TextWidget(
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
                                                        color:
                                                            Color(0xff666666))
                                                    : Container(),
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
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    if (prefs.containsKey("Login")) {
                      String nameText = prefs.getString('Login') ?? '';
                      if (nameText == "true") {
                        Get.toNamed(Routes.ADDRESS, arguments: [
                          controller.totalPrice.value,
                          controller.savedPrice.value
                        ]);
                        controller.hitAddCartAPI();
                      } else {
                        Get.toNamed(Routes.LOGIN, arguments: "Cart")
                            ?.then((value) => controller.getCartListDatas());
                        controller.hitAddCartAPI();
                      }
                    } else {
                      Get.toNamed(Routes.LOGIN, arguments: "Cart")
                          ?.then((value) => controller.getCartListDatas());
                      controller.hitAddCartAPI();
                    }
                  },
                  child: TextWidget(
                    'Checkout',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
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
                            backgroundColor: AppColors.primaryColor,
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
                            text: controller.totalPrice.value.toString(),
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
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Container(
            height: 200,
            width: Get.width,
            child: SvgPicture.asset("assets/icons/CartIcon.svg"),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
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

  // loginDialog(context) {
  //   return Get.defaultDialog(
  //       titlePadding: EdgeInsets.all(0),
  //       contentPadding: EdgeInsets.all(0),
  //       content: SizedBox(
  //         height: Get.height / 2.1,
  //         width: Get.width - 10,
  //         child: Stack(
  //           fit: StackFit.loose,
  //           clipBehavior: Clip.none,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 20),
  //               child: Form(
  //                 key: controller.formGlobalKey,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             TextWidget(
  //                               "Login",
  //                               fontSize: 20,
  //                               fontWeight: FontWeight.w700,
  //                               color: AppColors.primaryColor,
  //                             ),
  //                             Padding(
  //                               padding: const EdgeInsets.only(top: 8.0),
  //                               child: TextWidget(
  //                                 "To Complete your shopping",
  //                                 fontSize: 10,
  //                                 fontWeight: FontWeight.w500,
  //                                 color: AppColors.black,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         Spacer(),
  //                         Container(
  //                           height: 47,
  //                           width: 47,
  //                           child: Image.asset('assets/images/splash-mdpi.png'),
  //                         )
  //                       ],
  //                     ),
  //                     Divider(
  //                       color: AppColors.dividerColor,
  //                       thickness: 1,
  //                     ),
  //                     TextFormField(
  //                       validator: (value) {
  //                         if (value == null || value.isEmpty) {
  //                           return 'please enter phone number';
  //                         }
  //                         return null;
  //                       },
  //                       controller: controller.emailController,
  //                       decoration: InputDecoration(
  //                         labelText: "Email / Mobile No *",
  //                         labelStyle: TextStyle(
  //                             fontSize: 12,
  //                             fontWeight: FontWeight.w400,
  //                             color: Color(0xff535353)),
  //                         enabledBorder: UnderlineInputBorder(
  //                             borderSide:
  //                                 BorderSide(color: AppColors.dividerColor)),
  //                         focusedBorder: UnderlineInputBorder(
  //                           borderSide: BorderSide(
  //                             color: AppColors.dividerColor,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     TextFormField(
  //                       validator: (value) {
  //                         if (value == null || value.isEmpty) {
  //                           return 'please enter password';
  //                         }
  //                         return null;
  //                       },
  //                       controller: controller.passwordController,
  //                       decoration: InputDecoration(
  //                         labelText: "Password *",
  //                         labelStyle: TextStyle(
  //                             fontSize: 12,
  //                             fontWeight: FontWeight.w400,
  //                             color: Color(0xff535353)),
  //                         enabledBorder: UnderlineInputBorder(
  //                             borderSide:
  //                                 BorderSide(color: AppColors.dividerColor)),
  //                         focusedBorder: UnderlineInputBorder(
  //                           borderSide: BorderSide(
  //                             color: AppColors.dividerColor,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     AppSize.size.h8,
  //                     TextWidget(
  //                       'Forgot Password ?',
  //                       fontSize: 9,
  //                       fontWeight: FontWeight.w400,
  //                       color: Color(0xff535353),
  //                     ),
  //                     AppSize.size.h20,
  //                     SizedBox(
  //                       height: 45,
  //                       width: Get.width,
  //                       child: ElevatedButton(
  //                           onPressed: () async {
  //                             if (controller.formGlobalKey.currentState!
  //                                 .validate()) {
  //                               controller.formGlobalKey.currentState!.save();
  //                               final prefs =
  //                                   await SharedPreferences.getInstance();
  //                               var response = await ApiHelper.login(
  //                                   controller.emailController.text,
  //                                   controller.passwordController.text);
  //                               if (response.data?.errorWarning == "") {
  //                                 // Get.toNamed(Routes.CART_SCREEN);
  //                                 prefs.setString("Login", "true");
  //                                 prefs.setString(
  //                                     "firstName", (response.data?.firstname)!);
  //                                 prefs.setString(
  //                                     "lastName", (response.data?.lastname)!);
  //                                 prefs.setString(
  //                                     "emailId", (response.data?.email)!);
  //                                 prefs.setString(
  //                                     "telephone", (response.data?.telephone)!);
  //                                 Get.put(AccountController());
  //                                 Get.find<AccountController>()
  //                                     .getLoginDetails();
  //                                 Get.put(DrawerWidgetController());
  //                                 Get.find<DrawerWidgetController>()
  //                                     .getLocalDatas();
  //                                 ScaffoldMessenger.of(context)
  //                                     .showSnackBar(SnackBar(
  //                                   content: Text("Succesfully Logged in"),
  //                                 ));
  //                                 Get.back();
  //                               } else {
  //                                 controller.emailController.text = "";
  //                                 controller.passwordController.text = "";
  //                                 Get.back();
  //                                 ScaffoldMessenger.of(context)
  //                                     .showSnackBar(SnackBar(
  //                                   content: Text("Something went wrong"),
  //                                 ));
  //                               }
  //                             }
  //                           },
  //                           style: ElevatedButton.styleFrom(
  //                               backgroundColor: AppColors.primaryColor,
  //                               shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(13))),
  //                           child: TextWidget(
  //                             'Log In',
  //                             color: AppColors.white,
  //                             fontWeight: FontWeight.w500,
  //                             fontSize: 14,
  //                           )),
  //                     ),
  //                     Spacer(),
  //                     GestureDetector(
  //                       onTap: () {
  //                         Get.toNamed(Routes.SIGNUP);
  //                       },
  //                       child: Center(
  //                         child: RichText(
  //                           text: TextSpan(children: [
  //                             TextSpan(
  //                                 text: "New User?",
  //                                 style: TextStyle(
  //                                     fontSize: 12,
  //                                     fontWeight: FontWeight.w500,
  //                                     color: Color(0xff535353))),
  //                             TextSpan(
  //                                 text: "  Sign Up",
  //                                 style: TextStyle(
  //                                     fontSize: 12,
  //                                     fontWeight: FontWeight.w500,
  //                                     color: Color(0xffFF8A00))),
  //                           ]),
  //                           maxLines: 1,
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             Positioned(
  //               right: -8,
  //               top: -30,
  //               child: GestureDetector(
  //                 onTap: () {
  //                   Get.back();
  //                 },
  //                 child: Container(
  //                   height: 30,
  //                   width: 30,
  //                   decoration: BoxDecoration(
  //                       shape: BoxShape.circle,
  //                       color: Colors.white,
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: AppColors.black.withOpacity(0.05),
  //                           spreadRadius: 7,
  //                           blurRadius: 9,
  //                           offset: Offset(0, 0),
  //                         ),
  //                       ]),
  //                   child: Icon(
  //                     Icons.close,
  //                     color: Color(0xffFF8A00),
  //                     size: 18,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       backgroundColor: Colors.white,
  //       titleStyle: TextStyle(color: Colors.white),
  //       middleTextStyle: TextStyle(color: Colors.white),
  //       radius: 20);
  // }
}
