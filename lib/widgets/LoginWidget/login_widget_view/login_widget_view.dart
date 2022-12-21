import 'package:family_garden/screens/login_screen/controller/login_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/LoginWidget/login_widget_controller/login_widget_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../network/api_helper.dart';
import '../../../routes/app_pages.dart';
import '../../../screens/account_screen/controllers/account_controller.dart';
import '../../../screens/dashboard/controllers/dashboard_controller.dart';
import '../../../screens/drawer_screen/controllers/drawer_controller.dart';

class LoginWidgetView extends GetView<LoginWidgetController> {
  final String? screenName;
  LoginWidgetView({
    Key? key,
    required this.screenName,
  }) : super(key: key);
  @override
  var controller = Get.put(LoginWidgetController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Obx(
        () =>screenName == "Account Login" ? SingleChildScrollView( child: LoginBody()) :SingleChildScrollView(child: LoginBody(),),
      ),
    );
  }

  Widget LoginBody(){
    final formGlobalKey = GlobalKey<FormState>();
    return Container(
      height: screenName == "Account Login" ? Get.height : Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Form(
          key: formGlobalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 79,
                    width: 79,
                    child: SvgPicture.asset("assets/images/appLogo.svg"),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Container(
                        height: 130,
                        width: 105,
                        child: SvgPicture.asset("assets/images/Login.svg"),
                      ),
                    ],
                  )
                ],
              ),
              const Text(
                "Login",
                style: TextStyle(
                    color: AppColors.darkGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter phone number';
                  }
                  return null;
                },
                controller: controller.emailController,
                decoration: const InputDecoration(
                  labelText: "Email / Mobile No *",
                  labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff535353)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.dividerColor)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.dividerColor,
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password';
                  }
                  return null;
                },
                obscureText: controller.showPassword.value,
                enableSuggestions: false,
                autocorrect: false,
                obscuringCharacter: '*',
                controller: controller.passwordController,
                decoration: InputDecoration(
                  suffixIconConstraints:
                  const BoxConstraints(minHeight: 24, minWidth: 24),
                  suffixIcon: !controller.showPassword.value
                      ? GestureDetector(
                      onTap: () {
                        controller.showPassword.value =
                        !controller.showPassword.value;
                      },
                      child: SvgPicture.asset(
                        "assets/icons/hide Password.svg",
                        color: AppColors.black,
                      ))
                      : GestureDetector(
                      onTap: () {
                        controller.showPassword.value =
                        !controller.showPassword.value;
                      },
                      child: SvgPicture.asset(
                        "assets/icons/show Password.svg",
                        color: AppColors.black,
                      )),
                  labelText: "Password *",
                  labelStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff535353)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: AppColors.dividerColor)),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.dividerColor,
                    ),
                  ),
                ),
              ),
              AppSize.size.h20,
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.FORGOT_PASSWORD);
                },
                child: Container (
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextWidget(
                        'Forgot Password ?',
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff535353),
                      ),
                    ],
                  ),
                ),
              ),
              AppSize.size.h40,
              SizedBox(
                height: 45,
                width: Get.width,
                child: ElevatedButton(
                    onPressed: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        formGlobalKey.currentState!.save();
                        final prefs = await SharedPreferences.getInstance();
                        var response = await ApiHelper.login(
                            controller.emailController.text,
                            controller.passwordController.text);
                        if (response.data?.status == 1) {
                          prefs.setString("userToken", (response.data?.userToken)!);
                          print("user Token : ${response.data?.userToken}");
                          // Get.toNamed(Routes.CART_SCREEN);
                          prefs.setString("Login", "true");
                          prefs.setString(
                              "firstName", (response.data?.firstname)!);
                          prefs.setString(
                              "lastName", (response.data?.lastname)!);
                          prefs.setString(
                              "emailId", (response.data?.email)!);
                          prefs.setString(
                              "telephone", (response.data?.telephone)!);
                          // Get.put(AccountController());
                          Get.find<AccountController>().getLoginDetails();
                          Get.put(DrawerWidgetController());
                          Get.find<AccountController>().isLoggedIn.value =
                          false;
                          Get.put(DashboardController());
                          Get.find<DashboardController>().isLoggedIn.value =
                          false;
                          controller.emailController.text = "";
                          controller.passwordController.text = "";
                          Get.find<DrawerWidgetController>()
                              .getLocalDatas();
                          Get.back();
                          Get.snackbar('success', "Succesfully Logged in");
                          // ScaffoldMessenger.of(context)
                          //     .showSnackBar(SnackBar(
                          //   content: Text("Succesfully Logged in"),
                          // ));
                          // Get.back();
                        } else {
                          // controller.emailController.text = "";
                          // controller.passwordController.text = "";
                          // Get.back();
                          Get.snackbar(
                              'warning', response.data?.status.toString() ?? "" );
                          // ScaffoldMessenger.of(context)
                          //     .showSnackBar(SnackBar(
                          //   content:
                          //       Text(response.data?.errorWarning ?? ""),
                          // ));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor : AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13))),
                    child: TextWidget(
                      'Log In',
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    )),
              ),
              AppSize.size.h20,
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SIGNUP);
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'New User? ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff141414)),
                        children: <TextSpan>[
                          TextSpan(
                            text: " Sign Up",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.orange),
                          )
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
