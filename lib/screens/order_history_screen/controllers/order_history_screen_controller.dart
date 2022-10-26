
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
  RxList<Products> products = <Products>[].obs;
  RxBool isProductLoader = true.obs;
  var productData = {"product_info": []}.obs;

  @override
  void onInit() async {
    super.onInit();
    getCategoryProduct();
  }


  getCategoryProduct() async {
    var response = await ApiHelper.showWishList();
    if (response.responseCode == 200) {
      products.value = (response.data?.products)!;
      if(products.value.isEmpty){
        products.value.add(Products());
      }
      isProductLoader.value = false;
    }
    update();
  }




  cartButton(int index, String functionality) {
    if (cartBoolList[index] == false) {
      cartBoolList[index] = cartBoolList[index] == false ? true : true;
      addToCart(index, "plus");
    } else if (functionality == "plus") {
      counterList[index] += 1;
      addToCart(index, "plus");
    } else {
      if (counterList[index] == 1) {
        cartBoolList[index] = false;
        addToCart(index, "minus");
      } else {
        counterList[index] -= 1;
        addToCart(index, "minus");
      }
      cartBoolList.refresh();
    }
    // cartBoolList[index] = cartBoolList[index] == false ? true : true;
    // cartBoolList.refresh();
    update();
  }

  addCartDatas(index) {
    productData.value["product_info"]?.add({
      "product_id": productId[index],
      "qty": 1,
      "product_option_id": products[index].productId!,
      "prodcut_option_value_id": optionValueId[index],
      "action": "ADD"
    });
  }

  hitAddCartAPI() async {
    if ((productData.value["product_info"]?.length ?? 0) > 0) {
      print(productData);
      var response = await ApiHelper.addCart(productData.value);
    } else {}
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

  newAddCart(index) {
    if (optionId.value[index] == "") {
      productId[index] = products[index].productId!;
      optionId[index] = (products[index].option?[0].productOptionId)!;
      optionValueId[index] = (products[index]
          .option?[0]
          .productOptionValue?[0]
          .productOptionValueId)!;
      addCartDatas(index);
    } else {
      productId[index] = products[index].productId!;
      addCartDatas(index);
    }
  }

  existingAddCartData(index) {
    int? QuantityIncreasingIndex = productData.value["product_info"]
        ?.indexWhere(
            (element) => element["product_id"] == products[index].productId!);
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

  addToCart(index, value) async {
    if (value == "plus") {
      if ((productData.value["product_info"]?.length ?? 0) > 0) {
        existingAddCartData(index);
      } else {
        newAddCart(index);
      }
    } else {
      if (optionId.value[index] == "") {
        productId[index] = products[index].productId!;
        optionId[index] = (products[index].option?[0].productOptionId)!;
        optionValueId[index] = (products[index]
            .option?[0]
            .productOptionValue?[0]
            .productOptionValueId)!;
      } else {
        productId[index] = products[index].productId!;
      }
      removeCartDatas(index);
    }
  }
}


