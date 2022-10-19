import 'package:family_garden/network/api_helper.dart';

import '../../../models/payment_method_model.dart';
import '../../../utils/common_import/common_import.dart';

class PaymentController extends GetxController {
  RxBool isPaymentScreenLoader = false.obs;
  RxBool isCCavenueSelected = false.obs;
  RxBool isCODselected = false.obs;

  var paymentMethod = PaymentMethodModel().obs;
  @override
  void onInit() {
    super.onInit();
    getPaymentMethodDetails();
  }

  getPaymentMethodDetails() async {
    var response = await ApiHelper.paymentMethod();
    if (response.responseCode == 200) {
      paymentMethod.value = response.data!;
      isPaymentScreenLoader.value = true;
    }

    update();
  }

  onCheckBoxClickCCAvenue(value) {
    if (isCODselected.value == true) {
      isCODselected.value = !value;
      isCCavenueSelected.value = value;
    } else {
      isCCavenueSelected.value = value;
    }
    update();
  }

  onCheckBoxClickCOD(value) {
    if (isCCavenueSelected.value == true) {
      isCCavenueSelected.value = !value;
      isCODselected.value = value;
    } else {
      isCODselected.value = value;
    }
    update();
  }
}
