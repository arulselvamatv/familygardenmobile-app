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
  var productData = {"product_info": []}.obs;
  @override
  void onInit() async {
    super.onInit();
    getsCategory();
  }

  getsCategory() async {
    clearAll();
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
    isCategoryProductLoader.value = false;
    cartBoolList.refresh();
    counterList.refresh();
    productId.refresh();
    update();
  }

  cartButton(int index, String functionality) {
    if (cartBoolList[index] == false) {
      cartBoolList[index] = cartBoolList[index] == false ? true : true;
      addToCart(index, "plus");
    } else if (functionality == "plus") {
      counterList[index] += 1;
    } else {
      if (counterList[index] == 1) {
        cartBoolList[index] = false;
      } else {
        counterList[index] -= 1;
      }
      cartBoolList.refresh();
    }
    update();
  }

  addToCart(index, value) async {
    if (value == "plus") {
      if ((productData.value["product_info"]?.length ?? 0) > 0) {
        existingAddCartData(index);
      } else {
        newAddCart(index);
      }
    } else {
      removeCartDatas(index);
    }
  }

  hitAddCartAPI() async {
    if ((productData.value["product_info"]?.length ?? 0) > 0) {
      print("AddCartAPI $productData");
      var response = await ApiHelper.addCart(productData.value);
    } else {}
    update();
  }

  clearAll() {
    productData.value = {"product_info": []};
    cartBoolList.clear();
    productId.clear();
    counterList.clear();
    isCategoryProductLoader.value = true;
    update();
  }

  removeCartDatas(index) {
    if ((productData.value["product_info"]?.length ?? 0) > 0) {
      int? QuantityIncreasingIndex = productData.value["product_info"]
          ?.indexWhere(
              (element) => element["product_id"] == products[index].productId!);
      if (QuantityIncreasingIndex != -1) {
        productData.value["product_info"]?[QuantityIncreasingIndex!]["qty"] =
            productData.value["product_info"]?[QuantityIncreasingIndex]["qty"] -
                1;
      }
    }
  }

  existingAddCartData(index) {
    int? QuantityIncreasingIndex = productData.value["product_info"]
        ?.indexWhere(
            (element) => element["product_id"] == products[index].productId!);
    print(QuantityIncreasingIndex);
    if (QuantityIncreasingIndex != -1) {
      productData.value["product_info"]?[QuantityIncreasingIndex!]["qty"] =
          productData.value["product_info"]?[QuantityIncreasingIndex]["qty"] +
              1;
    } else {
      newAddCart(index);
    }
  }

  newAddCart(index) {
    productId[index] = products[index].productId!;
    addCartDatas(index);
  }

  addCartDatas(index) {
    productData.value["product_info"]
        ?.add({"product_id": productId[index], "qty": 1, "action": "ADD"});
  }
}
