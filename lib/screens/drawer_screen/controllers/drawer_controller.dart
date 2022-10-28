import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';

class DrawerWidgetController extends GetxController {
  RxList sideMenus = [
    {'name': 'Home', 'image': 'assets/icons/homeSideMenu.png'},
    {'name': 'My Cart', 'image': 'assets/icons/myCart.png'},
    {'name': 'Wishlist', 'image': 'assets/icons/wishist.png'},
    {'name': 'Order History', 'image': 'assets/icons/orderHistory.png'},
    {'name': 'Offers & Deals', 'image': 'assets/icons/offers&Deals.png'},
    {'name': 'Customer Service', 'image': 'assets/icons/customerCare.png'},
    {'name': 'FAQ', 'image': 'assets/icons/Faq.png'},
  ].obs;
  RxString login = "".obs;

  sideMenuNavigation(int index) {
    print(index);
    if (index == 0) {
      // print("Hitted");
      Get.toNamed(Routes.DASHBOARD);
    } else if (index == 1) {
      Get.toNamed(Routes.CART_SCREEN);
    } else if (index == 2) {
      Get.toNamed(Routes.WISH_LIST_SCREEN);
    } else if (index == 3) {
      Get.toNamed(Routes.ORDER_HISTORY_SCREEN);
    } else if (index == 4) {
      // Get.toNamed(Routes.CART_SCREEN);
    } else if (index == 5) {
      // Get.toNamed(Routes.C);
    } else if (index == 6) {
      Get.toNamed(Routes.FAQ);
    }
    getDatas();
  }

  getDatas() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("Login")) {
      login.value = prefs.getString("Login")!;
    }
  }
}
