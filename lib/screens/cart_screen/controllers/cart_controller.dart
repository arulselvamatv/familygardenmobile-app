import 'package:family_garden/models/cart_list_model.dart';
import 'package:family_garden/network/api_helper.dart';

import '../../../utils/common_import/common_import.dart';

class CartController extends GetxController {
  TextEditingController search = TextEditingController();
  TextEditingController cuponCode = TextEditingController();
  var products = CartListModel().obs;
  RxBool isProductsLoader = false.obs;
  String staticImage = "assets/images/Carrot.png";
  RxList cartList = [
    {
      'name': 'Carrot',
      'nameInTamil': 'கேரட்',
      'price': '₹32.00',
      'oldPrice': '₹35.00',
      'offer': '9% OFF',
      'image': 'assets/images/Carrot.png',
      'grams': '250 grams'
    },
    {
      'name': 'Coriander Leaves',
      'nameInTamil': 'கொத்தமல்லி தழை ',
      'price': '₹15.00',
      'oldPrice': '₹30.00',
      'offer': '50% OFF',
      'image': 'assets/images/coriander.png',
      'grams': '1 bunch'
    },
    {
      'name': 'Apple 3piece-450-550gm',
      'nameInTamil': 'ஆப்பிள் ',
      'price': '₹125.00',
      'oldPrice': '₹150.00',
      'offer': '17% OFF',
      'image': 'assets/images/apple.png',
      'grams': '1 pack'
    },
  ].obs;
  RxList counterList = [].obs;
  RxList checkBoxBoolList = [].obs;

  void onInit() async {
    super.onInit();
    getCartListDatas();
    // checkBoxBoolList = RxList<bool>.filled(cartList.length, false);
  }

  getCartListDatas() async {
    var response = await ApiHelper.cartList();
    if (response.isSuccessFul) {
      products.value = response.data!;
      isProductsLoader.value = true;
      getListDatas();
    }
    update();
  }

  getListDatas() {
    checkBoxBoolList =
        RxList<bool>.filled((products.value.products?.length)!, false);

    for (int i = 0; i < (products.value.products?.length)!; i++) {
      counterList.add(products.value.products?[i].quantity);
    }

    // for (int i = 0; i < (products.value.products?.length)!; i++) {
    //   checkBoxBoolList.value.add(false);
    // }
    // print("products.value.products?.length ${products.value.products?.length}");
    // print(checkBoxBoolList.length);
    // checkBoxBoolList.refresh();
    update();
  }

  onCheckBoxClick(bool? value, int index) {
    checkBoxBoolList[index] = value!;
    update();
  }

  minus(int index) {
    if (counterList[index] == 0) {
      return;
    } else {
      counterList[index] -= 1;
    }
    update();
  }

  add(int index) {
    counterList[index] += 1;
    update();
  }
}
