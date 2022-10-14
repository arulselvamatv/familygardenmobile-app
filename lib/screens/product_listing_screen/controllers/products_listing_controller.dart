import 'package:family_garden/network/api_helper.dart';
import 'package:get/get.dart';
import '../../../models/categories_model.dart';
import '../../../models/category_product_model.dart';
import '../../../utils/common_import/common_import.dart';

class ProductListingController extends GetxController {
  RxInt categoriesIndex = 1.obs;
  late RxString selectedValue = itemsList.first.obs;
  RxString title = "".obs;
  RxString staticImage = "assets/images/Fresh Vegetables.png".obs;
  RxString categoryName = "Fresh Vegetables".obs;
  RxList selectedDropdownValue = [].obs;
  // RxList category = [
  //   {'name': 'Fresh Vegetables', 'image': 'assets/images/Fresh Vegetables.png'},
  //   {'name': 'Fresh Fruits', 'image': 'assets/images/Fresh Fruits.png'},
  //   {'name': 'Cuts & Sprouts', 'image': 'assets/images/Cuts & sprouts.png'},
  //   {
  //     'name': 'Organic Fruits & Vegs',
  //     'image': 'assets/images/Organic Vegetables & Fruits.png'
  //   },
  //   {'name': 'Top Selling', 'image': 'assets/images/topSelling.png'},
  // ].obs;
  //
  // RxList categoryList = [
  //   {
  //     'name': 'Carrot',
  //     'nameInTamil': 'கேரட்',
  //     'price': '₹28.00',
  //     'oldPrice': '₹35.00',
  //     'offer': '20% OFF',
  //     'image': 'assets/images/Carrot.png'
  //   },
  //   {
  //     'name': 'Cauliflower 1 Piece',
  //     'nameInTamil': 'காலிஃபிளவர் ',
  //     'price': '₹35.00',
  //     'oldPrice': '₹40.00',
  //     'offer': '13% OFF',
  //     'image': 'assets/images/cauliflower.png'
  //   },
  //   {
  //     'name': 'Ash gourd pumpkin',
  //     'nameInTamil': 'சாம்பல் பூசணி',
  //     'price': '₹30.00',
  //     'oldPrice': '₹50.00',
  //     'offer': '40% OFF',
  //     'image': 'assets/images/AshGroundPumpkin.png'
  //   },
  //   {
  //     'name': 'Avarakkai',
  //     'nameInTamil': 'அவரைக்காய்',
  //     'price': '₹14.00',
  //     'oldPrice': '₹20.00',
  //     'offer': '30% OFF',
  //     'image': 'assets/images/Avarakai.png'
  //   },
  //   {
  //     'name': 'Carrot',
  //     'nameInTamil': 'கேரட்',
  //     'price': '₹28.00',
  //     'oldPrice': '₹35.00',
  //     'offer': '50% OFF',
  //     'image': 'assets/images/Carrot.png',
  //   },
  // ].obs;

  RxList<String> itemsList = [
    '250 grams - ₹28.00',
    '1 Pack - ₹125.00',
    '1 Bunch - ₹15.00',
  ].obs;
  RxList<ProductOptionValue> dropdownList = <ProductOptionValue>[].obs;
  RxList selectedItemValue = [].obs;
  RxList counterList = [].obs;
  RxList<Category> categoriesList = <Category>[].obs;
  RxBool isCategoryLoader = true.obs;
  RxList cartBoolList = [].obs;
  RxList<Products> products = <Products>[].obs;
  RxBool isCategoryProductLoader = true.obs;

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

  getCategoryProduct(categoryId) async {
    selectedDropdownValue.value = [];
    var response = await ApiHelper.getProductCategory(categoryId);
    print(response.responseCode);
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
    isCategoryProductLoader.value = false;
    update();
  }

  void categoriesOnTap(int index) {
    categoriesIndex.value = index;
    isCategoryProductLoader.value = true;
    getCategoryProduct(categoriesList.value[index].categoryId);
    title.value = (categoriesList.value[index].name)!;
    // category.refresh();
    update();
  }

  dropDownChanged(String? value, int index) {
    selectedItemValue[index] = value!;
    update();
  }

  cartButton(int index) {
    cartBoolList[index] = cartBoolList[index] == false ? true : true;
    cartBoolList.refresh();
    update();
  }

  minus(int index) {
    if (counterList[index] == 1) {
      cartBoolList[index] = false;
      // return;
    } else {
      counterList[index] -= 1;
    }
    cartBoolList.refresh();
    update();
  }

  add(int index) {
    counterList[index] += 1;
    update();
  }
}
