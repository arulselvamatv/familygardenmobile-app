import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/routes/app_pages.dart';
import 'package:family_garden/screens/account_screen/controllers/account_controller.dart';
import 'package:family_garden/screens/drawer_screen/controllers/drawer_controller.dart';
import 'package:family_garden/screens/login_view/controller/login_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/common_appbar/custom_appbar_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends GetView<LoginViewController> {
  @override
  var controller = Get.put(LoginViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            appbar_title: 'Account Login',
            center_title: true,
          ),
        ),
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context)
                .requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Obx(
              () => Container(
                height: Get.height,
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
                    key: controller.formGlobalKey,
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
                              child:
                                  SvgPicture.asset("assets/images/appLogo.svg"),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 120,
                                ),
                                Container(
                                  height: 130,
                                  width: 105,
                                  child:
                                      SvgPicture.asset("assets/images/Login.svg"),
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
                            labelStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff535353)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.dividerColor)),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(
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
                              borderSide: const BorderSide(
                                color: AppColors.dividerColor,
                              ),
                            ),
                          ),
                        ),
                        AppSize.size.h8,
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.FORGOT_PASSWORD);
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextWidget(
                                  'Forgot Password ?',
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff535353),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppSize.size.h20,
                        SizedBox(
                          height: 45,
                          width: Get.width,
                          child: ElevatedButton(
                              onPressed: () async {
                                if (controller.formGlobalKey.currentState!
                                    .validate()) {
                                  controller.formGlobalKey.currentState!.save();
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  var response = await ApiHelper.login(
                                      controller.emailController.text,
                                      controller.passwordController.text);
                                  if (response.data?.status == 1) {
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
                                    Get.put(AccountController());
                                    Get.find<AccountController>()
                                        .getLoginDetails();
                                    Get.put(DrawerWidgetController());
                                    Get.find<AccountController>()
                                        .isLoggedIn
                                        .value = false;
                                    controller.emailController.text = "";
                                    controller.passwordController.text = "";
                                    Get.find<DrawerWidgetController>()
                                        .getLocalDatas();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content:
                                          const Text("Succesfully Logged in"),
                                    ));
                                    Get.offNamed(Routes.DASHBOARD);
                                  } else {
                                    controller.emailController.text = "";
                                    controller.passwordController.text = "";
                                    Get.back();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Something went wrong"),
                                    ));
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13))),
                              child: TextWidget(
                                'Log In',
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
