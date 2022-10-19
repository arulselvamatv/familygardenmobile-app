import 'package:family_garden/models/cart_list_model.dart';
import 'package:family_garden/network/api_helper.dart';

import '../../../models/product_add_cart_model.dart';
import '../../../utils/common_import/common_import.dart';

class CartController extends GetxController {
  TextEditingController search = TextEditingController();
  TextEditingController cuponCode = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var products = CartListModel().obs;
  RxBool isProductsLoader = false.obs;
  String staticImage = "assets/images/Carrot.png";
  RxDouble savedPrice = 0.0.obs;
  // RxList cartList = [
  //   {
  //     'name': 'Carrot',
  //     'nameInTamil': 'கேரட்',
  //     'price': '₹32.00',
  //     'oldPrice': '₹35.00',
  //     'offer': '9% OFF',
  //     'image': 'assets/images/Carrot.png',
  //     'grams': '250 grams'
  //   },
  //   {
  //     'name': 'Coriander Leaves',
  //     'nameInTamil': 'கொத்தமல்லி தழை ',
  //     'price': '₹15.00',
  //     'oldPrice': '₹30.00',
  //     'offer': '50% OFF',
  //     'image': 'assets/images/coriander.png',
  //     'grams': '1 bunch'
  //   },
  //   {
  //     'name': 'Apple 3piece-450-550gm',
  //     'nameInTamil': 'ஆப்பிள் ',
  //     'price': '₹125.00',
  //     'oldPrice': '₹150.00',
  //     'offer': '17% OFF',
  //     'image': 'assets/images/apple.png',
  //     'grams': '1 pack'
  //   },
  // ].obs;
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
    for (int i = 0; i < (products.value.products?.length)!; i++) {
      String actualPrice = (products.value.products?[i].actualPrice)!;
      if (products.value.products?[i].quantity != "1") {
        var data = double.parse((products.value.products?[i].quantity)!) *
            double.parse(actualPrice);
        actualPrice = "$data";
      }
      savedPrice.value = savedPrice.value + double.parse(actualPrice);
    }
    print(savedPrice.value);
    print(products.value.totals?[1].text);
    savedPrice.value = savedPrice.value -
        double.parse((products.value.totals?[1].text)!.substring(1));
    for (int i = 0; i < (products.value.products?.length)!; i++) {
      checkBoxBoolList.value.add(false);
    }
    print("products.value.products?.length ${products.value.products?.length}");
    print(checkBoxBoolList.length);
    checkBoxBoolList.refresh();
    update();
  }

  onCheckBoxClick(bool? value, int index) {
    checkBoxBoolList[index] = value!;
    update();
  }

  minus(int index) {
    if (counterList.value[index] == "1") {
      return;
    } else {
      counterList.value[index] = int.parse(counterList.value[index]) - 1;
      counterList.value[index] = "${counterList.value[index]}";
      update();
    }
    update();
  }

  add(int index) {
    counterList.value[index] = int.parse(counterList.value[index]) + 1;
    counterList.value[index] = "${counterList.value[index]}";
    update();
  }
}
