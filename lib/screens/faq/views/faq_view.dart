import 'dart:async';
import 'dart:io' as IO;

import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/common_appbar/custom_appbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
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
                        fit: BoxFit.scaleDown,
                        height: 24,
                        width: 24,
                      )),
                )
              ],
            ),
          ),
          font_size: 19,
          appbar_title: "FAQ",
          center_title: true,
          leading_image: "Add",
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )),
        child: Column(children: [
          Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: SizedBox(
                height: 30,
              )),
          Obx(
            () => Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 50),
                        height: Get.height,
                        child: WebView(
                          onWebViewCreated:
                              (WebViewController webViewController) {
                            print("webview created");
                            controller.webViewCtrl = webViewController;
                            controller.ctrl.complete(webViewController);
                          },
                          gestureRecognizers: controller.gestureRecognizers,
                          gestureNavigationEnabled: true,
                          navigationDelegate: (NavigationRequest request) {
                            int index = request.url.indexOf(":");
                            String email = request.url.substring(index + 1);
                            print(email);
                            if (request.url.contains("mailto:")) {
                              print("Request URL ${request.url}");
                              canLaunchUrl(Uri(
                                      scheme: 'mailto',
                                      path: email))
                                  .then((bool result) {
                                launchUrl(
                                  Uri(
                                      scheme: 'mailto',
                                      path: email),
                                  mode: LaunchMode.externalApplication,
                                );
                              });
                              return NavigationDecision.prevent;
                            } else if (request.url.contains("tg:")) {
                              canLaunchUrl(Uri(
                                      scheme: 'tg',
                                      path: 'resolve?domain=YourId'))
                                  .then((bool result) {
                                launchUrl(
                                  Uri(
                                      scheme: 'tg',
                                      path: 'resolve?domain=YourId'),
                                  mode: LaunchMode.externalApplication,
                                );
                              });
                              return NavigationDecision.prevent;
                            }
                            return NavigationDecision.navigate;
                          },
                          javascriptMode: JavascriptMode.unrestricted,
                          initialUrl: 'https://www.familygarden.in/faq',
                          onPageFinished: (String url) {
                            print("page initialized");
                            print(IO.Platform);
                            if (IO.Platform.isAndroid) {
                              print('Page finished loading: $url');
                              controller.webViewCtrl!
                                  .runJavascriptReturningResult("javascript:(function() { " +
                                      "var head = document.getElementsByTagName('header')[0];" +
                                      "head.parentNode.removeChild(head);" +
                                      "var title = Array.from(document.getElementsByClassName('navbar navbar-expand-lg navbar-light bg-white menu sticky-top'));" +
                                      "title.forEach(tit =>{ tit.remove();});" +
                                      "var title = Array.from(document.getElementsByClassName('container  mt-4'));" +
                                      "title.forEach(tit =>{ tit.remove();});" +
                                      "var footer = document.getElementsByTagName('footer')[0];" +
                                      "footer.parentNode.removeChild(footer);" +
                                      "document.getElementById('search').outerHTML='';" +
                                      "document.getElementsByClassName('sec-bg').outerHTML='';" +
                                      "})()")
                                  .then((value) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  controller.isLoader.value = true;
                                  debugPrint(
                                      'Page finished loading Javascript');
                                  controller.isLoader.refresh();
                                });
                              }).catchError(
                                      (onError) => debugPrint('$onError'));
                            } else {
                              controller.isLoader.value = true;
                              controller.isLoader.refresh();
                            }
                          },
                        ),
                      ),
                      controller.isLoader.value
                          ? Container()
                          : Positioned(
                              child: Container(
                              height: Get.height - 85,
                              color: controller.isLoader.value
                                  ? Colors.transparent
                                  : Colors.white,
                              child: controller.isLoader.value
                                  ? null
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                            ))
                    ],
                  ),
                ],
              ),
            )),
          )
        ]),
      ),
    );
  }
}
