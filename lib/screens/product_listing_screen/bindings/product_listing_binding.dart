import 'package:family_garden/screens/product_listing_screen/controllers/products_listing_controller.dart';
import 'package:get/get.dart';

class ProductListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListingController>(
          () => ProductListingController(),
    );
  }
}