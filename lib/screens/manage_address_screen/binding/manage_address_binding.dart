import 'package:family_garden/screens/manage_address_screen/controller/manage_address_controller.dart';
import '../../../utils/common_import/common_import.dart';

class ManageAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageAddressController>(() => ManageAddressController());
  }
}
