import 'package:family_garden/screens/order_success_screen/controller/order_success_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class OrdersuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderSuccessController>(() => OrderSuccessController());
  }
}
