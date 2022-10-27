import 'dart:async';

import 'package:family_garden/models/cart_list_model.dart';
import 'package:family_garden/network/api_constants/api_end_points.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/product_add_cart_model.dart';
import '../../../utils/common_import/common_import.dart';

class CartController extends GetxController {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController search = TextEditingController();
  TextEditingController cuponCode = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var products = CartListModel().obs;
  RxBool isProductsLoader = false.obs;
  String staticImage = "assets/images/Carrot.png";
  RxDouble savedPrice = 0.0.obs;
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

  void onInit() async {
    super.onInit();
    getCartListDatas();
  }

  getCartListDatas() async {
    print(EndPoints.apiToken);
    var response = await ApiHelper.cartList();
    print(response.responseCode);
    if (response.isSuccessFul) {
      print('getCartListDatas successful');
      products.value = response.data!;
      isProductsLoader.value = true;
      getListDatas();
    }
    update();
  }

  hitAddCartAPI() async {
    print('hitAddCartAPI()');
    if ((productData.value["product_info"]?.length)! > 0) {
      var response = await ApiHelper.addCart(productData.value);
      if (response.isSuccessFul) {
        print('addCart successful');
        getCartListDatas();
      }
    } else {}
  }

  getListDatas() {
    checkBoxBoolList =
        RxList<bool>.filled((products.value.products?.length)!, false);

    var actualPriceAmount = 0.0;
    var offerPriceAmount = 0.0;

    for (int i = 0; i < (products.value.products?.length)!; i++) {
      counterList.add(products.value.products?[i].quantity);
      var offerPrice =
          double.parse((products.value.products?[i].offerPrice?.substring(1))!);
      // var actualPrice =
      //     double.parse((products.value.products?[i].actualPrice)!);
      // var percentage = ((actualPrice - offerPrice) / actualPrice) * 100;
      // products.value.products?[i].offerPercentage = "${percentage.toInt()}%";
      // print("$actualPriceAmount, $offerPriceAmount");
      // actualPriceAmount +=
      //     actualPrice * double.parse((products.value.products?[i].quantity)!);
      // offerPriceAmount +=
      //     offerPrice * double.parse((products.value.products?[i].quantity)!);
      // print("$actualPriceAmount, $offerPriceAmount");
    }
    savedPrice.value = actualPriceAmount - offerPriceAmount;
    for (int i = 0; i < (products.value.products?.length)!; i++) {
      String actualPrice = (products.value.products?[i].actualPrice)!;
      if (products.value.products?[i].quantity != "1") {
        var data = double.parse((products.value.products?[i].quantity)!) *
            double.parse(actualPrice);
        actualPrice = "$data";
      }
      for (int i = 0; i < (products.value.products?.length ?? 0); i++) {
        productId.value.add("");
      }
      for (int i = 0; i < (products.value.products?.length ?? 0); i++) {
        optionId.value.add("");
      }
      for (int i = 0; i < (products.value.products?.length ?? 0); i++) {
        optionValueId.value.add("");
      }
      for (int i = 0; i < (products.value.products?.length ?? 0); i++) {
        minusCounterList.value.add(0);
      }
    }
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
    print('addCartDatas(index)');
    productData.value["product_info"]?.add({
      "product_id": productId[index],
      "qty": 1,
      "product_option_id": optionId[index],
      "prodcut_option_value_id": optionValueId[index],
      "action": "ADD"
    });
    if (addCartTimer.isActive) addCartTimer.cancel();
    addCartTimer = Timer(Duration(seconds: 400), () async {
      print('addCartDatas hitAddCartAPI');
      hitAddCartAPI();
    });
    update();
  }

  checkoutBtn() async {}

  removeCartDatas(index) {
    print('removeCartDatas(index)');
    productData.value["product_info"]?.add({
      "product_id": productId[index],
      "qty": 1,
      "product_option_id": optionId[index],
      "prodcut_option_value_id": optionValueId[index],
      "action": "MINUS"
    });
    if (addCartTimer.isActive) addCartTimer.cancel();
    addCartTimer = Timer(Duration(seconds: 350), () async {
      print('removeCartDatas hitAddCartAPI');
      hitAddCartAPI();
    });
    update();
  }

  minus(int index) {
    print('minus called');
    if (counterList.value[index] == "1") {
      return;
    } else {
      counterList.value[index] = int.parse(counterList.value[index]) - 1;
      counterList.value[index] = "${counterList.value[index]}";
      removeProduct(index);
    }
    update();
  }

  removeProduct(index) {
    print(productData.value["product_info"]?.length);
    int? quantityIncreasingIndex = productData.value["product_info"]
        ?.indexWhere((element) =>
            element["product_id"] ==
            products.value.products?[index].productId!);
    int? minusIndex = productData.value["product_info"]
        ?.indexWhere((element) => element["action"] == "MINUS");
    print(quantityIncreasingIndex);
    if (quantityIncreasingIndex != -1) {
      if (minusIndex != -1) {
        if (quantityIncreasingIndex == minusIndex) {
          productData.value["product_info"]?[minusIndex!]["qty"] =
              productData.value["product_info"]?[minusIndex]["qty"] + 1;
        } else {
          productData.value["product_info"]?[minusIndex!]["qty"] =
              productData.value["product_info"]?[minusIndex]["qty"] + 1;
        }
      } else {
        print("Something went wrong");
      }
    } else {
      productId[index] = products.value.products?[index].productId!;
      optionId[index] =
          (products.value.products?[index].options?[0].productOptionId)!;
      optionValueId[index] = (products.value.products?[index].options?[0]
          .productOptionValue?[0].productOptionValueId)!;
      removeCartDatas(index);
    }
  }

  existingAddCartData(index) {
    int? QuantityIncreasingIndex = productData.value["product_info"]
        ?.indexWhere((element) =>
            element["product_id"] ==
            products.value.products?[index].productId!);
    if (QuantityIncreasingIndex != -1) {
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
    if (optionId.value[index] == "") {
      productId[index] = products.value.products?[index].productId!;
      optionId[index] =
          (products.value.products?[index].options?[0].productOptionId)!;
      optionValueId[index] = (products.value.products?[index].options?[0]
          .productOptionValue?[0].productOptionValueId)!;
      addCartDatas(index);
    } else {
      productId[index] = products.value.products?[index].productId!;
      addCartDatas(index);
    }
  }

  add(int index) {
    print('add called');
    counterList.value[index] = int.parse(counterList.value[index]) + 1;
    counterList.value[index] = "${counterList.value[index]}";
    if ((productData.value["product_info"]?.length)! > 0) {
      existingAddCartData(index);
    } else {
      newAddCart(index);
    }
    update();
  }
}
