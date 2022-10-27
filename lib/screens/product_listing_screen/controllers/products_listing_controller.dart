import 'dart:async';

import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:get/get.dart';
import '../../../models/categories_model.dart';
import '../../../models/category_product_model.dart';
import '../../../models/product_add_cart_model.dart';
import '../../../utils/common_import/common_import.dart';

class ProductListingController extends GetxController {
  RxInt categoriesIndex = 1.obs;
  RxString categoryId = ''.obs;
  RxString title = "".obs;
  RxString staticImage = "assets/images/Fresh Vegetables.png".obs;
  RxString categoryName = "Fresh Vegetables".obs;
  RxList selectedDropdownValue = [].obs;
  RxList optionId = [].obs;
  RxList optionValueId = [].obs;
  RxList productId = [].obs;
  RxList<ProductOptionValue> dropdownList = <ProductOptionValue>[].obs;
  RxList selectedItemValue = [].obs;
  RxList counterList = [].obs;
  RxList<Category> categoriesList = <Category>[].obs;
  RxBool isCategoryLoader = true.obs;
  RxList cartBoolList = [].obs;
  RxList<Products> products = <Products>[].obs;
  RxBool isCategoryProductLoader = true.obs;
  var productData = {"product_info": []}.obs;

  @override
  void onInit() async {
    super.onInit();
    getCategory();
  }

  getCategory() async {
    print(ApiConstants.jwtToken);
    categoriesIndex.value = Get.arguments;
    var respone = await ApiHelper.getCategories();
    if (respone.isSuccessFul) {
      categoriesList.value = (respone.data?.categories)!;
      isCategoryLoader.value = false;
      title.value = categoriesList.value[categoriesIndex.value].name!;
      categoryId.value = categoriesList[categoriesIndex.value].categoryId!;
      getCategoryProduct(categoriesList[categoriesIndex.value].categoryId);
    }
    update();
  }

  getCategoryProduct(categoryId) async {
    // print(getCategory());
    clearAll();
    var response = await ApiHelper.getProductCategory(categoryId);
    if (response.responseCode == 200) {
      products.value = (response.data?.products)!;
      // selectedDropdownValue.value =
      //     (products[0].option?[0].productOptionValue?[0].productOptionValueId)!;
      getDropdownValues();
    }
    update();
  }

  clearAll() {
    selectedDropdownValue.value.clear();
    cartBoolList.value.clear();
    counterList.value.clear();
    productId.value.clear();
    optionId.value.clear();
    optionValueId.value.clear();
    isCategoryProductLoader.value = true;
    productData.value = {"product_info": []};
    update();
  }

  getDropdownValues() {
    for (int i = 0; i < (products.value.length); i++) {
      selectedDropdownValue.value.add("");
    }
    for (int i = 0; i < products.length; i++) {
      cartBoolList.add(false);
    }
    for (int i = 0; i < products.value.length; i++) {
      counterList.add(1);
    }
    for (int i = 0; i < (products.value.length); i++) {
      productId.value.add("");
    }
    for (int i = 0; i < (products.value.length); i++) {
      optionId.value.add("");
    }
    for (int i = 0; i < (products.value.length); i++) {
      optionValueId.value.add("");
    }
    isCategoryProductLoader.value = false;
    selectedDropdownValue.refresh();
    cartBoolList.refresh();
    counterList.refresh();
    productId.refresh();
    optionId.refresh();
    optionValueId.refresh();
    update();
  }

  void categoriesOnTap(int index) {
    categoriesIndex.value = index;
    isCategoryProductLoader.value = true;
    print("Category ID : ${categoriesList.value[index].categoryId}");
    getCategoryProduct(categoriesList.value[index].categoryId);
    title.value = (categoriesList.value[index].name)!;
    update();
  }

  dropDownChanged(String? value, int index) {
    selectedItemValue[index] = value!;
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
      print("AddCartAPI $productData");
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
