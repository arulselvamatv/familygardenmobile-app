import 'dart:async';
import 'dart:developer';
import 'package:family_garden/network/api_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../network/api_constants/api_constants.dart';
import '../../../network/set_local_datas.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    log("A:${await FirebaseMessaging.instance.getToken()}");
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
    super.onInit();
    getToken();
  }

  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("api_token")) {
      ApiConstants.jwtToken = prefs.getString("api_token")!;
      Timer(const Duration(seconds: 2), () => Get.offNamed(Routes.DASHBOARD));
    } else {
      var response = await ApiHelper.getToken();
      print(response.data?.apiToken);
      if (response.data?.apiToken != null) {
        SetLocalDatas.setToken((response.data?.apiToken)!);
        Timer(const Duration(seconds: 2), () => Get.offNamed(Routes.DASHBOARD));
      }
    }
  }
}
