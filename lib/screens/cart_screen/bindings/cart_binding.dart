import 'package:family_garden/screens/cart_screen/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
          () => CartController(),
    );
  }

}