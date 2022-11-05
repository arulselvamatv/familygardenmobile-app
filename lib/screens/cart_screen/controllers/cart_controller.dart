import 'dart:async';
import 'package:family_garden/models/cart_list_model.dart';
import 'package:family_garden/network/api_helper.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';

class CartController extends GetxController {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController search = TextEditingController();
  TextEditingController cuponCode = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var products = CartListModel().obs;
  RxBool isProductsLoader = false.obs;
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

  void onInit() async {
    super.onInit();
    getCartListDatas();
  }

  getCartListDatas() async {
    var response = await ApiHelper.cartList();
    if (response.isSuccessFul) {
      products.value = response.data!;
      isProductsLoader.value = true;
      // if (products.value.logged == null || products.value.logged == "null") {
      //   Get.offNamed(Routes.LOGIN);
      // } else {
      //   isProductsLoader.value = true;
      // }

      getListDatas();
    }
    update();
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
    checkBoxBoolList =
        RxList<bool>.filled((products.value.products?.length)!, false);

    var actualPriceAmount = 0.0;
    var offerPriceAmount = 0.0;

    for (int i = 0; i < (products.value.products?.length)!; i++) {
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
    for (int i = 0; i < (products.value.products?.length)!; i++) {
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
    productData.value["product_info"]?.add({
      "product_id": productId[index],
      "qty": 1,
      "product_option_id": optionId[index],
      "prodcut_option_value_id": optionValueId[index],
      "action": "ADD"
    });
    if (addCartTimer.isActive) addCartTimer.cancel();
    addCartTimer = Timer(Duration(seconds: 400), () async {
      hitAddCartAPI();
    });
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
    if (addCartTimer.isActive) addCartTimer.cancel();
    addCartTimer = Timer(Duration(seconds: 350), () async {
      hitAddCartAPI();
    });
    update();
  }

  minus(int index) {
    if (counterList.value[index] == "0") {
      return;
    } else {
      counterList.value[index] = int.parse(counterList.value[index]) - 1;
      counterList.value[index] = "${counterList.value[index]}";
      removeProduct(index);
    }
    update();
  }

  removeProduct(index) {
    int? quantityIncreasingIndex = productData.value["product_info"]
        ?.indexWhere((element) =>
            element["product_id"] ==
            products.value.products?[index].productId!);
    int? minusIndex = productData.value["product_info"]
        ?.indexWhere((element) => element["action"] == "MINUS");
    if (quantityIncreasingIndex != -1) {
      if (minusIndex != -1) {
        if (quantityIncreasingIndex == minusIndex) {
          productData.value["product_info"]?[minusIndex!]["qty"] =
              productData.value["product_info"]?[minusIndex]["qty"] + 1;
        } else {
          productData.value["product_info"]?[minusIndex!]["qty"] =
              productData.value["product_info"]?[minusIndex]["qty"] + 1;
        }
      } else {}
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
    counterList.value[index] = "${counterList.value[index]}";
    if ((productData.value["product_info"]?.length)! > 0) {
      existingAddCartData(index);
    } else {
      newAddCart(index);
    }
    update();
  }
}
