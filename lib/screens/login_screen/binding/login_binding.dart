import 'package:family_garden/screens/login_screen/controller/login_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
