import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import '../../../utils/common_import/common_import.dart';

class HomeScreenController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController search = TextEditingController();
  final CarouselController carouselController = CarouselController();

  RxInt currentIndex = 0.obs;

  late String selectedValue = itemsList.first;

  RxList category = [
    {'name' : 'Fresh Vegetables', 'image' : 'assets/images/Fresh Vegetables.png'},
    {'name' : 'Fresh Fruits', 'image' : 'assets/images/Fresh Fruits.png'},
    {'name' : 'Cuts & Sprouts', 'image' : 'assets/images/Cuts & sprouts.png'},
    {'name' : 'Organic Fruits & Vegs', 'image' : 'assets/images/Organic Vegetables & Fruits.png'},
  ].obs;

  List bestSellers = [
    {'name' : 'Carrot', 'nameInTamil' : 'கேரட்', 'price' : '₹28.00', 'oldPrice' : '₹35.00', 'offer' : '20% OFF', 'image' : 'assets/images/carrot.png'},
    {'name' : 'Apple 3piece-450.', 'nameInTamil' : 'ஆப்பிள் ', 'price' : '₹125.00', 'oldPrice' : '₹150.00', 'offer' : '17% OFF', 'image' : 'assets/images/apple.png'},
    {'name' : 'Coriander Leaves', 'nameInTamil' : 'கொத்தமல்லி தழை ', 'price' : '₹15.00', 'oldPrice' : '₹30.00', 'offer' : '50% OFF', 'image' : 'assets/images/coriander.png'},
    {'name' : 'Carrot', 'nameInTamil' : 'கேரட்', 'price' : '₹28.00', 'oldPrice' : '₹35.00', 'offer' : '70% OFF', 'image' : 'assets/images/carrot.png'},
    {'name' : 'Carrot', 'nameInTamil' : 'கேரட்', 'price' : '₹28.00', 'oldPrice' : '₹35.00', 'offer' : '50% OFF', 'image' : 'assets/images/carrot.png',},
  ];

  final List<String> itemsList = [
    '250 grams - ₹28.00','250 grams - ₹28.00',
    '1 Pack - ₹125.00','1 Pack - ₹125.00',
    '1 Bunch - ₹15.00','1 Bunch - ₹15.00',
  ];

  RxList carousel = [
    'assets/images/carouselImage.png',
    'assets/images/carouselImage.png',
    'assets/images/carouselImage.png',
  ].obs;

  RxList<String> items = <String>['One', 'Two', 'Three', 'Four'].obs;


  RxBool loader = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }


  pageChanged(int index){
    currentIndex.value = index;
    update();
  }


}