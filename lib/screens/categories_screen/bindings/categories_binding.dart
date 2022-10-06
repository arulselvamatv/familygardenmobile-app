import 'package:family_garden/screens/categories_screen/controllers/categories_controller.dart';
import '../../../utils/common_import/common_import.dart';

class ProductListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
  }
}
