import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_constants/api_end_points.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/routes/app_pages.dart';
import 'package:family_garden/screens/drawer_screen/controllers/drawer_controller.dart';
import 'package:family_garden/screens/profile_screen/controllers/profile_controller.dart';
import 'package:family_garden/widgets/custom_textfield.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../network/set_local_datas.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/LoginWidget/login_widget_view/login_widget_view.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  @override
  var controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: controller.isLoggedIn.value
            ? SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                    height: Get.height - 140,
                    width: Get.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        )),
                    child: Padding(
                        padding:
                            const EdgeInsets.only(top: 25, left: 16, right: 16),
                        child: Column(
                          children: [
                            Flexible(
                              child: SizedBox(
                                height: double.infinity,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      controller.isLoggedIn.value
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  controller.firstName.value,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 20.0),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: InkWell(
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  color: AppColors
                                                                      .dividerColor)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        6),
                                                                child:
                                                                    Container(
                                                                        height:
                                                                            18,
                                                                        width:
                                                                            18,
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/icons/order_history_icon.svg',
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          color:
                                                                              AppColors.primaryColor,
                                                                        )),
                                                              ),
                                                              AppSize.size.w7,
                                                              TextWidget(
                                                                'Order history',
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: AppColors
                                                                    .black,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          Get.toNamed(Routes
                                                              .ORDER_HISTORY_SCREEN);
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10.0)),
                                                    Expanded(
                                                      child: InkWell(
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  color: AppColors
                                                                      .dividerColor)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        6),
                                                                child:
                                                                    Container(
                                                                        height:
                                                                            18,
                                                                        width:
                                                                            18,
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/icons/wishlist_icon.svg',
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          color:
                                                                              AppColors.primaryColor,
                                                                        )),
                                                              ),
                                                              AppSize.size.w7,
                                                              TextWidget(
                                                                'Wishlist',
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: AppColors
                                                                    .black,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          Get.toNamed(Routes
                                                              .WISH_LIST_SCREEN);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 20.0),
                                                ),
                                                Divider(
                                                  color: Color(0xffE5E5E5),
                                                  thickness: 1,
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                      ),
                                      TextWidget(
                                        'Account Settings',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 10.0)),
                                      GestureDetector(
                                        onTap: () {
                                          if (controller.isLoggedIn.value ==
                                              true) {
                                            Get.toNamed(Routes.EDIT_PROFILE)
                                                ?.then((value) => controller
                                                    .getLoginDetails());
                                          } else {
                                            Get.snackbar(
                                                'warning', "Kindly login");
                                            // ScaffoldMessenger.of(context)
                                            //     .showSnackBar(SnackBar(
                                            //   content: Text("Kindly login"),
                                            // ));
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: 18,
                                                  width: 18,
                                                  child: SvgPicture.asset(
                                                    'assets/icons/edit_profile_icon.svg',
                                                    fit: BoxFit.fill,
                                                    color:
                                                        AppColors.primaryColor,
                                                  )),
                                              AppSize.size.w10,
                                              Expanded(
                                                child: TextWidget(
                                                  'Edit Profile',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              Routes.MANAGE_ADDRESS_SCREEN);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: 18,
                                                  width: 18,
                                                  child: SvgPicture.asset(
                                                    'assets/icons/saved_address_icon.svg',
                                                    fit: BoxFit.fill,
                                                    color:
                                                        AppColors.primaryColor,
                                                  )),
                                              AppSize.size.w10,
                                              Expanded(
                                                flex: 2,
                                                child: TextWidget(
                                                  'Save Address',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                      ),
                                      Divider(
                                        color: Color(0xffE5E5E5),
                                        thickness: 1,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 15.0)),
                                      TextWidget(
                                        'FeedBack & Informations',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 10.0)),
                                      GestureDetector(
                                        onTap: () {
                                          // Get.toNamed(Routes.FORGOT_PASSWORD);
                                          // Get.toNamed(Routes.VERIFY_OTP);
                                          Get.toNamed(
                                              Routes.TERMS_AND_CONDITIONS);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: 18,
                                                  width: 18,
                                                  child: SvgPicture.asset(
                                                    'assets/icons/terms & condition.svg',
                                                    fit: BoxFit.fill,
                                                    color:
                                                        AppColors.primaryColor,
                                                  )),
                                              AppSize.size.w10,
                                              Expanded(
                                                child: TextWidget(
                                                  'Terms & Conditions',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.FAQ);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: 18,
                                                  width: 18,
                                                  child: SvgPicture.asset(
                                                    "assets/icons/faq's.svg",
                                                    fit: BoxFit.fill,
                                                    color:
                                                        AppColors.primaryColor,
                                                  )),
                                              AppSize.size.w10,
                                              Expanded(
                                                flex: 2,
                                                child: TextWidget(
                                                  'FAQs',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                      ),
                                      Divider(
                                        color: Color(0xffE5E5E5),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            controller.isLoggedIn.value
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 25),
                                    child: SizedBox(
                                      height: 50,
                                      width: Get.width,
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            print(ApiConstants.jwtToken);
                                            int res = await ApiHelper.logOut();
                                            final prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            if (res == 1) {
                                              prefs.clear();
                                              controller.isLoggedIn.value =
                                                  false;
                                              controller.isLoggedIn.refresh();
                                              controller.update();
                                              Get.put(DrawerWidgetController());
                                              Get.find<DrawerWidgetController>()
                                                  .isLoggedin
                                                  .value = true;
                                              Get.find<DrawerWidgetController>()
                                                  .isLoggedin
                                                  .refresh();
                                              var response =
                                                  await ApiHelper.getToken();
                                              if (response.data?.apiToken !=
                                                  null) {
                                                SetLocalDatas.setToken(
                                                    (response.data?.apiToken)!);
                                                print(ApiConstants.jwtToken);
                                              }
                                              Get.put(DashboardController());
                                              Get.find<DashboardController>()
                                                  .isLoggedIn
                                                  .value = false;
                                              // Get.snackbar('success',
                                              //     "Logout successfully");
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                duration:
                                                    Duration(milliseconds: 350),
                                                content:
                                                    Text("Logout successfully"),
                                              ));
                                            }
                                            // controller.logout();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primaryColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          13))),
                                          child: TextWidget(
                                            'Log Out',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          )),
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        )),
                  ),
                ),
              )
            : SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
              child: LoginWidgetView(
                  screenName: '',
                ),
            ),
      ),
    );
  }
}
