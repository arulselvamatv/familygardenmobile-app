import 'package:carousel_slider/carousel_controller.dart';
import 'package:family_garden/network/api_helper.dart';
import '../../../models/categories_model.dart';
import '../../../models/home_slider_model.dart';
import '../../../utils/common_import/common_import.dart';

class HomeScreenController extends GetxController {
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController search = TextEditingController();
  final CarouselController carouselController = CarouselController();

  RxInt currentIndex = 0.obs;
  RxBool iscarouselLoader = false.obs;
  RxBool isCategoryLoader = true.obs;

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

  RxList<String> items = <String>['One', 'Two', 'Three', 'Four'].obs;

  RxList selectedItemValue = [].obs;

  RxBool loader = false.obs;

  @override
  void onInit() async {
    super.onInit();
    for (int i = 0; i < bestSellers.length; i++) {
      selectedItemValue.add(itemsList[0]);
    }
    getHomeSliderDetails();
    getCategories();
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
    iscarouselLoader.value = true;
    var response = await ApiHelper.getHomeSliderDetails();
    if (response.isSuccessFul) {
      iscarouselLoader.value = false;
      carousel.value = (response.data?.modules?[0].banners)!;
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
