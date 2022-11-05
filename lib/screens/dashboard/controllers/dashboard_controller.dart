import 'package:family_garden/screens/Home_screen/views/homescreen_view.dart';
import '../../../network/api_helper.dart';
import '../../../utils/common_import/common_import.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt selectedIndex = 0.obs;
  TabController? tabController;
  RxInt cartCount = 0.obs;

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
    getCartCount();
  }

  getCartCount() async {
    print("Called here");
    var response = await ApiHelper.cartCount();
    // print("CartCount response ${response.responseCode}");
    cartCount.value = int.parse(response["text_items"]);
    // if (response.responseCode == 200) {
    //   cartCount.value = int.parse((text_items);
    //   update();
    // }
    cartCount.refresh();
    update();
  }
}
