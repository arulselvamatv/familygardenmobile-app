import 'package:carousel_slider/carousel_controller.dart';
import 'package:family_garden/models/home_features_model.dart';
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
  RxList category = [
    {'name': 'Fresh from Farm', 'image': 'assets/images/home_screen1.svg'},
    {'name': 'Fast Delivery', 'image': 'assets/images/singup_image.svg'},
    {'name': 'For Low Cost', 'image': 'assets/images/home_screen3.svg'},
    {
      'name': 'Mass Production of Vegetables',
      'image': 'assets/images/home_screen4.svg'
    },
    {'name': 'Premium Quality', 'image': 'assets/images/home_screen5.svg'},
  ].obs;

  RxList<Banners> carousel = <Banners>[].obs;
  RxList<Category> categoryList = <Category>[].obs;
  var homeFeaturesData = HomeFeaturesModel().obs;
  String staticImage = "assets/images/Fresh Vegetables.png";
  RxBool ishomeFeatureLoader = true.obs;
  var productData = {"product_info": []}.obs;

  @override
  void onInit() async {
    super.onInit();
    getToken();
  }

  getToken() async {
    var res = await GetLocalDatas.getToken();
    ApiConstants.jwtToken = res!;
    if (ApiConstants.jwtToken != "") {
      getHomeSliderDetails();
      getCategories();
      getHomeFeatures();
    }
  }

  clearHomeFeatureDatas() {
    homeFeaturesData.value.categories?.clear();
    productData.value = {"product_info": []};
  }

  getHomeFeatures() async {
    clearHomeFeatureDatas();
    var response = await ApiHelper.getHomeFeatures();
    print("Response : ${response.responseCode}");
    if (response.responseCode == 200) {
      homeFeaturesData.value = response.data!;
      ishomeFeatureLoader.value = false;
    }
    homeFeaturesData.refresh();
    update();
  }

  homeFeatureAddToCart(int index, int indexx) {
    homeFeaturesData.value.categories![index].products![indexx].count =
        (homeFeaturesData.value.categories![index].products![indexx].count)! +
            1;
    if (homeFeaturesData.value.categories?[index].products?[indexx].options?[0]
            .selectedDropdownValue ==
        "") {
      homeFeaturesData.value.categories?[index].products?[indexx].options?[0]
              .selectedDropdownValue =
          homeFeaturesData.value.categories?[index].products?[indexx]
              .options?[0].productOptionValue?[0].productOptionValueId;
    }
    addCartDatas(index, indexx);
    update();
    homeFeaturesData.refresh();
  }

  homeFeatureMinusBtn(int index, int indexx) {
    if (homeFeaturesData.value.categories![index].products![indexx].count ==
        0) {
    } else {
      homeFeaturesData.value.categories![index].products![indexx].count =
          (homeFeaturesData.value.categories![index].products![indexx].count)! -
              1;
    }
    removeCartDatas(index, indexx);
    homeFeaturesData.refresh();
  }

  homeFeatureAddBtn(int index, int indexx) {
    homeFeaturesData.value.categories![index].products![indexx].count =
        (homeFeaturesData.value.categories![index].products![indexx].count)! +
            1;
    AddToCart(index, indexx);
    homeFeaturesData.refresh();
  }

  AddToCart(index, indexx) {
    // vegBoolList.value[index] = true;
    if ((productData.value["product_info"]?.length)! > 0) {
      ExistingAddCartData(index, indexx);
    } else {
      addCartDatas(index, indexx);
    }
    update();
  }

  ExistingAddCartData(index, indexx) {
    print("Existing Data");
    print(productData.value["product_info"]?[0]["product_id"].runtimeType);
    print(productData.value["product_info"]?[0]["product_id"]);
    print(homeFeaturesData
        .value.categories?[index].products?[indexx].productId.runtimeType);
    print(
        homeFeaturesData.value.categories?[index].products?[indexx].productId);
    int? QuantityIncreasingIndex = productData.value["product_info"]
        ?.indexWhere((element) =>
            element["product_id"] ==
            homeFeaturesData
                .value.categories?[index].products?[indexx].productId);
    print("QuantityIncreasingIndex ${QuantityIncreasingIndex}");
    if (QuantityIncreasingIndex != -1) {
      productData.value["product_info"]?[QuantityIncreasingIndex!]["qty"] =
          productData.value["product_info"]?[QuantityIncreasingIndex]["qty"] +
              1;
      if (homeFeaturesData.value.categories?[index].products?[indexx]
              .options?[0].selectedDropdownValue !=
          productData.value["product_info"]?[QuantityIncreasingIndex!]
              ["prodcut_option_value_id"]) {
        productData.value["product_info"]?[QuantityIncreasingIndex!]
                ["prodcut_option_value_id"] =
            homeFeaturesData.value.categories?[index].products?[indexx]
                .options?[0].selectedDropdownValue;
      }
      print(productData);
    } else {
      addCartDatas(index, indexx);
    }
    update();
  }

  addCartDatas(index, indexx) {
    productData.value["product_info"]?.add({
      "product_id":
          homeFeaturesData.value.categories?[index].products?[indexx].productId,
      "qty": 1,
      "product_option_id": homeFeaturesData.value.categories?[index]
          .products?[indexx].options?[0].productOptionId,
      "prodcut_option_value_id": homeFeaturesData.value.categories?[index]
          .products?[indexx].options?[0].selectedDropdownValue,
      "action": "ADD"
    });
    update();
  }

  removeCartDatas(index, indexx) {
    if ((productData.value["product_info"]?.length)! > 0) {
      int? QuantityIncreasingIndex = productData.value["product_info"]
          ?.indexWhere((element) =>
              element["product_id"] ==
              homeFeaturesData
                  .value.categories?[index].products?[indexx].productId);
      if (QuantityIncreasingIndex != -1) {
        productData.value["product_info"]?[QuantityIncreasingIndex!]["qty"] =
            productData.value["product_info"]?[QuantityIncreasingIndex]["qty"] -
                1;
      }
    }
    update();
  }

  hitAddCartAPI() async {
    if ((productData.value["product_info"]?.length)! > 0) {
      var response = await ApiHelper.addCart(productData.value);
    } else {
      print("No Datas Found");
    }
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
}
