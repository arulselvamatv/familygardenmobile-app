import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  signUpBtn(context) async {
    var response = await ApiHelper.signup(
        firstnameController.text,
        lastnameController.text,
        emailController.text,
        telephoneController.text,
        passwordController.text,
        confirmController.text,
        '1');
    if (response.data?.errorWarning != "" ||
        response.data?.errorWarning != null) {
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
