import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/network/set_local_datas.dart';
import 'package:family_garden/routes/app_pages.dart';
import 'package:family_garden/screens/profile_screen/controllers/profile_controller.dart';
import 'package:family_garden/widgets/LoginWidget/pop_up_notification_view.dart';
import 'package:family_garden/widgets/custom_textfield.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';

class ProfileView extends GetView<ProfileController> {

  @override
  var controller = Get.put(ProfileController());

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
          appbar_title: 'Edit profile',
          center_title: true,
          leading_image: "Add",
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                height: Get.height,
                width: Get.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        caption: 'Edit Name *',
                        hasCaption: true,
                        fontSize: 12,
                        controller: controller.nameController,
                        hint: '',
                        readOnly: false,
                      ),
                      AppSize.size.h30,
                      CustomTextField(
                        caption: 'Edit Email Address',
                        hasCaption: true,
                        fontSize: 12,
                        controller: controller.emailController,
                        hint: '',
                        readOnly: false,
                      ),
                      AppSize.size.h30,
                      CustomTextField(
                        caption: 'Edit Mobile Number',
                        hasCaption: true,
                        fontSize: 12,
                        controller: controller.telephoneController,
                        hint: '',
                        readOnly: false,
                      ),
                      AppSize.size.h55,
                      Container(
                        color: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Container(
                          height: 50,
                          width: Get.width,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.onPressSaveChangesBtn(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13))),
                              child: TextWidget(
                                'Save Changes',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              )),
                        ),
                      ),
                      AppSize.size.h55,
                      Divider(
                        color: Color(0xffE5E5E5),
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          openAlertBox(context, controller);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextWidget(
                                  'Change Your Password',
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
                      Divider(
                        color: Color(0xffE5E5E5),
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          ValueListenableBuilder<bool>(
            valueListenable: controller.showAppNotificationNotifierInitial,
            builder: (context, value, child)
            {
              print("HomeBooksView :: showAppNotificationNotifier $value :: ${MediaQuery.of(context).size}");
              return AnimatedPositioned(
                top: value ? 0 : - Get.width - 1000,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInCubic,
                child: PopUpNotificationView(
                  onClosePressed: ()
                  async {
                    print(ApiConstants.jwtToken);
                    var prefs = await SharedPreferences.getInstance();
                    prefs.clear();
                    var response = await ApiHelper.getToken();
                    if (response.data?.apiToken != null)
                    {
                      SetLocalDatas.setToken((response.data?.apiToken)!);
                      print(ApiConstants.jwtToken);
                      Navigator.pop(context);
                      Get.offAndToNamed(Routes.LOGIN_VIEW);
                      Get.toNamed(Routes.LOGIN_VIEW);
                    }
                  },
                ),
              );
            },
          ),

        ],
      ),
      // bottomNavigationBar:
    );
  }
}

openAlertBox(BuildContext context, ProfileController controller) {
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
                    TextWidget(
                      'Change Your Password',
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    TextFormField(
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'please enter password';
                      //   }
                      //   return null;
                      // },
                      maxLength: 20,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        counterText: "",
                        // suffixIcon: Icon(
                        //   Icons.visibility_outlined,
                        //   color: Color(0xff909094),
                        // ),
                        // suffixIconConstraints:
                        //     BoxConstraints(minWidth: 10, minHeight: 10),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xff909094),
                        ),
                        prefixIconConstraints:
                            BoxConstraints(minWidth: 10, minHeight: 10),
                        labelText: "Enter new password *",
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
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'please enter password';
                      //   }
                      //   return null;
                      // },
                      controller: controller.confirmPasswordController,
                      maxLength: 20,
                      decoration: InputDecoration(
                        counterText: "",
                        // suffixIcon: Icon(
                        //   Icons.visibility_outlined,
                        //   color: Color(0xff909094),
                        // ),
                        // suffixIconConstraints:
                        //     BoxConstraints(minWidth: 10, minHeight: 10),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xff909094),
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
                    Container(
                      height: 50,
                      width: Get.width,
                      child: ElevatedButton(
                          onPressed: () {
                            if (controller.passwordController.text.toString().isEmpty ||
                                controller.confirmPasswordController.text.toString().isEmpty) {
                              Get.snackbar(
                                  'warning', "Please fill necessary fields!");
                              return;
                            }
                            controller.updatePassword(
                                controller.passwordController.text,
                                controller.confirmPasswordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColor,
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
