import 'package:family_garden/screens/categories_screen/controllers/categories_controller.dart';
import 'package:get/get.dart';

class ProductListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(
          () => CategoriesController(),
    );
  }
}