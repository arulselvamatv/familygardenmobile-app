import '../controllers/wishlist_screen_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class WishListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishListScreenController>(
      () => WishListScreenController(),
    );
  }
}
