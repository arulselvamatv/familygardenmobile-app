import 'dart:developer';

import '../../../network/api_helper.dart';
import '../../../utils/common_import/common_import.dart';
import 'package:family_garden/models/category_product_model.dart';

class OffersController extends GetxController {
  RxString staticImage = "assets/images/Fresh Vegetables.png".obs;
  RxList<Products> products = <Products>[].obs; // it's holder product model
  RxList counterList = [].obs;
  RxList cartBoolList = [].obs;
  RxList productId = [].obs;
  RxBool isCategoryProductLoader = true.obs;
  RxString categoryId = ''.obs;
  @override
  void onInit() async {
    super.onInit();
    getsCategory();
  }

  getsCategory() async {
    var response = await ApiHelper.getProductCategory("24");
    if (response.responseCode == 200) {
      products.value = (response.data?.products)!;
      getDropdownValues();
    }
  }

  getDropdownValues() {
    for (int i = 0; i < products.length; i++) {
      cartBoolList.add(false); //
      productId.value.add("");
      counterList.add(1);
    }
    // for (int i = 0; i < products.value.length; i++) {
    //
    // }
    // for (int i = 0; i < (products.value.length); i++) {
    //
    // }
    // for (int i = 0; i < (products.value.length); i++) {
    //   optionId.value.add("");
    // }
    // for (int i = 0; i < (products.value.length); i++) {
    //   optionValueId.value.add("");
    // }
    isCategoryProductLoader.value = false;
    // selectedDropdownValue.refresh();
    cartBoolList.refresh();
    counterList.refresh();
    productId.refresh();
    // optionId.refresh();
    // optionValueId.refresh();
    update();
  }

  cartButton(int index, String functionality) {
    if (cartBoolList[index] == false) {
      cartBoolList[index] = cartBoolList[index] == false ? true : true;
      // addToCart(index, "plus");
    } else if (functionality == "plus") {
      counterList[index] += 1;
      // addToCart(index, "plus");
    } else {
      if (counterList[index] == 1) {
        cartBoolList[index] = false;
        // addToCart(index, "minus");
      } else {
        counterList[index] -= 1;
        // addToCart(index, "minus");
      }
      cartBoolList.refresh();
    }
    // cartBoolList[index] = cartBoolList[index] == false ? true : true;
    // cartBoolList.refresh();
    update();
  }
}
