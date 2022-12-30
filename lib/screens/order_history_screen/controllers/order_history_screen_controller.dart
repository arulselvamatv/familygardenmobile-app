import 'package:family_garden/models/order_history_model.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import '../../../models/category_product_model.dart';

class OrderHistoryScreenController extends GetxController {
  TextEditingController search = TextEditingController();
  RxInt categoriesIndex = 1.obs;
  RxString categoryId = ''.obs;
  RxString title = "".obs;
  RxString staticImage = "assets/images/Fresh Vegetables.png".obs;
  RxString categoryName = "Fresh Vegetables".obs;
  RxList optionId = [].obs;
  RxList optionValueId = [].obs;
  RxList productId = [].obs;
  //RxList<ProductOptionValue> dropdownList = <ProductOptionValue>[].obs;
  RxList counterList = [].obs;
  RxList cartBoolList = [].obs;
  final orders = RxList<Orders>([]);
  RxBool isProductLoader = true.obs;
  var productData = {"product_info": []}.obs;

  @override
  void onInit() async {
    super.onInit();
    getOrdersHistory();
  }

  getOrdersHistory() async {
    orders.clear();
    var response = await ApiHelper.getOrders(false);
    print("response:::${response.data}");
    if (response.responseCode == 200) {
      for (var v in response.data!.orders!) {
        orders.add(v);
      }
      isProductLoader.value = false;
    }

    update();
  }
}
