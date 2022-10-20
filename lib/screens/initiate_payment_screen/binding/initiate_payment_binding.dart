import 'package:family_garden/screens/initiate_payment_screen/controller/initiate_payment_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class InitiatePaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitatePaymentController());
  }
}
