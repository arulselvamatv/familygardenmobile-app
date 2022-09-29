import 'package:family_garden/screens/Home_screen/views/homescreen_view.dart';
import 'package:get/get.dart';
import '../../../utils/common_import/common_import.dart';

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin{
  RxInt selectedIndex = 0.obs;
  TabController? tabController;


  RxList<Widget> pages = <Widget>[
    HomeScreenView(),
    Icon(
      Icons.category_outlined,
      size: 150,
    ),
    Icon(
      Icons.discount,
      size: 150,
    ),
    Icon(
      Icons.person,
      size: 150,
    ),
  ].obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(vsync: this, length: 4);
  }
}