import 'package:family_garden/screens/Home_screen/controllers/homescreen_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(
          () => HomeScreenController(),
    );
  }
}