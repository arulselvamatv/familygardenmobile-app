import 'package:family_garden/screens/drawer_screen/controllers/drawer_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class DrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerWidgetController>(
      () => DrawerWidgetController(),
    );
  }
}
