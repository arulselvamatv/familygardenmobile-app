import 'package:family_garden/network/api_helper.dart';

import '../../../utils/common_import/common_import.dart';

class AddAddressController extends GetxController {
  RxBool isHomeClicked = false.obs;
  RxBool isWorkClicked = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();

  @override
  void onInit() {
    cityController.text = 'Chennai';
    stateController.text = 'Tamil Nadu';
    super.onInit();
  }

  saveAddress() async {
    var response = await ApiHelper.addAddresses(
      nameController.text,
      addressController.text,
      "99",
      "1503",
      phoneNumController.text,
      cityController.text,
      pinCodeController.text,
    );
    if (response.responseCode == 200) {
      Get.back();
    }
  }

  bool isValidEmail(String emailString) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailString);
  }
}
