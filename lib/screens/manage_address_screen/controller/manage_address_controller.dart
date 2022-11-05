import 'package:family_garden/network/api_helper.dart';

import '../../../models/account_address_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';

class ManageAddressController extends GetxController {
  RxList addressList = [
    "No.1, xyz road, abcd street ...",
    "No.2., xyz road, abcd street ..."
        ""
  ].obs;
  RxBool isLoader = false.obs;
  RxBool isEmptyAddress = false.obs;
  RxInt selectedAddress = 0.obs;
  var addresses = AccountAddressModel().obs;
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  void onInit() {
    super.onInit();
    assignFixedValues();
  }

  assignFixedValues() {
    getAccountAddresses();
    cityController.text = "Chennai";
    stateController.text = "Tamil Nadu";
  }

  getAccountAddresses() async {
    var response = await ApiHelper.accountAddress();
    if (response.responseCode == 200) {
      isLoader.value = true;
    }
    if (response.data?.logged == null || response.data?.logged == "null") {
      Get.offNamed(Routes.LOGIN);
    }
    if (response.data?.addresses?.isEmpty ?? false) {
      isEmptyAddress.value = true;
    } else {
      addresses.value = response.data!;
    }
    print(response.data?.addresses?[0].addressId);
    update();
  }

  addAddressBtn(context) async {
    Get.toNamed(Routes.ADDADDRESS)?.then((value) => getAccountAddresses());
  }

  addressSelector(index) {
    selectedAddress.value = index;
    update();
  }

  onPressAddBtn() async {}
}
