import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  // TextEditingController addressController = TextEditingController();
  // TextEditingController cityController = TextEditingController();
  // TextEditingController stateController = TextEditingController();
  // TextEditingController pinCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString emailId = "".obs;
  RxString telephone = "".obs;

  @override
  void onInit() async {
    super.onInit();
    // cityController.text = 'Chennai';
    // stateController.text = 'Tamil Nadu';
    getLocalDatas();
  }

  getLocalDatas() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("Login")) {
      firstName.value = prefs.getString("firstName")!;
      lastName.value = prefs.getString("lastName")!;
      emailId.value = prefs.getString("emailId")!;
      telephone.value = prefs.getString("telephone")!;
      nameController.text = firstName.value;
      emailController.text = emailId.value;
      telephoneController.text = telephone.value;
    }
  }

  Future<void> updatePassword(String password, String confirmPassword) async {
    var response = await ApiHelper.updatePassword(password, confirmPassword);
    print(response.isSuccessFul);
    if (response.isSuccessFul) {
      Get.snackbar('success', "Your password has been updated successfully!");

      Navigator.of(Get.context!).pop();
    }
  }

  onPressSaveChangesBtn(context) async {
    var response = await ApiHelper.accountUpdate(nameController.text, "",
        emailController.text, telephoneController.text);
    if (response == 1) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Updated Successfully"),
      ));
    }
  }
}
