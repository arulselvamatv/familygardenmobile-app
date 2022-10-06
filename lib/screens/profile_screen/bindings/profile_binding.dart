import 'package:family_garden/screens/profile_screen/controllers/profile_controller.dart';
import '../../../utils/common_import/common_import.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
