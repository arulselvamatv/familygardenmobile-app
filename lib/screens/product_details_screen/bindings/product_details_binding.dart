import '../controllers/product_details_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(
      () => ProductDetailsController(),
    );
  }
}
