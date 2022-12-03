import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/privacy_policy_controller.dart';
import 'package:family_garden/widgets/common_appbar/custom_appbar_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({Key? key}) : super(key: key);
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
                        height: 24,
                        width: 24,
                      )),
                )
              ],
            ),
          ),
          font_size: 19,
          appbar_title: "Privacy Policy",
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
          Expanded(
              child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  height: MediaQuery.of(context).size.height,
                  child: WebView(
                    onWebViewCreated: (WebViewController webViewController) {
                      controller.webViewCtrl = webViewController;
                      controller.ctrl.complete(webViewController);
                    },
                    gestureRecognizers: controller.gestureRecognizers,
                    gestureNavigationEnabled: true,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: 'https://www.familygarden.in/privacy-policy',
                    onPageFinished: (String url) {
                      print('Page finished loading: $url');
                      controller.webViewCtrl!
                          .evaluateJavascript("javascript:(function() { " +
                              "var head = document.getElementsByTagName('header')[0];" +
                              "head.parentNode.removeChild(head);" +
                              "var footer = document.getElementsByTagName('footer')[0];" +
                              "footer.parentNode.removeChild(footer);" +
                              "document.getElementById('search').outerHTML='';" +
                              "document.getElementsByClassName('sec-bg').outerHTML='';" +
                              "})()")
                          .then((value) =>
                              debugPrint('Page finished loading Javascript'))
                          .catchError((onError) => debugPrint('$onError'));
                    },
                  ),
                ),
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
