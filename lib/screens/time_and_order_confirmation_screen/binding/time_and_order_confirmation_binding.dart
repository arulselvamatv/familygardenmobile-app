import 'package:family_garden/utils/common_import/common_import.dart';

import '../controller/time_and_order_confirmation_controller.dart';
class TimeAndOrderConfirmationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TimeAndOrderConfirmationController>(() => TimeAndOrderConfirmationController());
  }
}