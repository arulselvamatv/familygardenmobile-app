import 'package:family_garden/utils/common_import/common_import.dart';

import '../../../network/api_helper.dart';

class ChangePasswordController extends GetxController {
  final formGlobalKey = GlobalKey<FormState>();
  RxBool isErrorPassword = false.obs;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;

  Future<void> updatePassword(String password, String confirmPassword) async {
    var response = await ApiHelper.updatePassword(password, confirmPassword);
    if (response.responseCode == 200) {
      Get.snackbar('success', "Your password has been updated successfully!");
      Navigator.of(Get.context!).pop();
    } else {
      isErrorPassword.value = true;
    }
    update();
    /* else
      {
        Navigator.of(Get.context!).pop();
        showAppNotificationNotifierInitial.value = true;
      }*/
  }
}
