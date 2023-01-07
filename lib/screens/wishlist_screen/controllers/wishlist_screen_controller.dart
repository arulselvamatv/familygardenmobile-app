import 'package:family_garden/models/wishlistmodel.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/loading_widget.dart';

class WishListScreenController extends GetxController {
  RxInt categoriesIndex = 1.obs;
  RxString categoryId = ''.obs;
  RxString title = "".obs;
  // RxString staticImage = "assets/images/fresh-fruits.svg".obs;
  RxString categoryName = "Fresh Vegetables".obs;
  RxList optionId = [].obs;
  RxList optionValueId = [].obs;
  RxList productId = [].obs;
  RxList counterList = [].obs;
  RxList cartBoolList = [].obs;
  final products = RxList<Products>([]);
  RxBool isProductLoader = true.obs;
  var productData = {"product_info": []}.obs;
  RxString cartCount = "".obs;

  @override
  void onInit() async {
    super.onInit();
    getCartCount();
    getWishlists();
  }

  Future<void> getWishlists() async {
    products.clear();
    var response = await ApiHelper.getWishList(false);
    print(response.data?.toString());
    if (response.responseCode == 200) {
      products.value = response.data!.products!;
      print("dfgfg ${products.value.length}" + "");
      // products.addAll(response.data!.products!);
    }
    isProductLoader.value = false;
    update();
  }

  getCartCount() async {
    print("Called here");
    var response = await ApiHelper.cartCount();
    cartCount.value = response["text_items"];
    cartCount.refresh();
    update();
  }

  Future<void> removeWishlist(
      String productId, String option, String optionValue) async {
    await ApiHelper.removeWishList(productId, option, optionValue,false);
    Get.showOverlay(
        asyncFunction: getWishlists, loadingWidget: const Loading());
    update();
  }
}
