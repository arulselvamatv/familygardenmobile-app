import 'package:family_garden/utils/common_import/common_import.dart';
import '../../../models/categories_model.dart';
import '../../../models/category_product_model.dart';
import '../../../network/api_helper.dart';

class ProductListController extends GetxController {
  RxInt categoriesIndex = 1.obs;
  RxString categoryId = ''.obs;
  RxString title = "".obs;
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  RxInt onPageChange = 1.obs;
  RxString staticImage = "assets/images/Fresh Vegetables.png".obs;
  RxInt totalPages = 1.obs;
  var productData = {"product_info": []}.obs;
  RxList<Products> products = <Products>[].obs;
  RxList<ProductOptionValue> dropdownList = <ProductOptionValue>[].obs;
  RxList<Category> categoriesList = <Category>[].obs;
  RxInt cartCount = 0.obs;
  RxBool isCategoryLoader = true.obs;
  RxBool isProductLoader = true.obs;
  RxBool isBottomLoader = false.obs;

  @override
  void onInit() async {
    super.onInit();
    categoriesIndex.value = Get.arguments[0];
    categoryId.value = Get.arguments[1];
    scrollController.addListener(() {
      print(scrollController.position.pixels);
      // scrolledPosition.value = scrollController.position.pixels;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (onPageChange.value <= totalPages.value) {
          isBottomLoader.value = true;
          getCategoryProduct(categoryId.value, onPageChange.value, fg: true);
        }
      }
    });
    getCategory();
    getCartCount();
  }

  getCategoryProduct(categoryId, page, {bool? fg = false}) async {
    print("sdfsdfsff $page");
    var response = await ApiHelper.getProductCategory(categoryId, page);
    if (response.responseCode == 200) {
      if (onPageChange.value == 1) {
        products.value = (response.data?.products)!;
        totalPages.value = (response.data?.pagination?.numPages)!;
        onPageChange.value++;
      } else {
        print("Here");
        totalPages.value = (response.data?.pagination?.numPages)!;
        onPageChange.value++;
        products.value.addAll((response.data?.products)!);
        products.refresh();
      }
      isProductLoader.value = false;
      isBottomLoader.value = false;
    }
    update();
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

  getCartCount() async {
    var response = await ApiHelper.cartCount();
    cartCount.value = int.parse(response["text_items"]);
    refresh();
    // update();
  }

  void categoriesOnTap(int index) async{
    products.value.clear();
    onPageChange.value = 1;
    categoriesIndex.value = index;
    isProductLoader.value = true;
    categoryId.value = (categoriesList.value[index].categoryId)!;
    int isSuccess = await hitAddCartAPI();
    if(isSuccess == 0){
      productData.value = {"product_info": []};
      getCategoryProduct(
          categoriesList.value[index].categoryId, onPageChange.value);
    }else{
      getCategoryProduct(
          categoriesList.value[index].categoryId, onPageChange.value);
    }
    title.value = (categoriesList.value[index].name)!;
    update();
  }

  dropdownChanged(int index, value) {
    products.value[index].selectedProductOptionValueId = value as String;
    products.value[index].selectedProductOptionId =
        products[index].option?[0].productOptionId;
    products.refresh();
    update();
  }

  addCart(index) {
    if (products[index].option?.isNotEmpty ?? false) {
      productData.value["product_info"]?.add({
        "product_id": products.value[index].productId,
        "qty": 1,
        "product_option_id": products.value[index].selectedProductOptionId != ""
            ? products.value[index].selectedProductOptionId
            : products.value[index].option?[0].productOptionId,
        "prodcut_option_value_id":
            products.value[index].selectedProductOptionValueId != ""
                ? products.value[index].selectedProductOptionValueId
                : products.value[index].option?[0].productOptionValue?[0].productOptionValueId,
        "action": "ADD"
      });
    } else {
      productData.value["product_info"]?.add({
        "product_id": products.value[index].productId,
        "qty": 1,
        "action": "ADD"
      });
    }
  }

  minusCart(index) {
    if (products[index].option?.isNotEmpty ?? false) {
      productData.value["product_info"]?.add({
        "product_id": products.value[index].productId,
        "qty": 1,
        "product_option_id": products.value[index].selectedProductOptionId != ""
            ? products.value[index].selectedProductOptionId
            : products.value[index].option?[0].productOptionId,
        "prodcut_option_value_id":
            products.value[index].selectedProductOptionValueId != ""
                ? products.value[index].selectedProductOptionValueId
                : products.value[index].option?[0].productOptionValue?[0].productOptionValueId,
        "action": "MINUS"
      });
    } else {
      productData.value["product_info"]?.add({
        "product_id": products.value[index].productId,
        "qty": 1,
        "action": "MINUS"
      });
    }
  }

  addCartBtn(int index, String purpose){
    print(purpose);
    if(purpose == "ADD"){
      addData(index);
      products[index].counter = products[index].counter! + 1;
    }else{
      removeData(index);
      products[index].counter = products[index].counter! - 1;
      if(products[index].counter == 0){
        cartCount.value = cartCount.value  - 1;
      }
    }
    products.refresh();
    update();
    print(productData);
  }

  Future<int> hitAddCartAPI() async {
    if ((productData.value["product_info"]?.length)! > 0) {
      var response = await ApiHelper.addCart(productData.value);
      if (response.isSuccessFul) {
        print("Is successful");
        return 0;
        // getCartListDatas();
      } else {
        print("Is Failure");
        return 0;
      }
    } else {
      print("Is Failure");
      return 0;
    }
  }

  addData(index){
    int? indexx;
    for (var i = 0; i < (productData.value["product_info"]?.length)!; i++) {
      if (productData.value["product_info"]?[i]["product_id"] ==
          products.value[index].productId! &&
          productData.value["product_info"]?[i]["action"] == "ADD") {
        indexx = i;
      }
    }
    if(indexx!=null){
      productData.value["product_info"]?[indexx]["qty"] = productData.value["product_info"]?[indexx]["qty"] + 1;
      if(products.value[index].selectedProductOptionValueId != ""){
        productData.value["product_info"]?[indexx]["product_option_id"] = products.value[index].selectedProductOptionId;
        productData.value["product_info"]?[indexx]["prodcut_option_value_id"] = products.value[index].selectedProductOptionValueId;
      }
    } else{
      cartCount.value = cartCount.value +1;
      addCart(index);
    }
  }

  removeData(index){
    int? indexx;
    for (var i = 0; i < (productData.value["product_info"]?.length)!; i++) {
      if (productData.value["product_info"]?[i]["product_id"] ==
          products.value[index].productId! &&
          productData.value["product_info"]?[i]["action"] == "MINUS") {
        indexx = i;
      }
    }
    if(indexx!=null){
      productData.value["product_info"]?[indexx]["qty"] = productData.value["product_info"]?[indexx]["qty"] + 1;
      if(products.value[index].selectedProductOptionValueId != ""){
        productData.value["product_info"]?[indexx]["product_option_id"] = products.value[index].selectedProductOptionId;
        productData.value["product_info"]?[indexx]["prodcut_option_value_id"] = products.value[index].selectedProductOptionValueId;
      }
    }else{
      minusCart(index);
    }
  }

  // cartBtn(int index, String functionality) {
  //   print(functionality);
  //   if (products[index].counter == 0) {
  //     addCart(index);
  //     products.value[index].counter = products.value[index].counter! + 1;
  //   } else {
  //     // int? addIndex;
  //     print(functionality);
  //     if (functionality == "ADD") {
  //       for (var i = 0; i < productData.value["product_info"]!.length; i++) {
  //         if (productData.value["product_info"]![i]["action"] == "ADD") {
  //           if (productData.value["product_info"]![i]["product_id"] ==
  //               products.value[index].productId) {
  //             productData.value["product_info"]![i]["qty"] =
  //                 productData.value["product_info"]![i]["qty"] + 1;
  //             if (products[index].option?.isNotEmpty ?? false) {
  //               productData.value["product_info"]![i]["product_option_id"] =
  //                   products.value[index].selectedProductOptionId == ""
  //                       ? products.value[index].selectedProductOptionId
  //                       : products.value[index].selectedProductOptionId;
  //               productData.value["product_info"]![i]
  //                       ["prodcut_option_value_id"] =
  //                   products.value[index].selectedProductOptionValueId == ""
  //                       ? products.value[index].selectedProductOptionValueId
  //                       : products.value[index].selectedProductOptionValueId;
  //             } else {}
  //           }
  //         }
  //       }
  //       products.value[index].counter = products.value[index].counter! + 1;
  //     } else {
  //       bool isNoDataMatch = false;
  //       for (var i = 0; i < productData.value["product_info"]!.length; i++) {
  //         if (productData.value["product_info"]![i]["action"] == "MINUS") {
  //         }else{
  //           isNoDataMatch = true;
  //         }
  //       }
  //       if(isNoDataMatch == true){
  //         minusCart(index);
  //       }
  //       products.value[index].counter = products.value[index].counter! - 1;
  //     }
  //   }
  //   products.refresh();
  //   update();
  //   print(productData.value);
  // }
}
