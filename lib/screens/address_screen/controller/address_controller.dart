import 'package:family_garden/models/checkout_model.dart';
import 'package:family_garden/network/api_constants/api_constants.dart';

import '../../../main.dart';
import '../../../network/api_helper.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';

class AddressController extends GetxController with RouteAware {
  ValueNotifier<bool> showAppNotificationNotifierInitial = ValueNotifier(false);
  var addressModel = CheckoutModel().obs;
  RxBool isLoader = true.obs;
  RxBool isaddressScreenLoader = false.obs;
  RxBool isEmptyAddress = true.obs;
  RxList checkBoxBoolList = [].obs;
  RxBool pickCheckBox = false.obs;
  RxBool isSelectAddress = false.obs;
  var selectedAddressIndex = 0.obs;
  RxDouble totalPrice = 0.0.obs;
  RxDouble savedPrice = 0.0.obs;
  RxInt addressId = 0.obs;
  var formData = {
    "address_id": "",
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
    if (Get.arguments != null) {
      totalPrice.value = Get.arguments[0];
      savedPrice.value = Get.arguments[1];
    }
    getCheckout();
  }

  // @override
  // void dispose() {
  //   routeObserver.unsubscribe(this);
  //   super.dispose();
  // }

  getCheckout() async {
    // is
    var response = await ApiHelper.checkOut(false);
    addressModel.value = response.data!;
    print(ApiConstants.jwtToken);
    print(addressModel.value.logged);
      if ((addressModel.value.addresses?.length)! > 0) {
        getDatas();
        isEmptyAddress.value = false;
      } else {
        isaddressScreenLoader.value = true;
      }
    addressModel.refresh();
    update();
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
      addressId.value = formData["address_id"] =
          int.parse((addressModel.value.addresses?[index].addressId)!);
      formData["firstname"] =
          (addressModel.value.addresses?[index].firstname) ?? "";
      formData["lastname"] =
          (addressModel.value.addresses?[index].lastname) ?? "";
      formData["address_1"] =
          (addressModel.value.addresses?[index].address1) ?? "";
      formData["city"] = (addressModel.value.addresses?[index].city) ?? "";
      formData["postcode"] =
          (addressModel.value.addresses?[index].postcode) ?? 0;
      formData["telephone"] =
          (addressModel.value.addresses?[index].telephone) ?? 0;
      formData["address_2"] =
          (addressModel.value.addresses?[index].address2) ?? "";
      formData["company"] =
          (addressModel.value.addresses?[index].company) ?? "";
    }
    int? searchIndex =
        checkBoxBoolList.indexWhere((element) => element == true);
    if (searchIndex != -1) {
      checkBoxBoolList[searchIndex] = false;
      isSelectAddress.value = value;
      checkBoxBoolList[index] = value;
    } else {
      isSelectAddress.value = value;
      checkBoxBoolList[index] = value;
    }
    pickCheckBox.value = true;
    update();
  }

  deliverHereBtn(context) async {
    isLoader.value = false;
    if (pickCheckBox.value == true) {
      var response = await ApiHelper.existingPaymentAddressSave(formData,false);
      if (response.responseCode == 200) {
        Future.delayed(Duration(seconds: 1), () async {
          var shippingMethodResponse = await ApiHelper.shippingMethod(false);
          if (shippingMethodResponse.responseCode == 200) {
            Future.delayed(Duration(seconds: 1), () async {
              var shippingMethodSaveResponse =
                  await ApiHelper.shippingMethodSave(false);
              if (shippingMethodSaveResponse.responseCode == 200) {
                isLoader.value = true;
                Get.toNamed(Routes.TIME_AND_ORDER_CONFIRMATION,arguments: [totalPrice.value,savedPrice.value,shippingMethodResponse.data?.shippingMethods?.flat?.quote?.flat?.cost]);
                // Get.toNamed(Routes.PAYMENT, arguments: [
                //   totalPrice.value,
                //   savedPrice.value,
                //   shippingMethodResponse
                //       .data?.shippingMethods?.flat?.quote?.flat?.cost,"",""
                // ]);
              } else {
                Get.snackbar('warning', "something went wrong");
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: Text("something went wrong"),
                // ));
              }
            });
          }
        });
      }
    } else {
      isLoader.value = false;
      Get.snackbar('warning', "Add address to continue");
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text("Add address to continue"),
      // ));
    }
  }
}
