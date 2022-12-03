import 'dart:convert';

import 'package:family_garden/routes/app_pages.dart';
import 'package:family_garden/screens/initiate_payment_screen/controller/initiate_payment_controller.dart';
import 'package:family_garden/screens/order_success_screen/view/order_success_view.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';

class InitiatePaymentView extends GetView<InitatePaymentController> {
  @override
  var controller = Get.put(InitatePaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAppbarView(
          leading_width: 50,
          appbar_leading: Container(
            width: 14,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/BackIcon.svg',
                        height: 24,
                        width: 24,
                      )),
                )
              ],
            ),
          ),
          font_size: 19,
          appbar_title: 'Payments',
          center_title: true,
          leading_image: "Add",
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )),
        child: WebView(
          // initialUrl: (controller.paymentRes?.payment.action)!,
          initialUrl: (controller.data),
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            print(controller.data);
            controller.webController = webViewController;
          },
          onPageStarted: (String url) {
            try {
              print("onPageStarted :: $url");
              controller.url = (url);
            } catch (e) {
              print(e);
            }
          },
          onPageFinished: (String url) async {
            try {
              controller.url = url.toString();
              print("onPageFinished $url");
              // showLog("URL $url");
              if (url.toString().contains(controller.paymentUrl)) {
                Uri uri = Uri.parse(url.toString());
                // if (url.toString().contains("order_id")) {
                //   controller.showLog("FINAL $url");
                //   String? orderNumber = uri.queryParameters['order_id'];
                //   var prefs = await SharedPreferences.getInstance();
                //   await prefs.setString("orderNumber", orderNumber!);
                //   print("orderNumber ::::$orderNumber");
                Get.back();
                Get.offAndToNamed(Routes.ORDER_SUCCESS_SCREEN);
                // Get.to(() => Routes.ORDER_SUCCESS_SCREEN, arguments: [
                //   {"first": 'First data'},
                //   {"second": 'Second data'}
                // ]);
                // Get.toNamed<void>(Routes.ORDER_SUCCESS_SCREEN, arguments: {"orderNumber": orderNumber});
                // }
              }
            } catch (e) {
              print(e);
            }
          },
        ),
        // child: InAppWebView(
        //   initialOptions:
        //       InAppWebViewGroupOptions(crossPlatform: InAppWebViewOptions()),
        //   onWebViewCreated: (InAppWebViewController controllers) {
        //     controller.postData = "encRequest=" +
        //         (controller.paymentRes?.payment.encRequest)! +
        //         "&access_code=" +
        //         (controller.paymentRes?.payment.accessCode)!;
        //     controller.webViewController = controllers;
        //     controller.webViewController?.postUrl(
        //         url: Uri.parse((controller.paymentRes?.payment.action)!),
        //         postData: utf8.encode(controller.postData));
        //   },
        //   onLoadStart: (InAppWebViewController controllers, Uri? url) {
        //     try {
        //       controller.url = (url?.path)!;
        //     } catch (e) {
        //       print(e);
        //     }
        //   },
        //   onLoadStop: (InAppWebViewController controllers, Uri? url) async {
        //     try {
        //       controller.url = url.toString();
        //       print("URL $url");
        //       // showLog("URL $url");
        //       if (url.toString().contains(controller.paymentUrl)) {
        //         Uri uri = Uri.parse(url.toString());
        //         if (url.toString().contains("order_id")) {
        //           controller.showLog("FINAL $url");
        //           /*
        //                               String route = uri.queryParameters['route'];
        //                               Uri uriForOrder = Uri.parse(route.toString());
        //                               String orderNumber = uriForOrder.queryParameters['order_id'];
        //                               showLog("ORDER $orderNumber");
        //                               */
        //           String? orderNumber = uri.queryParameters['order_id'];
        //           // Navigator.pop(context);
        //           // Navigator.pushNamed(context, RoutePaths.CCAOrderStatusView,
        //           //     arguments: orderNumber);
        //         }
        //       }
        //     } catch (e) {
        //       print(e);
        //     }
        //   },
        // ),
      ),
    );
  }
}
