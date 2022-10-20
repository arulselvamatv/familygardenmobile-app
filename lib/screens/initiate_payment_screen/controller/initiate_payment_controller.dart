import 'dart:async';

import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../models/checkout_confirm_model.dart';

class InitatePaymentController extends GetxController {
  CheckoutConfirmModel? paymentRes;
  String postData = '', url = "";
  String paymentUrl = "https://tamilfarmers.in/checkout-msuccess";
  WebViewController? webController;
  String data = "";
  // InAppWebViewController? webViewController;
  bool isLogEnabled = true;

  @override
  void onInit() {
    if (Get.arguments != null) {
      paymentRes = Get.arguments;
      print("paymentRes?.payment.policylink ${paymentRes?.payment.policylink}");
      data = (paymentRes?.payment.action)! +
          "&encRequest=" +
          (paymentRes?.payment.encRequest)! +
          "&access_code=" +
          (paymentRes?.payment.accessCode)!;
    }
    super.onInit();
  }

  showLog(message) {
    if (isLogEnabled) {
      print("AEL: " + message);
    } else {}
  }
}
