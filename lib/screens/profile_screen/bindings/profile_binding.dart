import 'package:family_garden/screens/profile_screen/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}