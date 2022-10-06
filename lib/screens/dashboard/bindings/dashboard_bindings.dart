import 'package:family_garden/screens/dashboard/controllers/dashboard_controller.dart';
import '../../../utils/common_import/common_import.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
