import 'package:carousel_slider/carousel_controller.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import '../../../models/product_detail_model.dart';

class ProductDetailsController extends GetxController {
  final CarouselController carouselController = CarouselController();

  RxInt selecteIndex = 10.obs;
  RxInt counter = 1.obs;
  RxBool favourite = false.obs;
  RxString productId = "".obs;
  RxBool addToCart = false.obs;
  ProductDetailsModel? productDetails;
  RxBool productDetailLoader = true.obs;
  RxList carouselImage = [
    'assets/images/Carrot 1.png',
    'assets/images/Carrot 1.png',
    'assets/images/Carrot 1.png',
  ].obs;
  RxList<CarousalImage> carousalImages = <CarousalImage>[].obs;

  RxList productWeight = [
    '250 grams',
    '500 grams',
    '1 KG',
  ].obs;

  @override
  void onInit() {
    productId.value = Get.arguments;
    getProductDetails(int.parse(productId.value));
    super.onInit();
  }

  getProductDetails(int productId) async {
    var response = await ApiHelper.getProductCategoryDetails(productId);
    if (response.responseCode == 200) {
      productDetails = response.data;
      carousalImages.value = (productDetails?.images)!;
      print(productDetails!.iswishlist);
      productDetailLoader.value = false;
    }
    update();
  }

  onProductWeightSelected(int index) {
    productWeight.refresh();
    selecteIndex.refresh();
    update();
  }

  onFavouriteButtonSelected() {
    if (favourite.value == false) {
      favourite.value = true;
    } else {
      favourite.value = false;
    }
    onAddWishList();
    update();

  }

  onAddWishList() async {
    var response = await ApiHelper.addWishList(productId);
    if (response.responseCode == 200) {
      productDetailLoader.value = false;
      getProductDetails(int.parse(productId.value));
    }
  }

  onAddToCartSelected() {
    if (addToCart.value == false) {
      addToCart.value = true;
    }
  }

  minus() {
    if (counter.value == 1) {
      addToCart.value = false;
    } else {
      counter.value -= 1;
    }
  }

  add() {
    counter.value += 1;
  }
}
