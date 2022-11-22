import 'package:family_garden/screens/forgot_password_screen/controller/forgot_password_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}
