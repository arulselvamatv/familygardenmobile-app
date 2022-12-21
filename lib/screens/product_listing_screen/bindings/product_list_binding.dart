import 'package:family_garden/utils/common_import/common_import.dart';

import '../controllers/product_list_controller.dart';

class ProductListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(() => ProductListController());
  }
}