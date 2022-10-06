import 'package:family_garden/screens/cart_screen/controllers/cart_controller.dart';
import '../../../utils/common_import/common_import.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
