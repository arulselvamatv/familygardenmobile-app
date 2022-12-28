import 'package:carousel_slider/carousel_controller.dart';
import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  RxBool isLoggedIn = false.obs;
  RxString price = "".obs;
  RxString offerPrice = "".obs;
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
  RxInt cartCount = 0.obs;

  @override
  void onInit() {
    productId.value = Get.arguments;
    getLocalDatas();
    getProductDetails(int.parse(productId.value));
    // getCartCount();
    super.onInit();
  }

  getLocalDatas() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("Login")) {
      String vals = prefs.getString("Login")!;
      if (vals == "true") {
        isLoggedIn.value = true;
      }
    }
    update();
  }

  getProductDetails(int productId) async {
    print("product ID ${productId}");
    var response = await ApiHelper.getProductCategoryDetails(productId);
    if (response.responseCode == 200) {
      print("LOG::::::${response.data!.logged}");

      // if (response.data!.logged == null || response.data!.logged == "null") {
      //   print("LOG::::::${response.data!.logged}");
      //   if (isLoggedIn.value == true) {
      //     showAppNotificationNotifierInitial.value = true;
      //   } else {
          productDetails = response.data;
          isImageEmpty.value = true;
          carousalImages.value = (productDetails?.images)!;
          productDetailLoader.value = false;
          price.value = (productDetails?.price)!;
          offerPrice.value = (productDetails?.special)!;
          favourite.value = (productDetails?.iswishlist)!;
        // }
      // } else {
      //   productDetails = response.data;
      //   isImageEmpty.value = true;
      //   carousalImages.value = (productDetails?.images)!;
      //   productDetailLoader.value = false;
      //   price.value = (productDetails?.price)!;
      //   offerPrice.value = (productDetails?.special)!;
      //   favourite.value = (productDetails?.iswishlist)!;
      // }
    }
    update();
  }

  onProductWeightSelected(int index) {
    optionId.value = (productDetails?.options?[0].productOptionId)!;
    optionValueId.value = (productDetails
        ?.options?[0].productOptionValue?[index].productOptionValueId)!;
    price.value =
        (productDetails?.options?[0].productOptionValue?[index].offer)!;
    offerPrice.value =
        (productDetails?.options?[0].productOptionValue?[index].price)!;
    addCartDatas();
    optionId.refresh();
    price.refresh();
    optionValueId.refresh();
    update();
  }

  onFavouriteButtonSelected() async{
    if (favourite.value == false) {
      if (productDetails?.options?.isNotEmpty ?? false) {
        favourite.value = true;
        optionId.value = (productDetails?.options?[0].productOptionId)!;
        optionValueId.value = (productDetails
            ?.options?[0].productOptionValue?[0].productOptionValueId)!;
        print(ApiConstants.jwtToken);
        print(optionId);
        print(optionValueId);
        ApiHelper.addWishList(
            productId.value, optionId.value, optionValueId.value);
      } else {
        // favourite.value = true;
        // ApiHelper.addWishList(productId.value, "", "");
      }
    }
    else {
      // favourite.value = false;
      optionId.value = (productDetails?.options?[0].productOptionId)!;
      optionValueId.value = (productDetails
          ?.options?[0].productOptionValue?[0].productOptionValueId)!;
      print(optionId);
      print(optionValueId);
      var res = await ApiHelper.removeWishList(productId.value,optionId.value,optionValueId.value);
      print(res.responseCode);
      if(res.responseCode == 200){
        print("Success");
        favourite.value = false;
      }
    }
    update();
  }

  getCartCount() async {
    var response = await ApiHelper.cartCount();
    cartCount.value = int.parse(response["text_items"]);
    cartCount.refresh();
    update();
  }

  clearAll() {
    getProductDetails(int.parse(productId.value));
    optionId.value = "";
    optionValueId.value = "";
    counter.value = 0;
    cartCount.value = 0;
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
    cartCount.value -= 1;
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
    cartCount.value += 1;
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
