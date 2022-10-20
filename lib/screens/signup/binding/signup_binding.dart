import 'package:family_garden/utils/common_import/common_import.dart';

import '../controller/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
