import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/cart_list_model.dart';
import '../../../network/api_constants/api_constants.dart';
import '../../../network/api_helper.dart';
import '../../../utils/common_import/common_import.dart';

class CartController extends GetxController {
  TextEditingController search = TextEditingController();
  TextEditingController cuponCode = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> showAppNotificationNotifierInitial = ValueNotifier(false);

  var products = CartListModel().obs;
  RxBool isProductsLoader = true.obs;
  String staticImage = "assets/images/Carrot.png";
  RxDouble savedPrice = 0.0.obs;
  RxDouble totalPrice = 0.0.obs;
  RxString total = ''.obs;
  RxInt productListLength = 0.obs;
  RxList counterList = [].obs;
  RxList checkBoxBoolList = [].obs;
  var productData = {"product_info": []}.obs;
  RxList optionId = [].obs;
  RxList optionValueId = [].obs;
  RxList productId = [].obs;
  RxList minusCounterList = [].obs;
  late Timer addCartTimer = Timer(const Duration(seconds: 300), () {});
  var isLoggedIn = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onInit() {
    super.onInit();
    getLoginDetails();
    getCartListDatas();
  }

  getLoginDetails() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("Login")) {
      String login = prefs.getString("Login")!;
      if (login == "true") {
        isLoggedIn.value = true;
      }
    }
    update();
  }

  getCartListDatas() async {
    var response = await ApiHelper.cartList();
    if (response.isSuccessFul) {
      products.value = response.data!;
      if (products.value.logged == null || products.value.logged == "null") {
        if (isLoggedIn.value == true) {
          showAppNotificationNotifierInitial.value = true;
        } else {
          isProductsLoader.value = false;
          getListDatas();
        }
      } else {
        isProductsLoader.value = false;
        getListDatas();
      }
    }
    update();
  }

  Future<String> getCoupon(String couponCode) async {
    var response = await ApiHelper.getCoupon(couponCode);
    print("Coupon Data ${response.data?.error}");
    return response.data?.error ?? "";
  }

  hitAddCartAPI() async {
    if ((productData.value["product_info"]?.length)! > 0) {
      var response = await ApiHelper.addCart(productData.value);
      if (response.isSuccessFul) {
        getCartListDatas();
      }
    } else {}
  }

  getListDatas() {
    productId.value.clear();
    optionId.value.clear();
    optionValueId.value.clear();
    counterList.value.clear();
    checkBoxBoolList =
        RxList<bool>.filled((products.value.products?.length)!, false);
    var actualPriceAmount = 0.0;
    var offerPriceAmount = 0.0;
    for (int i = 0; i < (products.value.products?.length)!; i++) {
      productId.value.add("");
      optionId.value.add("");
      optionValueId.value.add("");
      counterList.add(products.value.products?[i].quantity);
      var offerPrice =
          double.parse((products.value.products?[i].offerPrice?.substring(1))!);
      var actualPrice = double.parse(
          (products.value.products?[i].actualPrice?.substring(1))!);
      var percentage = ((actualPrice - offerPrice) / actualPrice) * 100;
      products.value.products?[i].offerPercentage = percentage.round();
      actualPriceAmount +=
          actualPrice * double.parse((products.value.products?[i].quantity)!);
      offerPriceAmount +=
          offerPrice * double.parse((products.value.products?[i].quantity)!);
    }
    totalPrice.value = offerPriceAmount;
    savedPrice.value = actualPriceAmount - offerPriceAmount;
    if (products.value.totals != null) {
      for (var item in products.value.totals!) {
        if (item.title == "Total") {
          total.value = item.text!;
        }
      }
    }
    productListLength.value = (products.value.products?.length)!;
    checkBoxBoolList.refresh();
    update();
  }

  onCheckBoxClick(bool? value, int index) {
    checkBoxBoolList[index] = value!;
    update();
  }

  addCartDatas(index) {
    productData.value["product_info"]?.add({
      "product_id": productId[index],
      "qty": 1,
      "product_option_id": optionId[index],
      "prodcut_option_value_id": optionValueId[index],
      "action": "ADD"
    });
    // if (addCartTimer.isActive) addCartTimer.cancel();
    // addCartTimer = Timer(Duration(seconds: 400), () async {
    //   hitAddCartAPI();
    // });
    update();
  }

  checkoutBtn() async {}

  removeCartDatas(index) {
    productData.value["product_info"]?.add({
      "product_id": productId[index],
      "qty": 1,
      "product_option_id": optionId[index],
      "prodcut_option_value_id": optionValueId[index],
      "action": "MINUS"
    });
    // print(productData.value);
    // if (addCartTimer.isActive) addCartTimer.cancel();
    // addCartTimer = Timer(Duration(seconds: 350), () async {
    //   hitAddCartAPI();
    // });
    update();
  }

  minus(int index) {
    double actualprice = double.parse(
        (products.value.products?[index].actualPrice)?.substring(1) ?? "0.0");
    print((products.value.products?[index].offerPrice)?.substring(1));
    double offerPrice = double.parse(
        (products.value.products?[index].offerPrice)?.substring(1) ?? "0");
    print((products.value.products?[index].offerPrice));
    print("$totalPrice $offerPrice");
    totalPrice.value = totalPrice.value - offerPrice;
    savedPrice.value = savedPrice.value - (actualprice - offerPrice);
    print(totalPrice.value);
    print(savedPrice.value);
    if (counterList.value[index] == "1") {
      counterList.value[index] = int.parse(counterList.value[index]) - 1;
      counterList.value[index] = "${counterList.value[index]}";
      print("counterList $counterList");
      removeProduct(index);
      // counterList.value.removeAt(index);
      print("Cart count ${counterList.isEmpty}");
    } else {
      counterList.value[index] = int.parse(counterList.value[index]) - 1;
      counterList.value[index] = "${counterList.value[index]}";
      print("counterList $counterList");
      removeProduct(index);
    }
    counterList.refresh();
    // }
    update();
    print(productData);
  }

  removeProduct(index) {
    print(products.value.products?[index].productId);
    int? quantityIncreasingIndex = productData.value["product_info"]
        ?.indexWhere((element) =>
            element["product_id"] ==
            products.value.products?[index].productId!);
    // print(quantityIncreasingIndex);
    int? minusIndex = productData.value["product_info"]
        ?.indexWhere((element) => element["action"] == "MINUS");
    print(minusIndex);
    if (quantityIncreasingIndex != -1 &&
        minusIndex != -1 &&
        quantityIncreasingIndex == minusIndex) {
      productData.value["product_info"]?[quantityIncreasingIndex!]["qty"] =
          productData.value["product_info"]?[quantityIncreasingIndex]["qty"] +
              1;
    } else {
      if (products.value.products?[index].productOptionId != null) {
        productId[index] = products.value.products?[index].productId!;
        optionId[index] = (products.value.products?[index].productOptionId)!;
        optionValueId[index] =
            (products.value.products?[index].productOptionValueId)!;
        removeCartDatas(index);
      } else {
        productId[index] = products.value.products?[index].productId!;
        removeCartDatas(index);
      }
    }
    print(productData);
  }

  existingAddCartData(index) {
    int? QuantityIncreasingIndex = productData.value["product_info"]
        ?.indexWhere((element) =>
            element["product_id"] ==
            products.value.products?[index].productId!);
    int? addIndex = productData.value["product_info"]
        ?.indexWhere((element) => element["action"] == "ADD");
    if (QuantityIncreasingIndex != -1 &&
        addIndex != -1 &&
        QuantityIncreasingIndex == addIndex) {
      productData.value["product_info"]?[QuantityIncreasingIndex!]["qty"] =
          productData.value["product_info"]?[QuantityIncreasingIndex]["qty"] +
              1;
      if (optionId.value[index] !=
          productData.value["product_info"]?[QuantityIncreasingIndex!]
              ["product_option_id"]) ;
      {
        productData.value["product_info"]?[QuantityIncreasingIndex!]
            ["product_option_id"] = optionId.value[index];
        productData.value["product_info"]?[QuantityIncreasingIndex!]
            ["prodcut_option_value_id"] = optionValueId.value[index];
      }
    } else {
      newAddCart(index);
    }
  }

  newAddCart(index) {
    if (products.value.products?[index].productOptionId != null) {
      if (optionId.value[index] == "") {
        productId[index] = products.value.products?[index].productId!;
        optionId[index] = (products.value.products?[index].productOptionId)!;
        optionValueId[index] =
            (products.value.products?[index].productOptionValueId)!;
        addCartDatas(index);
      }
    } else {
      productId[index] = products.value.products?[index].productId!;
      addCartDatas(index);
    }
  }

  add(int index) {
    counterList.value[index] = int.parse(counterList.value[index]) + 1;
    double actualprice = double.parse(
        (products.value.products?[index].actualPrice)?.substring(1) ?? "0.0");
    double offerPrice = double.parse(
        (products.value.products?[index].offerPrice)?.substring(1) ?? "0");
    totalPrice.value = totalPrice.value + offerPrice;
    savedPrice.value = savedPrice.value + (actualprice - offerPrice);
    counterList.value[index] = "${counterList.value[index]}";
    if ((productData.value["product_info"]?.length)! > 0) {
      existingAddCartData(index);
    } else {
      newAddCart(index);
    }
    update();
    print(productData);
  }
}
