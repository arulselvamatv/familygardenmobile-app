import 'package:family_garden/screens/register_screen/controller/register_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
