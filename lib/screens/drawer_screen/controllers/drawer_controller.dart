import 'package:get/get.dart';

class DrawerWidgetController extends GetxController{

  RxList sideMenus = [
    {'name' : 'Home', 'image' : 'assets/icons/homeSideMenu.png'},
    {'name' : 'My Cart', 'image' : 'assets/icons/myCart.png'},
    {'name' : 'Wishlist', 'image' : 'assets/icons/wishist.png'},
    {'name' : 'Order History', 'image' : 'assets/icons/orderHistory.png'},
    {'name' : 'Offers & Deals', 'image' : 'assets/icons/offers&Deals.png'},
    {'name' : 'Customer Service', 'image' : 'assets/icons/customerCare.png'},
    {'name' : 'FAQ', 'image' : 'assets/icons/Faq.png'},
  ].obs;

}