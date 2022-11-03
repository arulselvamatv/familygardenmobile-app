import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpCenterController extends GetxController {
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers = [
    Factory(() => EagerGestureRecognizer()),
  ].toSet();
  final Completer<WebViewController> ctrl = Completer<WebViewController>();

  WebViewController? webViewCtrl;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
