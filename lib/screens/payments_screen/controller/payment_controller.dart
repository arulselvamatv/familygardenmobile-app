import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:http/http.dart' as http;
import '../../../models/checkout_confirm_model.dart';
import '../../../models/payment_method_model.dart';
import '../../../network/api_constants/api_end_points.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';

class PaymentController extends GetxController {
  RxBool isPaymentScreenLoader = false.obs;
  RxBool isCCavenueSelected = false.obs;
  RxBool isCODselected = false.obs;
  CheckoutConfirmModel? paymentRes;
  RxBool isCartEmpty = false.obs;

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
    if (checkoutResponse.data == null) {
      isCartEmpty.value = true;
    } else {
      paymentRes = checkoutResponse.data!;
    }
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

  codMethod() async {
    var request = http.Request(
        'POST',
        Uri.parse(
            '${ApiConstants.baseUrl}/index.php?route=mobileapi/payment/cod/confirm${EndPoints.apiToken}'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Get.toNamed(Routes.ORDER_SUCCESS_SCREEN);
    } else {
      print(response.reasonPhrase);
    }
  }

  continueBtn(context) {
    if (isCCavenueSelected.value || isCODselected.value) {
      if (isCCavenueSelected.value) {
        Get.toNamed(Routes.INITIATEPAYMENT, arguments: paymentRes);
      } else {
        codMethod();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Select the payment method proceed"),
      ));
    }
  }
}
