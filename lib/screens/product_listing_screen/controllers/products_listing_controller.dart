import 'package:family_garden/network/api_helper.dart';
import '../../../models/categories_model.dart';
import '../../../models/category_product_model.dart';
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
  RxInt cartCount = 0.obs;
  TextEditingController search = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxInt onPageChange = 1.obs;
  RxInt totalPages = 1.obs;
  @override
  void onInit() async {
    super.onInit();
    categoriesIndex.value = Get.arguments[0];
    categoryId.value = Get.arguments[1];
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (onPageChange.value <= totalPages.value) {
          getCategoryProduct(categoryId.value, onPageChange.value, fg: true);
        }
      }
    });
    getCategory();
    getCartCount();
  }

  getCategory() async {
    isCategoryLoader.value = true;
    var respone = await ApiHelper.getCategories();
    if (respone.isSuccessFul) {
      categoriesList.value = (respone.data?.categories)!;
      isCategoryLoader.value = false;
      title.value = categoriesList.value[categoriesIndex.value].name!;
      getCategoryProduct(categoryId.value, onPageChange.value);
    }
    update();
  }

  getCategoryProduct(categoryId, page, {bool? fg = false}) async {
    if (onPageChange.value == 1) {
      isCategoryProductLoader.value = true;
    }
    if (fg == false) {
      clearAll();
    }
    var response = await ApiHelper.getProductCategory(categoryId, page);
    if (response.responseCode == 200) {
      if (onPageChange.value == 1) {
        products.value = (response.data?.products)!;
        totalPages.value = (response.data?.pagination?.numPages)!;
        onPageChange.value++;
      } else {
        totalPages.value = (response.data?.pagination?.numPages)!;
        onPageChange.value++;
        products.value.addAll((response.data?.products)!);
      }
      getDropdownValues();
    }
    update();
  }

  clearAll() {
    isCategoryProductLoader.value = true;
    selectedDropdownValue.value.clear();
    cartBoolList.value.clear();
    counterList.value.clear();
    productId.value.clear();
    optionId.value.clear();
    optionValueId.value.clear();
    productData.value = {"product_info": []};
    update();
  }

  getDropdownValues() {
    for (int i = 0; i < (products.value.length); i++) {
      selectedDropdownValue.value.add("");
      optionId.value.add("");
      cartBoolList.add(false);
      counterList.add(1);
      productId.value.add("");
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
    products.value.clear();
    onPageChange.value = 1;
    categoriesIndex.value = index;
    isCategoryProductLoader.value = true;
    categoryId.value = (categoriesList.value[index].categoryId)!;
    getCategoryProduct(
        categoriesList.value[index].categoryId, onPageChange.value);
    title.value = (categoriesList.value[index].name)!;
    update();
  }

  dropDownChanged(String? value, int index) {
    selectedItemValue[index] = value!;
    update();
  }

  cartButton(int index, String functionality) {
    if (cartBoolList[index] == false) {
      cartCount.value += 1;
      cartBoolList[index] = cartBoolList[index] == false ? true : true;
      addToCart(index, "plus");
    } else if (functionality == "plus") {
      cartCount.value += 1;
      counterList[index] += 1;
      addToCart(index, "plus");
    } else {
      if (counterList[index] == 1) {
        cartCount.value -= 1;
        cartBoolList[index] = false;
        addToCart(index, "minus");
      } else {
        cartCount.value -= 1;
        counterList[index] -= 1;
        addToCart(index, "minus");
      }
      cartBoolList.refresh();
    }
    update();
  }

  addCartDatas(index) {
    if (products.value[index].option?.isNotEmpty ?? false) {
      productData.value["product_info"]?.add({
        "product_id": productId[index],
        "qty": 1,
        "product_option_id": optionId.value[index]!,
        "prodcut_option_value_id": optionValueId[index],
        "action": "ADD"
      });
    } else {
      productData.value["product_info"]
          ?.add({"product_id": productId[index], "qty": 1, "action": "ADD"});
    }
  }

  Future<int> hitAddCartAPI() async {
    print(productData.value);
    if ((productData.value["product_info"]?.length ?? 0) > 0) {
      var response = await ApiHelper.addCart(productData.value);
      print(response.responseCode);
      if (response.responseCode == 200) {
        print("response code true");
        return 0;
      } else {
        print("response code false");
        return 0;
      }
    } else {
      print("response code length");
      return 0;
    }
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
      if (products[index].option?.isNotEmpty ?? false) {
        optionId[index] = (products[index].option?[0].productOptionId)!;
        optionValueId[index] = (products[index]
            .option?[0]
            .productOptionValue?[0]
            .productOptionValueId)!;
      } else {}
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

  getCartCount() async {
    var response = await ApiHelper.cartCount();
    cartCount.value = int.parse(response["text_items"]);
    update();
  }
}
