import 'package:family_garden/screens/change_password_screen/controller/change_password_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordController());
  }
}
