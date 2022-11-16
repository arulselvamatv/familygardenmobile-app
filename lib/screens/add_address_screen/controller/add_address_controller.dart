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
  RxString addresId = "".obs;

  @override
  void onInit() {
    cityController.text = 'Chennai';
    stateController.text = 'Tamil Nadu';
    if (Get.arguments != null) {
      getAddressData(addressId: Get.arguments);
    }
    super.onInit();
  }

  getAddressData({required String addressId}) async {
    var response = await ApiHelper.addressDetails(addressId);
    if (response != null) {
      print(response["address"]["address_id"]);
      addresId.value = response["address"]["address_id"];
      nameController.text = response["address"]["firstname"];
      phoneNumController.text = response["address"]["telephone"];
      pinCodeController.text = response["address"]["postcode"];
      addressController.text = response["address"]["address_1"];
      update();
    }
  }

  saveAddress() async {
    if (Get.arguments != null) {
      var response = await ApiHelper.editAddress(
        addresId.value,
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
    } else {
      var response = await ApiHelper.addAddresses(
        nameController.text,
        addressController.text,
        "99",
        "1503",
        phoneNumController.text,
        cityController.text,
        pinCodeController.text,
      );
      print(response.responseCode);
      if (response.responseCode == 200) {
        Get.back();
      }
    }
  }

  bool isValidEmail(String emailString) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailString);
  }
}
