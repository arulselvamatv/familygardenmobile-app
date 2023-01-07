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
            key: formGlobalKey,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSize.size.h40,
                    SvgPicture.asset("assets/images/appLogo.svg",height: 79,width: 79,fit: BoxFit.scaleDown,),
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
                            if (formGlobalKey.currentState!
                                .validate()) {
                              formGlobalKey.currentState!.save();
                              controller.updatePassword(
                                  controller.passwordController.text,
                                  controller.confirmPasswordController.text,context,controller);
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


}
