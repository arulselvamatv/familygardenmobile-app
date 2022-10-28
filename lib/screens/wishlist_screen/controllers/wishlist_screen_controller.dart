import 'package:carousel_slider/carousel_controller.dart';
import 'package:family_garden/models/wishlistmodel.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/loading_widget.dart';
import '../../../models/categories_model.dart';
import '../../../models/category_product_model.dart';
import '../../../models/product_detail_model.dart';

class WishListScreenController extends GetxController {
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
  final products = RxList<WishlistProducts>([]);
  RxBool isProductLoader = true.obs;
  var productData = {"product_info": []}.obs;

  @override
  void onInit() async {
    super.onInit();
    getWishlists();
  }

  Future<void> getWishlists() async {
    products.clear();
    var response = await ApiHelper.getWishList();
    print(response.data?.toString());
    if (response.responseCode == 200) {
      products.addAll(response.data!.products!);
    }
    isProductLoader.value = false;
    update();
  }

  Future<void> removeWishlist(String wishlistID) async {
    await ApiHelper.removeWishList(wishlistID);
    Get.showOverlay(
        asyncFunction: getWishlists, loadingWidget: const Loading());
    update();
  }
}
