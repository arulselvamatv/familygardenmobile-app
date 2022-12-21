import 'package:family_garden/utils/common_import/common_import.dart';
import '../../../models/categories_model.dart';
import '../../../models/category_product_model.dart';
import '../../../network/api_helper.dart';

class ProductListController extends GetxController{
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
          getCategoryProduct(categoryId.value, onPageChange.value, fg: true);
        }
      }
    });
    getCategory();
    getCartCount();
  }

  getCategoryProduct(categoryId, page, {bool? fg = false}) async {
    // if (onPageChange.value == 1) {
    //   isCategoryProductLoader.value = true;
    // }else{
    //   bottomLoader.value = false;
    //   bottomLoader.refresh();
    // }
    // if (fg == false) {
    //   clearAll();
    // }
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
}