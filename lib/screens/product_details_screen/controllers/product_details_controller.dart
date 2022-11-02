import 'package:carousel_slider/carousel_controller.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import '../../../models/product_detail_model.dart';

class ProductDetailsController extends GetxController {
  final CarouselController carouselController = CarouselController();

  RxInt selecteIndex = 0.obs;
  RxInt counter = 0.obs;
  RxBool favourite = false.obs;
  RxString productId = "".obs;
  RxString optionId = "".obs;
  RxString optionValueId = "".obs;
  RxBool addToCart = false.obs;
  ProductDetailsModel? productDetails;
  RxBool isImageEmpty = false.obs;
  RxBool productDetailLoader = true.obs;
  RxList carouselImage = [
    'assets/images/Carrot 1.png',
    'assets/images/Carrot 1.png',
    'assets/images/Carrot 1.png',
  ].obs;
  RxList<CarousalImage> carousalImages = <CarousalImage>[].obs;
  var data = {}.obs;

  RxList productWeight = [
    '250 grams',
    '500 grams',
    '1 KG',
  ].obs;
  RxString staticImage = "assets/images/Fresh Vegetables.png".obs;
  var productData = {"product_info": []}.obs;

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
      isImageEmpty.value = true;
      carousalImages.value = (productDetails?.images)!;
      productDetailLoader.value = false;
      favourite.value = (productDetails?.iswishlist)!;
    }
    update();
  }

  onProductWeightSelected(int index) {
    optionId.value = (productDetails?.options?[0].productOptionId)!;
    optionValueId.value = (productDetails
        ?.options?[0].productOptionValue?[index].productOptionValueId)!;
    addCartDatas();
    optionId.refresh();
    optionValueId.refresh();
    update();
  }

  onFavouriteButtonSelected() {
    if (favourite.value == false) {
      favourite.value = true;
      print("productId.value ${productId.value}");

      ApiHelper.addWishList(productId.value);
    } else {
      favourite.value = false;
      print("productId.value ${productId.value}");

      ApiHelper.removeWishList(productId.value);
    }
    update();
  }

  clearAll() {
    getProductDetails(int.parse(productId.value));
    optionId.value = "";
    optionValueId.value = "";
    counter.value = 0;
    data.value = {};
    update();
  }

  hitAddCartAPI() async {
    if ((data.value.isNotEmpty)) {
      var response = await ApiHelper.addCart(data.value);
    } else {
      print("No Datas Found");
    }
  }

  minus() {
    counter.value -= 1;
    removeCartDatas();
    if ((productDetails?.options?.isNotEmpty)!) {
      if (optionId.value != "") {
        removeCartDatas();
      } else {
        optionId.value = (productDetails?.options?[0].productOptionId)!;
        optionValueId.value = (productDetails
            ?.options?[0].productOptionValue?[0].productOptionValueId)!;
        removeCartDatas();
      }
    } else {
      removeCartDatas();
    }
    counter.refresh();
    update();
  }

  add() {
    counter.value += 1;
    if (productDetails?.options?.isNotEmpty ?? false) {
      if (optionId.value != "") {
        addCartDatas();
        update();
      } else {
        optionId.value = (productDetails?.options?[0].productOptionId)!;
        optionValueId.value = (productDetails
            ?.options?[0].productOptionValue?[0].productOptionValueId)!;
        update();
        addCartDatas();
      }
    } else {
      addCartDatas();
    }
    counter.refresh();
    update();
  }

  addCartDatas() {
    if ((productDetails?.options?.isNotEmpty)!) {
      data.value = {
        "product_info": [
          {
            "product_id": productId.value,
            "qty": counter.value,
            "product_option_id": optionId.value,
            "prodcut_option_value_id": optionValueId.value,
            "action": "ADD"
          }
        ]
      };
    } else {
      data.value = {
        "product_info": [
          {"product_id": productId.value, "qty": counter.value, "action": "ADD"}
        ]
      };
    }
    update();
  }

  removeCartDatas() {
    if ((productDetails?.options?.isNotEmpty)!) {
      data.value["product_info"]?[0]["qty"] = counter.value;
    }
    update();
    data.refresh();
  }
}
