import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderSuccessController extends GetxController {
  dynamic argumentData = Get.arguments;

  @override
  void onInit() async {
    print(argumentData[0]['orderNumber']);
    // print(argumentData[1]['second']);
    super.onInit();
    // getHomeSliderDetails();
    // getCategories();
    // getHomeFeature();
    // orderId = Get.parameters["orderNumber"]!;
    // print('orderID $orderId');
  }

  // setOrder() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   orderId = prefs.getString("orderNumber")!;
  // }
}

// class InitatePaymentController extends GetxController {
//   CheckoutConfirmModel? paymentRes;
//   String postData = '', url = "";
//   String paymentUrl = "https://dev.familygarden.in/checkout-msuccess";
//   WebViewController? webController;
//   String data = "";
//   // InAppWebViewController? webViewController;
//   bool isLogEnabled = true;
//
//   @override
//   void onInit() {
//     if (Get.arguments != null) {
//       paymentRes = Get.arguments;
//       print("paymentRes?.payment.policylink ${paymentRes?.payment.policylink}");
//       data = (paymentRes?.payment.action)! +
//           "&encRequest=" +
//           (paymentRes?.payment.encRequest)! +
//           "&access_code=" +
//           (paymentRes?.payment.accessCode)!;
//     }
//     super.onInit();
//   }
//
//   showLog(message) {
//     if (isLogEnabled) {
//       print("AEL: " + message);
//     } else {}
//   }
// }
