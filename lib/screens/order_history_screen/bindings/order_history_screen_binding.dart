import '../controllers/order_history_screen_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class OrderHistoryScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderHistoryScreenController>(
      () => OrderHistoryScreenController(),
    );
  }
}
