import 'package:family_garden/network/api_helper.dart';

import '../../../models/checkout_confirm_model.dart';
import '../../../models/payment_method_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';

class PaymentController extends GetxController {
  RxBool isPaymentScreenLoader = false.obs;
  RxBool isCCavenueSelected = false.obs;
  RxBool isCODselected = false.obs;
  CheckoutConfirmModel? paymentRes;

  var paymentMethod;
  @override
  void onInit() {
    super.onInit();
    getPaymentMethodDetails();
  }

  getPaymentMethodDetails() async {
    var response = await ApiHelper.paymentMethod();
    paymentMethod = response;
    // print(response.responseCode);
    // if (response.responseCode == 200) {
    //   print(response.body);
    isPaymentScreenLoader.value = true;
    var res = await ApiHelper.paymentMethodSave();
    var checkoutResponse = await ApiHelper.checkOutConfirm();
    paymentRes = checkoutResponse.data!;
    // }

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

  continueBtn(context) {
    Get.toNamed(Routes.INITIATEPAYMENT, arguments: paymentRes);
  }
}
