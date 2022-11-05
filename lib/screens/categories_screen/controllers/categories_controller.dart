import '../../../models/categories_model.dart';
import '../../../network/api_helper.dart';
import '../../../utils/common_import/common_import.dart';

class CategoriesController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<Category> categoriesList = <Category>[].obs;
  RxBool isCategoryLoader = true.obs;
  RxString staticImage = "assets/images/Fresh Vegetables.png".obs;
  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  getCategory() async {
    var respone = await ApiHelper.getCategories();
    if (respone.isSuccessFul) {
      categoriesList.value = (respone.data?.categories)!;
      isCategoryLoader.value = false;
    }
    update();
  }
}
