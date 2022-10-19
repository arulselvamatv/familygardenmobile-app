import 'package:family_garden/models/checkout_model.dart';

import '../../../network/api_helper.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';

class AddressController extends GetxController {
  var addressModel = CheckoutModel().obs;
  RxBool isaddressScreenLoader = false.obs;
  RxList checkBoxBoolList = [].obs;
  RxBool pickCheckBox = false.obs;
  var selectedAddressIndex = 0.obs;
  RxInt addressId = 0.obs;
  var formData = {
    "firstname": "",
    "lastname": "",
    "address_1": "",
    "city": "",
    "postcode": 0,
    "telephone": 0,
    "address_2": "",
    "company": "",
    "email": "gdeepacse1@gmail.com"
  };

  @override
  void onInit() {
    super.onInit();
    getCheckout();
  }

  getCheckout() async {
    print("object");
    var response = await ApiHelper.checkOut();
    addressModel.value = response.data!;
    if ((addressModel.value.addresses?.length)! > 0) {
      getDatas();
    }
    print(response.data?.countryId);
  }

  getDatas() {
    for (var i = 0; i < (addressModel.value.addresses?.length)!; i++) {
      checkBoxBoolList.value.add(false);
    }
    isaddressScreenLoader.value = true;
    update();
  }

  onCheckBoxClick(value, index) {
    if (addressModel.value.addresses?[index].addressId != "" &&
        addressModel.value.addresses?[index].addressId != " ") {
      addressId.value =
          int.parse((addressModel.value.addresses?[index].addressId)!);
      formData["firstname"] =
          (addressModel.value.addresses?[index].firstname) ?? "";
      formData["lastname"] =
          (addressModel.value.addresses?[index].lastname) ?? "";
      formData["address_1"] =
          (addressModel.value.addresses?[index].address_1) ?? "";
      formData["city"] = (addressModel.value.addresses?[index].city) ?? "";
      formData["postcode"] =
          (addressModel.value.addresses?[index].postcode) ?? 0;
      formData["telephone"] =
          (addressModel.value.addresses?[index].telephone) ?? 0;
      formData["address_2"] =
          (addressModel.value.addresses?[index].address_2) ?? "";
      formData["company"] =
          (addressModel.value.addresses?[index].company) ?? "";
      print(formData);
      //want to add a email
      // formData["email"] = (addressModel.value.addresses?[index].) ?? "";
    }
    int? searchIndex =
        checkBoxBoolList.indexWhere((element) => element == true);
    if (searchIndex != -1) {
      checkBoxBoolList[searchIndex] = false;
      checkBoxBoolList[index] = value;
    } else {
      checkBoxBoolList[index] = value;
    }
    pickCheckBox.value = true;
    update();
  }

  deliverHereBtn(context) async {
    if (pickCheckBox.value == true) {
      var response = await ApiHelper.paymentAddressSave(formData);
      if (response.responseCode == 200) {
        var response = await ApiHelper.shippingMethod();
        var response1 = await ApiHelper.shippingMethodSave();
        if (response1.responseCode == 200) {
          Get.toNamed(Routes.PAYMENT);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Something went wrong"),
          ));
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Something went wrong"),
      ));
    }
  }
}
