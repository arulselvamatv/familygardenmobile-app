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

  bool isValidEmail(String emailString) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailString);
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
    print("PASSWORD::::${response.data!.logged}");

    if (response.isSuccessFul)
    {

        Get.snackbar('success', "Your password has been updated successfully!");
        Navigator.of(Get.context!).pop();

    }
  }

  onPressSaveChangesBtn(context) async {
    var response = await ApiHelper.accountUpdate(nameController.text, "", emailController.text, telephoneController.text);

    if (response.isSuccessFul)
    {

        print("LOG222::::::${response.data!.logged }");
        print("Status of edit profile ${response.data!.status}");
        if (response.data!.status == 1) {
          print("Success");
          var prefs = await SharedPreferences.getInstance();
          prefs.setString("firstName", nameController.text);
          prefs.setString("lastName", '');
          prefs.setString("emailId", emailController.text);
          prefs.setString("telephone", telephoneController.text);
          // lastName.value = prefs.getString("lastName")!;
          // emailId.value = prefs.getString("emailId")!;
          // telephone.value = prefs.getString("telephone")!;
          // Get.snackbar('success', "Updated Successfully");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(response.data!.message ?? ""),
          ));
          Get.back();
        } else {
          // Get.snackbar(response.data!.message ?? "");
          // showAppNotificationNotifierInitial.value = true;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(response.data!.message ?? ""),
          ));
        }
    }
  }
}
