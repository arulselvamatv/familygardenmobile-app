import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter_svg/svg.dart';

import '../../../network/api_helper.dart';
import '../../../routes/app_pages.dart';

class ChangePasswordController extends GetxController {
  final formGlobalKey = GlobalKey<FormState>();
  RxBool isErrorPassword = false.obs;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;
  RxString mobileNum = "".obs;

  @override
  void onInit(){
    getDatas();
  }

getDatas() {
  if (Get.arguments != null) {
    mobileNum.value = Get.arguments;
  }
}

  Future<void> updatePassword(String password, String confirmPassword,context,controller) async {
    print("Upgrade password");
    if(Get.arguments!=null){
      var response = await ApiHelper.forgotPassword(password, confirmPassword,mobileNum.value);
      print(response.responseCode);
      if (response.responseCode == 200) {
        // Get.snackbar('success', "Your password has been updated successfully!");
        openAlertBox(context, controller);
        // Get.toNamed(Routes.DASHBOARD);
      } else {
        // openAlertBox(context, controller);
        isErrorPassword.value = true;
      }
    }else{
      var response = await ApiHelper.updatePassword(password, confirmPassword);
      print(response.responseCode);
      if (response.responseCode == 200) {
        // Get.snackbar('success', "Your password has been updated successfully!");
        openAlertBox(context, controller);
        // Get.toNamed(Routes.DASHBOARD);
      } else {
        // openAlertBox(context, controller);
        isErrorPassword.value = true;
      }
    }

    update();
    /* else
      {
        Navigator.of(Get.context!).pop();
        showAppNotificationNotifierInitial.value = true;
      }*/
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
                                      Get.toNamed(Routes.DASHBOARD);
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
