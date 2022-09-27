import 'package:get/get.dart';
import '../../../utils/common_import/common_import.dart';

class HomeScreenController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController search = TextEditingController();

  RxBool loader = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }



}