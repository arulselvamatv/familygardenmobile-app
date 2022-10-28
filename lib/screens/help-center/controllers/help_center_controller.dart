import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class HelpCenterController extends GetxController {
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers = [
    Factory(() => EagerGestureRecognizer()),
  ].toSet();

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
