import 'package:family_garden/screens/verify_otp_screen/controller/verify_otp_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class VerifyOTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyOTPController>(() => VerifyOTPController());
  }
}
