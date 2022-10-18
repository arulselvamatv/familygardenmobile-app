import 'package:family_garden/network/api_helper.dart';
import 'package:get/get.dart';
import '../../../models/categories_model.dart';
import '../../../models/category_product_model.dart';
import '../../../models/product_add_cart_model.dart';
import '../../../utils/common_import/common_import.dart';

class ProductListingController extends GetxController {
  RxInt categoriesIndex = 1.obs;

  // late RxString selectedValue = itemsList.first.obs;
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
  var dummyProductDatas = {
    "product_id": 0,
    "qty": 1,
    "product_option_id": 0,
    "prodcut_option_value_id": 0,
    "action": "ADD"
  };

  @override
  void onInit() async {
    super.onInit();
    getCategory();
  }

  getCategory() async {
    categoriesIndex.value = Get.arguments;
    var respone = await ApiHelper.getCategories();
    if (respone.isSuccessFul) {
      categoriesList.value = (respone.data?.categories)!;
      isCategoryLoader.value = false;
      title.value = categoriesList.value[categoriesIndex.value].name!;
      getCategoryProduct(categoriesList[categoriesIndex.value].categoryId);
    }
    update();
  }

  clearAll() {
    productId.value.clear();
    optionId.value.clear();
    optionValueId.value.clear();
    cartBoolList.value.clear();
    counterList.value.clear();
    selectedDropdownValue.value.clear();
  }

  getCategoryProduct(categoryId) async {
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
    update();
  }

  void categoriesOnTap(int index) {
    categoriesIndex.value = index;
    isCategoryProductLoader.value = true;
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
    // dummyProductDatas.clear();
    print(dummyProductDatas);
    print(productData);
  }

  hitAddCartAPI() async {
    print("Hitted API");
    print(productData);
    if ((productData.value["product_info"]?.length)! > 0) {
      print("object");
      var response = await ApiHelper.addCart(productData.value);
      print(response.data?.success);
    } else {
      print("No Datas Found");
    }
    //   if (response.data?.status == 1) {
    //     print("Successfully Added Data");
    //   }
    // } else {
    //   print("Something went wrong");
    // }
  }

  removeCartDatas(index) {
    productData.value["product_info"]?.clear();
  }

  addToCart(index, value) async {
    if (value == "plus") {
      if ((productData.value["product_info"]?.length)! > 0) {}
      if (optionId.value[index] == "") {
        productId[index] = products[index].productId!;
        optionId[index] = (products[index].option?[0].productOptionId)!;
        optionValueId[index] =
            (products[index].option?[0].productOptionValue?[0].optionValueId)!;
      } else {
        productId[index] = products[index].productId!;
      }
      addCartDatas(index);
    } else {
      if (optionId.value[index] == "") {
        productId[index] = products[index].productId!;
        optionId[index] = (products[index].option?[0].productOptionId)!;
        optionValueId[index] =
            (products[index].option?[0].productOptionValue?[0].optionValueId)!;
      } else {
        productId[index] = products[index].productId!;
      }

      removeCartDatas(index);
    }

    // var searchIndex = cartAddModel.value.productInfo
    //     ?.indexWhere((element) => element == products.value[index].productId);
    // if (searchIndex != -1) {
    //   // (cartAddModel.value.productInfo?[searchIndex!].qty)! + 1;
    // } else {
    //   productId[index] = products[index].productId!;
    //   optionId[index] = (products[index].option?[0].productOptionId)!;
    //   optionValueId[index] =
    //       (products[index].option?[0].productOptionValue?[0].optionValueId)!;
    //   int? addingIndex = cartAddModel.value.productInfo?.length;
    //   cartAddModel.value.productInfo?.add(productData);
    // }
    // if (value == "plus") {
    //   print(optionId.value[index]);
    //   if (optionId.value[index] == "") {
    //     productId[index] = products[index].productId!;
    //     optionId[index] = (products[index].option?[0].productOptionId)!;
    //     optionValueId[index] =
    //         (products[index].option?[0].productOptionValue?[0].optionValueId)!;
    //     var response = await ApiHelper.addCart(
    //         productId[index], optionId[index], optionValueId[index]);
    //   } else {
    //     print("We have optionId");
    //     productId[index] = products[index].productId!;
    //     // optionId[index] = (products[index].option?[0].productOptionId)!;
    //     // optionValueId[index] =
    //     //     (products[index].option?[0].productOptionValue?[0].optionValueId)!;
    //     var response = await ApiHelper.addCart(
    //         productId[index], optionId[index], optionValueId[index]);
    //   }
    // } else if (value == "minus") {}
  }

// minus(int index) {
//   if (counterList[index] == 1) {
//     cartBoolList[index] = false;
//     // return;
//   } else {
//     counterList[index] -= 1;
//   }
//   cartBoolList.refresh();
//   update();
// }
//
//   add(int index) {
//     counterList[index] += 1;
//     update();
//   }
}
