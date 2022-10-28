import 'package:family_garden/screens/drawer_screen/controllers/drawer_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../network/api_helper.dart';
import '../../../routes/app_pages.dart';

class DrawerView extends GetView<DrawerWidgetController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DrawerWidgetController());
    return SizedBox(
      height: Get.height,
      width: Get.width / 1.3,
      child: Drawer(
        backgroundColor: AppColors.white,
        child: SafeArea(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor),
                          child: Center(
                            child: TextWidget(
                              'FG',
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        AppSize.size.w15,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width / 2.1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      "Family Garden",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff050000),
                                    ),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: AppColors.black,
                                          size: 20,
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                width: Get.width / 2.1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      'Thoraipakkam, chennai',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryColor,
                                    ),
                                    ImageIcon(AssetImage(
                                      "assets/icons/location.png",
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AppSize.size.h10,
                Container(
                  height: 25,
                  width: Get.width,
                  color: AppColors.primaryColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    child: RichText(
                      text: TextSpan(
                          text: 'Delivery in 2hrs + ',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white),
                          children: <TextSpan>[
                            TextSpan(
                              text: '100% Care',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFC00)),
                            )
                          ]),
                    ),
                  ),
                ),
                AppSize.size.h20,
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  // padding: const EdgeInsets.only(bottom: 20, top: 10),
                  shrinkWrap: true,
                  itemCount: controller.sideMenus.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 4),
                      child: Container(
                        child: ListTile(
                          dense: true,
                          onTap: () {
                            controller.sideMenuNavigation(index);
                          },
                          leading: Image.asset(
                            controller.sideMenus[index]["image"],
                            height: 24,
                            width: 24,
                            fit: BoxFit.fill,
                            color: AppColors.black,
                          ),
                          title: TextWidget(
                            controller.sideMenus[index]["name"],
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Spacer(),
                controller.login.value == ""
                    ? Container(
                        width: Get.width / 1.3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  loginDialog(context);
                                },
                                child: Container(
                                  height: 35,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: Center(
                                    child: TextWidget(
                                      'Login',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.SIGNUP);
                                },
                                child: Container(
                                  height: 35,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: AppColors.white,
                                      border: Border.all(
                                          color: AppColors.primaryColor)),
                                  child: Center(
                                    child: TextWidget(
                                      'Sign Up',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
                Spacer(),
                SizedBox(
                    width: Get.width / 1.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/c.png'),
                        AppSize.size.w5,
                        TextWidget(
                          'Family Garden. 2022',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff3A3A3A),
                        )
                      ],
                    )),
                AppSize.size.h30
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginDialog(context) {
    return Get.defaultDialog(
        titlePadding: EdgeInsets.all(0),
        contentPadding: EdgeInsets.all(0),
        content: SizedBox(
          height: Get.height / 2.1,
          width: Get.width - 10,
          child: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: controller.formGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                "Login",
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextWidget(
                                  "To Complete your shopping",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 47,
                            width: 47,
                            child: Image.asset('assets/images/splash-mdpi.png'),
                          )
                        ],
                      ),
                      Divider(
                        color: AppColors.dividerColor,
                        thickness: 1,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter phone number';
                          }
                          return null;
                        },
                        controller: controller.emailController,
                        decoration: InputDecoration(
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
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          labelText: "Password *",
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
                      AppSize.size.h8,
                      TextWidget(
                        'Forgot Password ?',
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff535353),
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
                                if (response.data?.errorWarning == "") {
                                  Future.delayed(Duration(seconds: 5), () {
                                    Get.back();
                                  });
                                  prefs.setString("Login", "true");
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Succesfully Logged in"),
                                  ));
                                } else {
                                  controller.emailController.text = "";
                                  controller.passwordController.text = "";
                                  Get.toNamed(Routes.DASHBOARD);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Something went wrong"),
                                  ));
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13))),
                            child: TextWidget(
                              'Log In',
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            )),
                      ),
                      AppSize.size.h15,
                      controller.isLoggedin.value
                          ? SizedBox(
                              width: Get.width,
                              child: Text("Successfully Logged in",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff535353))),
                            )
                          : Container(),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SIGNUP);
                        },
                        child: Center(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "New User?",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff535353))),
                              TextSpan(
                                  text: "  Sign Up",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffFF8A00))),
                            ]),
                            maxLines: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: -8,
                top: -30,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.05),
                            spreadRadius: 7,
                            blurRadius: 9,
                            offset: Offset(0, 0),
                          ),
                        ]),
                    child: Icon(
                      Icons.close,
                      color: Color(0xffFF8A00),
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
        radius: 20);
  }
}
