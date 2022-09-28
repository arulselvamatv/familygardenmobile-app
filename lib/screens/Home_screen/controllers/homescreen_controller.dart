import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import '../../../utils/common_import/common_import.dart';

class HomeScreenController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController search = TextEditingController();
  final CarouselController carouselController = CarouselController();

  RxInt currentIndex = 0.obs;

  RxList category = [
    {'name' : 'Fresh Vegetables', 'image' : 'assets/images/splash-mdpi.png'},
    {'name' : 'Fresh Fruits', 'image' : 'assets/images/splash-mdpi.png'},
    {'name' : 'Cuts & Sprouts', 'image' : 'assets/images/splash-mdpi.png'},
    {'name' : 'Organic Fruits & Vegs', 'image' : 'assets/images/splash-mdpi.png'},
  ].obs;

  RxList bestSellers = [
    {'name' : 'Carrot', 'nameInTamil' : 'கேரட்', 'price' : '₹28.00', 'oldPrice' : '₹35.00', 'offer' : '20% OFF', 'image' : 'assets/images/splash-mdpi.png'},
    {'name' : 'Carrot', 'nameInTamil' : 'கேரட்', 'price' : '₹28.00', 'oldPrice' : '₹35.00', 'offer' : '20% OFF', 'image' : 'assets/images/splash-mdpi.png'},
    {'name' : 'Carrot', 'nameInTamil' : 'கேரட்', 'price' : '₹28.00', 'oldPrice' : '₹35.00', 'offer' : '20% OFF', 'image' : 'assets/images/splash-mdpi.png'},
    {'name' : 'Carrot', 'nameInTamil' : 'கேரட்', 'price' : '₹28.00', 'oldPrice' : '₹35.00', 'offer' : '20% OFF', 'image' : 'assets/images/splash-mdpi.png'},
    {'name' : 'Carrot', 'nameInTamil' : 'கேரட்', 'price' : '₹28.00', 'oldPrice' : '₹35.00', 'offer' : '20% OFF', 'image' : 'assets/images/splash-mdpi.png'},
  ].obs;

  RxList carousel = [
    'assets/images/carouselImage.png',
    'assets/images/carouselImage.png',
    'assets/images/carouselImage.png',
  ].obs;


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