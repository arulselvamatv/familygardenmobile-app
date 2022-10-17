import '../../../utils/common_import/common_import.dart';

class ManageAddressController extends GetxController {
  RxList addressList = [
    "No.1, xyz road, abcd street ...",
    "No.2., xyz road, abcd street ..."
        ""
  ].obs;
  RxInt selectedAddress = 0.obs;
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  void onInit() {
    super.onInit();
    assignFixedValues();
  }

  assignFixedValues() {
    cityController.text = "Chennai";
    stateController.text = "Tamil Nadu";
  }

  addressSelector(index) {
    selectedAddress.value = index;
    update();
  }

  onPressAddBtn() async {}
}
