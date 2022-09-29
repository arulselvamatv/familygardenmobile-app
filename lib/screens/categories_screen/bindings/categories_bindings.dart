import 'package:family_garden/screens/categories_screen/controllers/categories_controllers.dart';
import 'package:get/get.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(
          () => CategoriesController(),
    );
  }
}