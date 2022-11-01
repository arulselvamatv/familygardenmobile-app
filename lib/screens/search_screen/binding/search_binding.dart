import 'package:family_garden/utils/common_import/common_import.dart';

import '../controller/search_controller.dart';


class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
  }
}
