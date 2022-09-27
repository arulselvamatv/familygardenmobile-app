import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import '../../../utils/common_import/common_import.dart';

class HomeScreenController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController search = TextEditingController();
  final CarouselController carouselController = CarouselController();


  RxBool loader = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }



}