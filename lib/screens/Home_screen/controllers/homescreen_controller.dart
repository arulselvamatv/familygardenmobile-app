import 'package:carousel_slider/carousel_controller.dart';
import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/network/get_local_datas.dart';
import '../../../models/categories_model.dart';
import '../../../models/home_feature_model.dart';
import '../../../models/home_slider_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';

class HomeScreenController extends GetxController {
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
  // HomeFeatureModel? homeFeatureDatas;

  late String selectedValue = itemsList.first;

  RxList category = [
    {'name': 'Fresh Vegetables', 'image': 'assets/images/Fresh Vegetables.png'},
    {'name': 'Fresh Fruits', 'image': 'assets/images/Fresh Fruits.png'},
    {'name': 'Cuts & Sprouts', 'image': 'assets/images/Cuts & sprouts.png'},
    {
      'name': 'Organic Fruits & Vegs',
      'image': 'assets/images/Organic Vegetables & Fruits.png'
    },
  ].obs;

  List bestSellers = [
    {
      'name': 'Carrot',
      'nameInTamil': 'கேரட்',
      'price': '₹28.00',
      'oldPrice': '₹35.00',
      'offer': '20% OFF',
      'image': 'assets/images/Carrot.png'
    },
    {
      'name': 'Apple 3piece-450.',
      'nameInTamil': 'ஆப்பிள் ',
      'price': '₹125.00',
      'oldPrice': '₹150.00',
      'offer': '17% OFF',
      'image': 'assets/images/apple.png'
    },
    {
      'name': 'Coriander Leaves',
      'nameInTamil': 'கொத்தமல்லி தழை ',
      'price': '₹15.00',
      'oldPrice': '₹30.00',
      'offer': '50% OFF',
      'image': 'assets/images/coriander.png'
    },
    {
      'name': 'Carrot',
      'nameInTamil': 'கேரட்',
      'price': '₹28.00',
      'oldPrice': '₹35.00',
      'offer': '70% OFF',
      'image': 'assets/images/Carrot.png'
    },
    {
      'name': 'Carrot',
      'nameInTamil': 'கேரட்',
      'price': '₹28.00',
      'oldPrice': '₹35.00',
      'offer': '50% OFF',
      'image': 'assets/images/Carrot.png',
    },
  ];

  final List<String> itemsList = [
    '250 grams - ₹28.00',
    '1 Pack - ₹125.00',
    '1 Bunch - ₹15.00',
  ];

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
  // RxList fruitsBool = [].obs;
  // RxList vegetablesBool = [].obs;
  // RxList<String> items = <String>['One', 'Two', 'Three', 'Four'].obs;

  RxList selectedItemValue = [].obs;

  RxBool loader = false.obs;

  @override
  void onInit() async {
    super.onInit();
    for (int i = 0; i < bestSellers.length; i++) {
      selectedItemValue.add(itemsList[0]);
    }
    getToken();
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
      double price = double.parse(vegetableList[i].price!);
      double offerprice = double.parse(vegetableList[i].offerPrice!);
      vegetablePercentage.add(100 - ((offerprice / price) * 100).toInt());
    }
    for (var i = 0; i < fruitsList.value.length; i++) {
      double price = double.parse(fruitsList[i].price!);
      double offerprice = double.parse(fruitsList[i].offerPrice!);
      fruitPercentage.add(100 - ((offerprice / price) * 100).toInt());
    }
    isVegetableLoader.value = true;
    isFruitLoader.value = true;
  }

  vegAddToCart(index) async {
    if (vegOptionId.value[index] == "") {
      vegProductId[index] = vegetableList[index].productId!;
      vegOptionId[index] = (vegetableList[index].options?[0].productOptionId)!;
      vegOptionValueId[index] =
          vegetableList[index].options?[0].productOptionValue?[0].optionValueId;
      // (products[index].option?[0].productOptionValue?[0].optionValueId)!;
      var response = await ApiHelper.addCart(
          vegProductId[index], vegOptionId[index], vegOptionValueId[index]);
      if (response.responseCode == 200) {
        Get.toNamed(Routes.PRODUCT_LISTING_SCREEN);
      }
    } else {
      var response = await ApiHelper.addCart(
          vegProductId[index], vegOptionId[index], vegOptionValueId[index]);
      if (response.responseCode == 200) {
        Get.toNamed(Routes.PRODUCT_LISTING_SCREEN);
      }
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

  dropDownChanged(String? value, int index) {
    selectedItemValue[index] = value!;
    update();
  }
}
