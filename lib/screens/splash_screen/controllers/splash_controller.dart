import 'dart:async';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {

  @override
  void onInit() async {
    super.onInit();
    Timer(const Duration(seconds: 2), () => Get.offNamed(Routes.HOME_SCREEN)
    );
  }

}
