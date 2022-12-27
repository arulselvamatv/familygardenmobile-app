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
    // if(onPageChange.value !=1){
    //   .value = false;
    //   update();
    // }
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
    cartCount.refresh();
    update();
  }

  void categoriesOnTap(int index) {
    products.value.clear();
    onPageChange.value = 1;
    categoriesIndex.value = index;
    isProductLoader.value = true;
    categoryId.value = (categoriesList.value[index].categoryId)!;
    getCategoryProduct(
        categoriesList.value[index].categoryId, onPageChange.value);
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

  cartBtn(int index, String functionality) {
    if (products[index].counter == 0) {
      if (products[index].option?.isNotEmpty ?? false) {
        productData.value["product_info"]?.add({
          "product_id": products.value[index].productId,
          "qty": 1,
          "product_option_id":
              products.value[index].selectedProductOptionId == ""
                  ? products.value[index].selectedProductOptionId
                  : products.value[index].selectedProductOptionId,
          "prodcut_option_value_id":
              products.value[index].selectedProductOptionValueId == ""
                  ? products.value[index].selectedProductOptionValueId
                  : products.value[index].selectedProductOptionValueId,
          "action": "ADD"
        });
      } else {
        productData.value["product_info"]?.add({
          "product_id": products.value[index].productId,
          "qty": 1,
          "action": "ADD"
        });
      }
      products.value[index].counter = products.value[index].counter! + 1;
    } else {
      print(functionality);
      if (functionality == "ADD") {
        products.value[index].counter = products.value[index].counter! + 1;
        if(products.value[index].option?.isNotEmpty ?? false){
          print("product data is not empty");
          if(products.value[index].selectedProductOptionId != ""){
            print("selected dropdown");
            var indexx = productData.value["product_info"]?.indexWhere((element) => element["product_id"] == products.value[index].productId);
            print(indexx);
          }else{
            // var indexx = productData.value["product_info"]?.indexWhere((element) => element["product_id"] == products.value[index].productId);
          }
        }else{
          print("Datea");
        }
      }else{
        products.value[index].counter = products.value[index].counter! - 1;
      }
    }
    products.refresh();
    update();
    print(productData.value);
  }
}
