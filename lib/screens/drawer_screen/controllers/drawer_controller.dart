import 'package:family_garden/screens/account_screen/controllers/account_controller.dart';
import 'package:family_garden/screens/dashboard/controllers/dashboard_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';

class DrawerWidgetController extends GetxController {
  final formGlobalKey = GlobalKey<FormState>();
  RxList sideMenus = [
    {'name': 'Home', 'image': 'assets/icons/Home.svg'},
    {'name': 'My Cart', 'image': 'assets/icons/drawer_cart.svg'},
    {'name': 'Wishlist', 'image': 'assets/icons/drawer_wishlist.svg'},
    {'name': 'Order History', 'image': 'assets/icons/drawer_order_history.svg'},
    {'name': 'Offers & Deals', 'image': 'assets/icons/drawer_offers_deals.svg'},
    {'name': 'Customer Service', 'image': 'assets/icons/drawer_customer_service.svg'},
    {'name': 'FAQ', 'image': 'assets/icons/drawer_faq.svg'},
  ].obs;
  RxString login = "".obs;
  RxBool isLoggedin = true.obs;
  RxString userName = "".obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onInit() {
    super.onInit();
    getLocalDatas();
  }

  logout(context) {
    isLoggedin.value == false;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text("Logout successfully"),
    ));
    update();
  }

  getLocalDatas() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("Login")) {
      if (prefs.getString("Login") == "true") {
        // prefs.setString("firstName",
        //     (response.data?.firstname)
        if (prefs.containsKey("firstName")) {
          userName.value = prefs.getString("firstName")!;
        }
        isLoggedin.value = false;
      }
      isLoggedin.refresh();
    }
    update();
  }

  sideMenuNavigation(int index) {
    print(index);
    if (index == 0) {
      Get.find<DashboardController>().tabController?.animateTo(0);
      Get.find<DashboardController>().selectedIndex.value = 0;
      Get.find<DashboardController>().selectedIndex.refresh();
      // Get.back();
      Get.back();
      // // print("Hitted");
      // Get.toNamed(Routes.DASHBOARD);
    } else if (index == 1) {
      Get.toNamed(Routes.CART_SCREEN);
    } else if (index == 2) {
      if (isLoggedin.value) {
        Get.toNamed(Routes.LOGIN);
      } else {
        Get.toNamed(Routes.WISH_LIST_SCREEN);
      }
    } else if (index == 3) {
      if (isLoggedin.value) {
        Get.toNamed(Routes.LOGIN);
      } else {
        Get.toNamed(Routes.ORDER_HISTORY_SCREEN);
      }
    } else if (index == 4) {
      Get.find<DashboardController>().tabController?.animateTo(2);
      Get.find<DashboardController>().selectedIndex.value = 2;
      Get.find<DashboardController>().selectedIndex.refresh();
      Get.back();
      // Get.toNamed(Routes.CART_SCREEN);
    } else if (index == 5) {
      Get.toNamed(Routes.HELP_CENTER);
    } else if (index == 6) {
      Get.toNamed(Routes.FAQ);
    }
    getDatas();
  }

  getDatas() async {
    var prefs = await SharedPreferences.getInstance();
    // if (prefs.containsKey("Login")) {
    //   login.value = prefs.getString("Login")!;
    // }
    if (prefs.containsKey("Login")) {
      String nameText = prefs.getString('Login') ?? '';
      if (nameText == "true") {
        login.value = prefs.getString("Login")!;
      }
    }
  }
}
