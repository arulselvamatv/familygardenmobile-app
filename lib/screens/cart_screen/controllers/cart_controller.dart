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
  RxInt productListLength = 0.obs;
  RxList counterList = [].obs;
  RxList checkBoxBoolList = [].obs;

  void onInit() async {
    super.onInit();
    getCartListDatas();
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
    // if ((products.value.products?.length)! > 0) {
    //   savedPrice.value = savedPrice.value -
    //       double.parse((products.value.totals?[1].text)!.substring(1));
    //   for (int i = 0; i < (products.value.products?.length)!; i++) {
    //     checkBoxBoolList.value.add(false);
    //   }
    // }
    productListLength.value = (products.value.products?.length)!;
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
