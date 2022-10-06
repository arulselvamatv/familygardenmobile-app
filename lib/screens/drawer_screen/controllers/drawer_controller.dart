import 'package:family_garden/utils/common_import/common_import.dart';
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

  sideMenuNavigation(int index) {
    if (index == 1) {
      Get.toNamed(Routes.CART_SCREEN);
    }
  }
}
