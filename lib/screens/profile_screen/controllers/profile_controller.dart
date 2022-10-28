import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    cityController.text = 'Chennai';
    stateController.text = 'Tamil Nadu';
  }

  Future<void> updatePassword(String password, String confirmPassword) async {
    var response = await ApiHelper.updatePassword(password, confirmPassword);
    print(response.isSuccessFul);
    if (response.isSuccessFul) {
      Get.snackbar('success', "Your password has been updated successfully!");

      Navigator.of(Get.context!).pop();
    }
  }
}
