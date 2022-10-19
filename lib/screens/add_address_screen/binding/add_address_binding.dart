import 'package:family_garden/screens/add_address_screen/controller/add_address_controller.dart';

import '../../../utils/common_import/common_import.dart';

class AddAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAddressController>(() => AddAddressController());
  }
}
