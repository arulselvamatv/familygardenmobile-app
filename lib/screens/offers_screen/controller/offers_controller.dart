import '../../../network/api_helper.dart';
import '../../../utils/common_import/common_import.dart';
import 'package:family_garden/models/category_product_model.dart';

class OffersController extends GetxController {
  RxList<Products> products = <Products>[].obs;
  @override
  void onInit() async {
    super.onInit();
    getCategory();
  }

  getCategory() async {
    var response = await ApiHelper.getProductCategory("24");
    if (response.responseCode == 200) {
      products.value = (response.data?.products)!;
    }
  }
}
