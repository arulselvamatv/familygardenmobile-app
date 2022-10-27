import 'package:family_garden/screens/offers_screen/controller/offers_controller.dart';

import '../../../utils/common_import/common_import.dart';

class OfferScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OffersController>(() => OffersController());
  }
}
