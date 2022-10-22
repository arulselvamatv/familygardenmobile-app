import 'package:carousel_slider/carousel_controller.dart';
import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_constants/api_end_points.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/network/get_local_datas.dart';
import '../../../models/categories_model.dart';
import '../../../models/home_feature_model.dart';
import '../../../models/home_slider_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';

class HomeScreenController extends GetxController with RouteAware {
  TextEditingController search = TextEditingController();
  final CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;
  RxBool iscarouselLoader = true.obs;
  RxBool isCategoryLoader = true.obs;
  RxBool isVegetableLoader = false.obs;
  RxBool isFruitLoader = false.obs;
  RxList vegOptionId = [].obs;
  RxList fruitOptionId = [].obs;
  RxList fruitOptionValueId = [].obs;
  RxList vegOptionValueId = [].obs;
  RxList vegProductId = [].obs;
  RxList fruitProductId = [].obs;
  RxList vegBoolList = [].obs;
  RxList fruitBoolList = [].obs;
  RxList vegCounterList = [].obs;
  RxList fruitCounterList = [].obs;

  RxList category = [
    {'name': 'Fresh from Forms', 'image': 'assets/images/home_screen-1.png'},
    {'name': 'Fast Delivery', 'image': 'assets/images/home_screen-2.png'},
    {'name': 'For Low Cost', 'image': 'assets/images/home_screen-3.png'},
    {
      'name': 'Mass Production of Vegetables',
      'image': 'assets/images/home_screen-4.png'
    },
    {'name': 'Premium Quality', 'image': 'assets/images/home_screen-5.png'},
  ].obs;

  RxList<Banners> carousel = <Banners>[].obs;
  RxList<Category> categoryList = <Category>[].obs;
  CategoriesModel? sf;
  RxList<Vegetables> vegetableList = <Vegetables>[].obs;
  RxList<Fruits> fruitsList = <Fruits>[].obs;
  RxList selectedVegDropdownValue = [].obs;
  RxList selectedFruitDropdownValue = [].obs;
  String staticImage = "assets/images/Fresh Vegetables.png";
  RxList vegetablePercentage = [].obs;
  RxList fruitPercentage = [].obs;
  RxList selectedItemValue = [].obs;

  RxBool loader = false.obs;
  var productData = {"product_info": []}.obs;
  var vegProductData = {"product_info": []}.obs;

  @override
  void onInit() async {
    super.onInit();
    // getHomeSliderDetails();
    // getCategories();
    // getHomeFeature();
    getToken();
  }

  @override
  void didPop() {
    super.didPop();
    debugPrint("viewWillAppear");
  }

  clearAll() {
    selectedVegDropdownValue.value.clear();
    selectedFruitDropdownValue.value.clear();
    vegOptionId.value.clear();
    vegOptionValueId.value.clear();
    fruitOptionId.value.clear();
    vegCounterList.value.clear();
    fruitCounterList.value.clear();
    fruitPercentage.value.clear();
    vegBoolList.value.clear();
    fruitBoolList.value.clear();
    productData.value = {"product_info": []};
    vegProductData.value = {"product_info": []};
  }

  getToken() async {
    var res = await GetLocalDatas.getToken();
    ApiConstants.jwtToken = res!;
    if (ApiConstants.jwtToken != "") {
      getHomeSliderDetails();
      getCategories();
      getHomeFeature();
    }
  }

  getHomeFeature() async {
    clearAll();
    var response = await ApiHelper.homeFeature();
    if (response.responseCode == 200) {
      vegetableList.value = (response.data?.vegetables)!;
      fruitsList.value = (response.data?.fruits)!;
      getDropdownValues();
    }
    update();
  }

  getDropdownValues() {
    for (var i = 0; i < vegetableList.value.length; i++) {
      selectedVegDropdownValue.add("");
    }
    for (var i = 0; i < vegetableList.value.length; i++) {
      selectedFruitDropdownValue.add("");
    }
    for (var i = 0; i < vegetableList.value.length; i++) {
      vegOptionId.value.add("");
    }
    for (var i = 0; i < vegetableList.value.length; i++) {
      vegOptionValueId.add("");
    }

    for (var i = 0; i < fruitsList.value.length; i++) {
      fruitOptionId.value.add("");
    }
    for (var i = 0; i < fruitsList.value.length; i++) {
      fruitOptionValueId.add("");
    }
    for (var i = 0; i < vegetableList.value.length; i++) {
      vegProductId.value.add("");
    }
    for (var i = 0; i < fruitsList.value.length; i++) {
      fruitProductId.add("");
    }
    for (var i = 0; i < vegetableList.value.length; i++) {
      vegCounterList.add(1);
    }
    for (var i = 0; i < fruitsList.value.length; i++) {
      fruitCounterList.value.add(1);
    }
    for (var i = 0; i < vegetableList.value.length; i++) {
      double price = double.parse(vegetableList[i].price!);
      double offerprice = double.parse(vegetableList[i].offerPrice!);
      vegetablePercentage.add(100 - ((offerprice / price) * 100).toInt());
    }
    for (var i = 0; i < vegetableList.value.length; i++) {
      vegBoolList.add(false);
    }
    for (var i = 0; i < fruitsList.value.length; i++) {
      fruitBoolList.add(false);
    }
    for (var i = 0; i < fruitsList.value.length; i++) {
      double price = double.parse(fruitsList[i].price!);
      double offerprice = double.parse(fruitsList[i].offerPrice!);
      fruitPercentage.add(100 - ((offerprice / price) * 100).toInt());
    }
    isVegetableLoader.value = true;
    isFruitLoader.value = true;
  }

  vegAddToCart(index) {
    vegBoolList.value[index] = true;
    if ((productData.value["product_info"]?.length)! > 0) {
      vegExistingAddCartData(index);
    } else {
      vegNewAddCart(index);
    }
    update();
  }

  vegAddCartDatas(index) {
    vegProductData.value["product_info"]?.add({
      "product_id": vegProductId[index],
      "qty": 1,
      "product_option_id": vegOptionId[index]!,
      "prodcut_option_value_id": vegOptionValueId[index],
      "action": "ADD"
    });
    update();
  }

  vegExistingAddCartData(index) {
    int? QuantityIncreasingIndex = vegProductData.value["product_info"]
        ?.indexWhere((element) =>
            element["product_id"] == vegetableList.value[index].productId!);
    if (QuantityIncreasingIndex != -1) {
      vegProductData.value["product_info"]?[QuantityIncreasingIndex!]["qty"] =
          vegProductData.value["product_info"]?[QuantityIncreasingIndex]
                  ["qty"] +
              1;
      if (vegOptionId.value[index] !=
          vegProductData.value["product_info"]?[QuantityIncreasingIndex!]
              ["product_option_id"]) ;
      {
        vegProductData.value["product_info"]?[QuantityIncreasingIndex!]
            ["product_option_id"] = vegOptionId.value[index];
        vegProductData.value["product_info"]?[QuantityIncreasingIndex!]
            ["prodcut_option_value_id"] = vegOptionValueId.value[index];
      }
    } else {
      vegAddCartDatas(index);
    }
    update();
  }

  vegNewAddCart(index) {
    if (vegOptionId.value[index] == "") {
      vegProductId[index] = vegetableList.value[index].productId!;
      vegOptionId[index] =
          (vegetableList.value[index].options?[0].productOptionId)!;
      vegOptionValueId[index] = (vegetableList.value[index].options?[0]
          .productOptionValue?[0].productOptionValueId)!;
      vegAddCartDatas(index);
    } else {
      vegProductId[index] = vegetableList.value[index].productId!;
      vegAddCartDatas(index);
    }
    update();
  }

  vegRemove(index) {
    if (vegOptionId.value[index] == "") {
      vegProductId[index] = vegetableList.value[index].productId!;
      vegOptionId[index] =
          (vegetableList.value[index].options?[0].productOptionId)!;
      vegOptionValueId[index] = (vegetableList.value[index].options?[0]
          .productOptionValue?[0].productOptionValueId)!;
    } else {
      vegOptionId[index] = vegetableList.value[index].productId!;
    }
    removeVegCartDatas(index);
    update();
  }

  removeVegCartDatas(index) {
    if ((vegProductData.value["product_info"]?.length)! > 0) {
      int? QuantityIncreasingIndex = vegProductData.value["product_info"]
          ?.indexWhere((element) =>
              element["product_id"] == vegetableList.value[index].productId!);
      if (QuantityIncreasingIndex != -1) {
        vegProductData.value["product_info"]?[QuantityIncreasingIndex!]["qty"] =
            vegProductData.value["product_info"]?[QuantityIncreasingIndex]
                    ["qty"] -
                1;
      }
    }
    update();
  }

  vegMinusBtn(index) {
    print("object");
    if (vegCounterList.value[index] == 1) {
      vegBoolList.value[index] = false;
      vegRemove(index);
    } else {
      vegCounterList.value[index] -= 1;
      vegRemove(index);
    }
    update();
  }

  vegAddBtn(index) {
    print("object");
    vegCounterList.value[index] += 1;
    vegAddToCart(index);
    update();
  }

  vegHitAddCartAPI() async {
    print("vegProductData $vegProductData}");
    if ((vegProductData.value["product_info"]?.length)! > 0) {
      var response = await ApiHelper.addCart(vegProductData.value);
      // Get.toNamed(Routes.CART_SCREEN)?.then((value) => clearDatas());
    } else {
      print("No Datas Found");
    }
  }

  fruitAddToCart(index) {
    fruitBoolList.value[index] = true;
    if ((productData.value["product_info"]?.length)! > 0) {
      fruitExistingAddCartData(index);
    } else {
      fruitNewAddCart(index);
    }
    update();
  }

  fruitAddCartDatas(index) {
    productData.value["product_info"]?.add({
      "product_id": fruitProductId[index],
      "qty": 1,
      "product_option_id": fruitOptionId[index]!,
      "prodcut_option_value_id": fruitOptionValueId[index],
      "action": "ADD"
    });
  }

  fruitExistingAddCartData(index) {
    int? QuantityIncreasingIndex = productData.value["product_info"]
        ?.indexWhere((element) =>
            element["product_id"] == fruitsList.value[index].productId!);
    if (QuantityIncreasingIndex != -1) {
      productData.value["product_info"]?[QuantityIncreasingIndex!]["qty"] =
          productData.value["product_info"]?[QuantityIncreasingIndex]["qty"] +
              1;
      if (fruitOptionId.value[index] !=
          productData.value["product_info"]?[QuantityIncreasingIndex!]
              ["product_option_id"]) ;
      {
        productData.value["product_info"]?[QuantityIncreasingIndex!]
            ["product_option_id"] = fruitOptionId.value[index];
        productData.value["product_info"]?[QuantityIncreasingIndex!]
            ["prodcut_option_value_id"] = fruitOptionValueId.value[index];
      }
    } else {
      fruitAddCartDatas(index);
    }
  }

  fruitNewAddCart(index) {
    if (fruitOptionId.value[index] == "") {
      fruitProductId[index] = fruitsList.value[index].productId!;
      fruitOptionId[index] =
          (fruitsList.value[index].options?[0].productOptionId)!;
      fruitOptionValueId[index] = (fruitsList.value[index].options?[0]
          .productOptionValue?[0].productOptionValueId)!;
      fruitAddCartDatas(index);
    } else {
      fruitProductId[index] = fruitsList.value[index].productId!;
      fruitAddCartDatas(index);
    }
  }

  fruitRemove(index) {
    if (fruitOptionId.value[index] == "") {
      fruitProductId[index] = fruitsList.value[index].productId!;
      fruitOptionId[index] =
          (fruitsList.value[index].options?[0].productOptionId)!;
      fruitOptionValueId[index] = (fruitsList[index]
          .options?[0]
          .productOptionValue?[0]
          .productOptionValueId)!;
    } else {
      fruitOptionId[index] = vegetableList.value[index].productId!;
    }
    removeFruitCartDatas(index);
  }

  removeFruitCartDatas(index) {
    if ((productData.value["product_info"]?.length)! > 0) {
      int? QuantityIncreasingIndex = productData.value["product_info"]
          ?.indexWhere((element) =>
              element["product_id"] == fruitsList.value[index].productId!);
      if (QuantityIncreasingIndex != -1) {
        productData.value["product_info"]?[QuantityIncreasingIndex!]["qty"] =
            productData.value["product_info"]?[QuantityIncreasingIndex]["qty"] -
                1;
      }
    }
  }

  fruitMinusBtn(index) {
    print("object");
    if (fruitCounterList.value[index] == 1) {
      fruitBoolList.value[index] = false;
      fruitRemove(index);
    } else {
      fruitCounterList.value[index] -= 1;
      fruitRemove(index);
    }
    update();
  }

  fruitAddBtn(index) {
    print("object");
    fruitCounterList.value[index] += 1;
    fruitAddToCart(index);
    update();
  }

  vegaddCartDatas(index) {
    productData.value["product_info"]?.add({
      "product_id": vegProductId[index],
      "qty": 1,
      "product_option_id": vegetableList[index].productId!,
      "prodcut_option_value_id": vegOptionValueId[index],
      "action": "ADD"
    });
  }

  fruitaddCartDatas(index) {
    productData.value["product_info"]?.add({
      "product_id": fruitProductId[index],
      "qty": 1,
      "product_option_id": fruitsList[index].productId!,
      "prodcut_option_value_id": fruitOptionValueId[index],
      "action": "ADD"
    });
  }

  fruitsHitAddCartAPI() async {
    print(EndPoints.apiToken);
    if ((productData.value["product_info"]?.length)! > 0) {
      var response = await ApiHelper.addCart(productData.value);
      // Get.toNamed(Routes.CART_SCREEN)?.then((value) => clearDatas());
    } else {
      print("No Datas Found");
    }
  }

  clearDatas() {
    productData.value["product_info"]?.clear();
  }

  getCategories() async {
    var response = await ApiHelper.getCategories();
    if (response.isSuccessFul) {
      categoryList.value = (response.data?.categories)!;
      isCategoryLoader.value = false;
      update();
    }
  }

  getHomeSliderDetails() async {
    var response = await ApiHelper.getHomeSliderDetails();
    if (response.isSuccessFul) {
      carousel.value = (response.data?.modules?[0].banners)!;
      if (carousel.value.length != 0) {
        iscarouselLoader.value = false;
      }
      update();
    } else {}
  }

  pageChanged(int index) {
    currentIndex.value = index;
    update();
  }

  dropDownChanged(String? value, int index) {
    selectedItemValue[index] = value!;
    update();
  }
}
