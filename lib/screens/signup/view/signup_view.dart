import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/custom_textfield.dart';
import '../controller/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  var controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    final formGlobalKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            child: Form(
              key: formGlobalKey,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22.0, top: 40),
                          child: Container(
                            height: 49,
                            width: 49,
                            decoration: BoxDecoration(
                                shape: BoxShape
                                    .circle, // BoxShape.circle or BoxShape.retangle
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black.withOpacity(0.05),
                                    spreadRadius: 7,
                                    blurRadius: 9,
                                    offset: Offset(0, 0),
                                  ),
                                ]),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                                color: AppColors.black,
                              ),
                            )),
                          ),
                        ),
                      ),
                      Container(
                        height: 121,
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: AppColors.darkGreen,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: SvgPicture.asset(
                                  "assets/images/singup_image.svg"),
                            ),
                          ],
                        ),
                      ),
                      // TextField(
                      //     decoration: InputDecoration(
                      //   labelText: "Name *",
                      //
                      //   // hintText: "Enter your email",
                      //   prefixIcon: Padding(
                      //     padding: const EdgeInsets.all(2.0),
                      //     child: SvgPicture.asset(
                      //       "assets/icons/user.svg",
                      //     ),
                      //   ),
                      //   prefixIconConstraints: BoxConstraints(
                      //     minWidth: 25,
                      //     minHeight: 25,
                      //   ),
                      //   hintStyle: TextStyle(
                      //       fontSize: 18,
                      //       // isDense: true,
                      //       fontWeight: FontWeight.bold), //hint text style
                      //   labelStyle: TextStyle(
                      //       fontSize: 13, color: Colors.redAccent), //label style
                      // )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 50,
                          width: Get.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  height: 21,
                                  width: 21,
                                  child: SvgPicture.asset(
                                    "assets/icons/user.svg",
                                    height: 22,
                                    width: 21,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              AppSize.size.w20,
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter Name';
                                    }
                                    return null;
                                  },
                                  controller: controller.firstnameController,
                                  decoration: InputDecoration(
                                    // contentPadding: EdgeInsets.only(left: 60),
                                    // prefixIcon: SvgPicture.asset(
                                    //   "assets/icons/user.svg",
                                    //   height: 22,
                                    //   width: 21,
                                    //   fit: BoxFit.contain,
                                    // ),
                                    // labelText: "Phone Number *",
                                    label: Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: TextWidget('Name *'),
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff535353)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.dividerColor)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.dividerColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppSize.size.h20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 50,
                          width: Get.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  height: 21,
                                  width: 21,
                                  child: SvgPicture.asset(
                                    "assets/icons/mobile.svg",
                                    height: 22,
                                    width: 21,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              AppSize.size.w20,
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter phone number';
                                    }
                                    return null;
                                  },
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  controller: controller.telephoneController,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    // contentPadding: EdgeInsets.only(left: 60),
                                    // prefixIcon: SvgPicture.asset(
                                    //   "assets/icons/user.svg",
                                    //   height: 22,
                                    //   width: 21,
                                    //   fit: BoxFit.contain,
                                    // ),
                                    // labelText: "Phone Number *",
                                    label: Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: TextWidget('Phone Number  *'),
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff535353)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.dividerColor)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.dividerColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppSize.size.h20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 50,
                          width: Get.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  height: 21,
                                  width: 21,
                                  child: SvgPicture.asset(
                                    "assets/icons/email.svg",
                                    height: 22,
                                    width: 21,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              AppSize.size.w20,
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value != null || value!.isNotEmpty) {
                                      if (controller.isValidEmail(value)) {
                                        return null;
                                      }
                                      return 'please enter Valid Email';
                                    }
                                    return "please enter Valid Email";
                                  },
                                  controller: controller.emailController,
                                  decoration: InputDecoration(
                                    // contentPadding: EdgeInsets.only(left: 60),
                                    // prefixIcon: SvgPicture.asset(
                                    //   "assets/icons/user.svg",
                                    //   height: 22,
                                    //   width: 21,
                                    //   fit: BoxFit.contain,
                                    // ),
                                    // labelText: "Phone Number *",
                                    label: Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: TextWidget('Email  *'),
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff535353)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.dividerColor)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.dividerColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppSize.size.h15,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 50,
                          width: Get.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  height: 21,
                                  width: 21,
                                  child: SvgPicture.asset(
                                    "assets/icons/lock.svg",
                                    height: 22,
                                    width: 21,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              AppSize.size.w20,
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter Password';
                                    } else {
                                      if (value.length >= 4) {
                                        return null;
                                      } else {
                                        return 'password must contains 4-20 characters';
                                      }
                                    }
                                  },
                                  maxLength: 20,
                                  obscuringCharacter: '*',
                                  obscureText: controller.showPassword.value,
                                  controller: controller.passwordController,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    errorMaxLines: 2,
                                    suffixIconConstraints: BoxConstraints(
                                        minHeight: 24, minWidth: 24),
                                    suffixIcon: !controller.showPassword.value
                                        ? GestureDetector(
                                            onTap: () {
                                              print("object");
                                              controller.showPassword.value =
                                                  !controller
                                                      .showPassword.value;
                                              controller.showPassword.refresh();
                                            },
                                            child: SvgPicture.asset(
                                              "assets/icons/hide Password.svg",
                                              color: AppColors.black,
                                            ))
                                        : GestureDetector(
                                            onTap: () {
                                              print("object");
                                              controller.showPassword.value =
                                                  !controller
                                                      .showPassword.value;
                                              controller.update();
                                            },
                                            child: SvgPicture.asset(
                                              "assets/icons/show Password.svg",
                                              color: AppColors.black,
                                            )),
                                    // contentPadding: EdgeInsets.only(left: 60),
                                    // prefixIcon: SvgPicture.asset(
                                    //   "assets/icons/user.svg",
                                    //   height: 22,
                                    //   width: 21,
                                    //   fit: BoxFit.contain,
                                    // ),
                                    // labelText: "Phone Number *",
                                    label: Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: TextWidget('Password  *'),
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff535353)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.dividerColor)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.dividerColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppSize.size.h20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 50,
                          width: Get.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  height: 21,
                                  width: 21,
                                  child: SvgPicture.asset(
                                    "assets/icons/lock.svg",
                                    height: 22,
                                    width: 21,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              AppSize.size.w20,
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value != null) {
                                      if (controller.passwordController.text ==
                                          value) {
                                        return null;
                                      } else {
                                        return "must have to match password and confirm";
                                      }
                                    } else {
                                      return 'please enter Confirm Password';
                                    }
                                  },
                                  maxLength: 20,
                                  obscuringCharacter: '*',
                                  obscureText:
                                      controller.showConfirmPassword.value,
                                  controller: controller.confirmController,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    suffixIconConstraints: BoxConstraints(
                                        minHeight: 24, minWidth: 24),
                                    suffixIcon:
                                        !controller.showConfirmPassword.value
                                            ? GestureDetector(
                                                onTap: () {
                                                  print("object");
                                                  controller.showConfirmPassword
                                                          .value =
                                                      !controller
                                                          .showConfirmPassword
                                                          .value;
                                                  controller.showConfirmPassword
                                                      .refresh();
                                                },
                                                child: SvgPicture.asset(
                                                  "assets/icons/hide Password.svg",
                                                  color: AppColors.black,
                                                ))
                                            : GestureDetector(
                                                onTap: () {
                                                  print("object");
                                                  controller.showConfirmPassword
                                                          .value =
                                                      !controller
                                                          .showConfirmPassword
                                                          .value;
                                                  controller.update();
                                                },
                                                child: SvgPicture.asset(
                                                  "assets/icons/show Password.svg",
                                                  color: AppColors.black,
                                                )),
                                    // contentPadding: EdgeInsets.only(left: 60),
                                    // prefixIcon: SvgPicture.asset(
                                    //   "assets/icons/user.svg",
                                    //   height: 22,
                                    //   width: 21,
                                    //   fit: BoxFit.contain,
                                    // ),
                                    // labelText: "Phone Number *",
                                    label: Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: TextWidget('Confirm Password  *'),
                                    ),
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff535353)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.dividerColor)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.dividerColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppSize.size.h30,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 45,
                          width: Get.width,
                          child: ElevatedButton(
                              onPressed: () {
                                if (formGlobalKey.currentState!.validate()) {
                                  formGlobalKey.currentState!.save();
                                  controller.signUpBtn(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13))),
                              child: TextWidget(
                                'Register',
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              )),
                        ),
                      ),
                      AppSize.size.h40,
                      Center(
                          child: TextWidget(
                        'By creating passcode you agree with our',
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff747474),
                      )),
                      AppSize.size.h5,
                      Center(
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Terms & Conditions",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor)),
                            TextSpan(
                                text: " and ",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff747474))),
                            TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor)),
                          ]),
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
