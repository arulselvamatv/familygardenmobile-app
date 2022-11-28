import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  RxBool isNameTextFielld = false.obs;
  RxBool isEmailTextFielld = false.obs;
  RxBool isMobileTextFielld = false.obs;
  RxBool isPasswordTextFielld = false.obs;
  RxBool isConfirmPasswordTextFielld = false.obs;
  RxBool showPassword = true.obs;
  RxBool showConfirmPassword = true.obs;

  bool isValidEmail(String emailString) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailString);
  }

  signUpBtn(context) async {
    var response = await ApiHelper.signup(
        firstnameController.text,
        emailController.text,
        telephoneController.text,
        passwordController.text,
        confirmController.text,
        '1');
    if (response.data?.errorWarning != "" ||
        response.data?.errorWarning != null) {
      firstnameController.text = "";
      emailController.text = "";
      telephoneController.text = "";
      passwordController.text = "";
      confirmController.text = "";
      isNameTextFielld.value = false;
      isEmailTextFielld.value = false;
      isMobileTextFielld.value = false;
      isPasswordTextFielld.value = false;
      isConfirmPasswordTextFielld.value = false;
      showPassword.value = true;
      showConfirmPassword.value = true;
      Get.toNamed(Routes.DASHBOARD);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Signup Successful Login to continue"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.data?.errorWarning ?? ""),
      ));
    }
  }
}
