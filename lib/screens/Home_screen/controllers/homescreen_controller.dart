import 'package:carousel_slider/carousel_controller.dart';
import 'package:family_garden/models/home_features_model.dart';
import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_constants/api_end_points.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/network/get_local_datas.dart';
import 'package:family_garden/screens/dashboard/controllers/dashboard_controller.dart';
import '../../../models/categories_model.dart';
import '../../../models/home_feature_model.dart';
import '../../../models/home_slider_model.dart';
import '../../../models/informationDetailsModel.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';
import '../../offers_screen/controller/offers_controller.dart';

class HomeScreenController extends GetxController with RouteAware {
  TextEditingController search = TextEditingController();
  final CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;
  RxBool iscarouselLoader = true.obs;
  RxBool isCategoryLoader = true.obs;
  RxList category = [
    {'name': 'Fresh from Farm', 'image': 'assets/images/Fresh From Farms.png'},
    {'name': 'Fast Delivery', 'image': 'assets/images/Fast Delivery.png'},
    {'name': 'Low pricing', 'image': 'assets/images/For Low Cost.png'},
    {'name': 'Safe delivery', 'image': 'assets/images/Mass Production.png'},
    {'name': 'Premium Quality', 'image': 'assets/images/Premium Quality.png'},
  ].obs;

  RxList<Banners> carousel = <Banners>[].obs;
  RxList<Category> categoryList = <Category>[].obs;
  var homeFeaturesData = HomeFeaturesModel().obs;
  String staticImage = "assets/images/Fresh Vegetables.png";
  RxBool ishomeFeatureLoader = true.obs;
  var productData = {"product_info": []}.obs;
  var informationData = informationDetailsModel().obs;
  RxBool informationLoader = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getToken();
  }

  getToken() async {
    var res = await GetLocalDatas.getToken();
    ApiConstants.jwtToken = res!;
    if (ApiConstants.jwtToken != "") {
      informationDetails();
      getHomeSliderDetails();
      getCategories();
      getHomeFeatures();
    }
  }

  informationDetails() async {
    var response = await ApiHelper.informationDetails();
    informationData.value = response.data!;
    informationLoader.value = true;
  }

  clearHomeFeatureDatas() {
    homeFeaturesData.value.categories?.clear();
    productData.value = {"product_info": []};
  }

  getHomeFeatures() async {
    print(ApiConstants.jwtToken);
    clearHomeFeatureDatas();
    var response = await ApiHelper.getHomeFeatures();
    if (response.responseCode == 200) {
      homeFeaturesData.value = response.data!;
      getPercentage();
      ishomeFeatureLoader.value = false;
    }
    homeFeaturesData.refresh();
    update();
  }

  getPercentage() {
    for (var i = 0; i < (homeFeaturesData.value.categories?.length)!; i++) {
      for (var j = 0;
          j < (homeFeaturesData.value.categories?[i].products?.length)!;
          j++) {
        var offerPrice = double.parse((homeFeaturesData
            .value.categories?[i].products?[j].offerPrice
            ?.substring(1))!);
        var removeComma = homeFeaturesData
            .value.categories?[i].products?[j].price
            ?.replaceAll(',', '');
        var actualPrice = double.parse(removeComma!.substring(1));
        var percentage = ((actualPrice - offerPrice) / actualPrice) * 100;
        homeFeaturesData.value.categories?[i].products?[j].percentage =
            percentage.round();
      }
    }
    homeFeaturesData.refresh();
    update();
  }

  homeFeatureAddToCart(int index, int indexx) {
    var count = Get.find<DashboardController>().cartCount.value + 1;
    Get.find<DashboardController>().cartCount.value = count;
    homeFeaturesData.value.categories![index].products![indexx].count =
        (homeFeaturesData.value.categories![index].products![indexx].count)! +
            1;
    if (homeFeaturesData
            .value.categories?[index].products?[indexx].options?.isNotEmpty ??
        false) {
      if (homeFeaturesData.value.categories?[index].products?[indexx]
              .options?[0].selectedDropdownValue ==
          "") {
        homeFeaturesData.value.categories?[index].products?[indexx].options?[0]
                .selectedDropdownValue =
            homeFeaturesData.value.categories?[index].products?[indexx]
                .options?[0].productOptionValue?[0].productOptionValueId;
      }
    }

    addCartDatas(index, indexx);
    update();
    homeFeaturesData.refresh();
  }

  homeFeatureMinusBtn(int index, int indexx) {
    var count = Get.find<DashboardController>().cartCount.value - 1;
    Get.find<DashboardController>().cartCount.value = count;
    if (homeFeaturesData.value.categories![index].products![indexx].count ==
        0) {
    } else {
      homeFeaturesData.value.categories![index].products![indexx].count =
          (homeFeaturesData.value.categories![index].products![indexx].count)! -
              1;
    }
    removeCartDatas(index, indexx);
    homeFeaturesData.refresh();
    update();
  }

  homeFeatureAddBtn(int index, int indexx) {
    var count = Get.find<DashboardController>().cartCount.value + 1;
    Get.find<DashboardController>().cartCount.value = count;
    homeFeaturesData.value.categories![index].products![indexx].count =
        (homeFeaturesData.value.categories![index].products![indexx].count)! +
            1;
    AddToCart(index, indexx);
    homeFeaturesData.refresh();
    update();
  }

  AddToCart(index, indexx) {
    if ((productData.value["product_info"]?.length)! > 0) {
      ExistingAddCartData(index, indexx);
    } else {
      addCartDatas(index, indexx);
    }
    update();
  }

  ExistingAddCartData(index, indexx) {
    int? QuantityIncreasingIndex = productData.value["product_info"]
        ?.indexWhere((element) =>
            element["product_id"] ==
            homeFeaturesData
                .value.categories?[index].products?[indexx].productId);
    if (QuantityIncreasingIndex != -1) {
      productData.value["product_info"]?[QuantityIncreasingIndex!]["qty"] =
          productData.value["product_info"]?[QuantityIncreasingIndex]["qty"] +
              1;
      if (homeFeaturesData
              .value.categories?[index].products?[indexx].options?.isNotEmpty ??
          false) {
        if (homeFeaturesData.value.categories?[index].products?[indexx]
                .options?[0].selectedDropdownValue !=
            productData.value["product_info"]?[QuantityIncreasingIndex!]
                ["prodcut_option_value_id"]) {
          productData.value["product_info"]?[QuantityIncreasingIndex!]
                  ["prodcut_option_value_id"] =
              homeFeaturesData.value.categories?[index].products?[indexx]
                  .options?[0].selectedDropdownValue;
        }
      }
    } else {
      addCartDatas(index, indexx);
    }
    update();
  }

  addCartDatas(index, indexx) {
    if (homeFeaturesData
            .value.categories?[index].products?[indexx].options?.isNotEmpty ??
        false) {
      if (homeFeaturesData.value.categories?[index].products?[indexx]
              .options?[0].selectedDropdownValue ==
          "") {
        homeFeaturesData.value.categories?[index].products?[indexx].options?[0]
                .selectedDropdownValue =
            homeFeaturesData.value.categories?[index].products?[indexx]
                .options?[0].productOptionValue?[0].productOptionValueId;
      }
      productData.value["product_info"]?.add({
        "product_id": homeFeaturesData
            .value.categories?[index].products?[indexx].productId,
        "qty": 1,
        "product_option_id": homeFeaturesData.value.categories?[index]
            .products?[indexx].options?[0].productOptionId,
        "prodcut_option_value_id": homeFeaturesData.value.categories?[index]
            .products?[indexx].options?[0].selectedDropdownValue,
        "action": "ADD"
      });
    } else {
      productData.value["product_info"]?.add({
        "product_id": homeFeaturesData
            .value.categories?[index].products?[indexx].productId,
        "qty": 1,
        "action": "ADD"
      });
    }
    print(productData);
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

  Future<int> hitAddCartAPI({cls: ""}) async {
    if ((productData.value["product_info"]?.length)! > 0) {
      var response = await ApiHelper.addCart(productData.value);
      if (response.responseCode == 0) {
        return 0;
      } else {
        return 0;
      }
      // if (cls == "home") {
      // } else {
      //
      // }
    } else {
      return 0;
      // Get.toNamed(Routes.CART_SCREEN)?.then((value) {
      //   Get.find<HomeScreenController>().getHomeFeatures();
      //   Get.find<DashboardController>().getCartCount();
      //   if (Get.find<DashboardController>().selectedIndex.value == 2) {
      //     if (Get.find<OffersController>()
      //             .productData
      //             .value["product_info"]
      //             ?.length !=
      //         0) {
      //       Get.find<OffersController>().hitAddCartAPI();
      //       Get.find<OffersController>().getsCategory();
      //     }
      //   }
      // });
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
