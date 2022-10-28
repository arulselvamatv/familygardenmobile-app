import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:family_garden/widgets/common_appbar/custom_appbar_view.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import '../controllers/help_center_controller.dart';

class HelpCenterView extends GetView<HelpCenterController> {
  const HelpCenterView({Key? key}) : super(key: key);
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
                      child: Image.asset(
                        'assets/icons/backButton.png',
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
        height: Get.height,
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: WebView(
                  gestureRecognizers: controller.gestureRecognizers,
                  gestureNavigationEnabled: true,
                  initialUrl: 'https://www.familygarden.in/faq',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
