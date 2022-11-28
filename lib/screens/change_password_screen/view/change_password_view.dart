import 'package:family_garden/screens/change_password_screen/controller/change_password_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/common_appbar/custom_appbar_view.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  @override
  var controller = Get.put(ChangePasswordController());
  final formGlobalKey = GlobalKey<FormState>();

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
          appbar_title: "",
          center_title: true,
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Form(
            key: controller.formGlobalKey,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSize.size.h40,
                    Container(
                      height: 79,
                      width: 79,
                      child: SvgPicture.asset("assets/images/appLogo.svg"),
                    ),
                    AppSize.size.h55,
                    const Text(
                      "Change Password",
                      style: TextStyle(
                          color: AppColors.darkGreen,
                          fontWeight: FontWeight.w700,
                          fontSize: 22),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter password';
                        } else {
                          if (value.length < 4) {
                            return "password must contain 4-20 characters";
                          } else {
                            return null;
                          }
                        }
                      },
                      controller: controller.passwordController,
                      maxLength: 20,
                      obscureText: controller.isPasswordVisible.value,
                      decoration: InputDecoration(
                        counterText: "",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.isPasswordVisible.value =
                                !controller.isPasswordVisible.value;
                          },
                          child: Icon(
                            controller.isPasswordVisible.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xff909094),
                          ),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 10, minHeight: 10),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.lock,
                            color: Color(0xff909094),
                          ),
                        ),
                        prefixIconConstraints:
                            BoxConstraints(minWidth: 10, minHeight: 10),
                        labelText: "new password *",
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
                    AppSize.size.h20,
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter password';
                        } else {
                          if (controller.passwordController.text == value) {
                            if (value.length < 4) {
                              return "password must contain 4-20 characters";
                            } else {
                              return null;
                            }
                          } else {
                            return "Password and confirm password mismatch";
                          }
                        }
                      },
                      obscureText: controller.isConfirmPasswordVisible.value,
                      controller: controller.confirmPasswordController,
                      maxLength: 20,
                      decoration: InputDecoration(
                        counterText: "",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.isConfirmPasswordVisible.value =
                                !controller.isConfirmPasswordVisible.value;
                          },
                          child: Icon(
                            controller.isConfirmPasswordVisible.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xff909094),
                          ),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 10, minHeight: 10),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.lock,
                            color: Color(0xff909094),
                          ),
                        ),
                        prefixIconConstraints:
                            BoxConstraints(minWidth: 10, minHeight: 10),
                        labelText: "Confirm new password *",
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
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    controller.isErrorPassword.value
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                              Text(
                                "Password not updated",
                                style: TextStyle(color: Colors.red),
                              ),
                              AppSize.size.h15,
                            ],
                          )
                        : Container(),
                    Container(
                      height: 50,
                      width: Get.width,
                      child: ElevatedButton(
                          onPressed: () {
                            if (controller.formGlobalKey.currentState!
                                .validate()) {
                              controller.formGlobalKey.currentState!.save();
                              openAlertBox(context, controller);
                              // controller.updatePassword(
                              //     controller.passwordController.text,
                              //     controller.confirmPasswordController.text);
                            }
                            // if (controller.passwordController.text
                            //         .toString()
                            //         .isEmpty ||
                            //     controller.confirmPasswordController.text
                            //         .toString()
                            //         .isEmpty) {
                            //   Get.snackbar(
                            //       'warning', "Please fill necessary fields!");
                            //   return;
                            // } else if (controller.passwordController.text.length >=
                            //         4 &&
                            //     controller.passwordController.text.length >= 4) {
                            //   if (controller.passwordController.text !=
                            //       controller.confirmPasswordController.text) {
                            //     Get.snackbar('warning',
                            //         "Password and confirm password mismatch!");
                            //   } else {
                            //
                            //   }
                            // } else {
                            //   Get.snackbar("warning",
                            //       "password must contain 4-20 characters");
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13))),
                          child: TextWidget(
                            'Change Password',
                            color: Colors.white,
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
    );
  }

  openAlertBox(BuildContext context, ChangePasswordController controller) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 15, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 250,
                        width: Get.width / 1.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/changed_password.svg",
                              height: 94.61,
                              width: 94.61,
                              color: Colors.red,
                            ),
                            AppSize.size.h20,
                            Text(
                              "Done!",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            AppSize.size.h10,
                            Text(
                              "Password Changed Successfully",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            AppSize.size.h20,
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 22, right: 22),
                              child: SizedBox(
                                height: 50,
                                width: Get.width,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                      Get.back();

                                      // Get.toNamed(Routes.VERIFY_OTP);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(13))),
                                    child: TextWidget(
                                      'Ok',
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: -5.0,
                  top: -15,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          offset: Offset(2, 2),
                          blurRadius: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                        )
                      ]),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 14.0,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.close, color: Colors.orange),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
