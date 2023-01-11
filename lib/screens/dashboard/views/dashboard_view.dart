// import 'package:family_garden/screens/Home_screen/controllers/homescreen_controller.dart';
import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/screens/categories_screen/views/categories_view.dart';
import 'package:family_garden/screens/dashboard/controllers/dashboard_controller.dart';
import 'package:family_garden/screens/drawer_screen/views/drawer_view.dart';
import 'package:family_garden/screens/offers_screen/controller/offers_controller.dart';
import 'package:family_garden/screens/offers_screen/view/offer_screen_view.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/common_appbar/custom_appbar_view.dart';
import 'package:flutter_svg/svg.dart';
import '../../../routes/app_pages.dart';
import '../../Home_screen/controllers/homescreen_controller.dart';
import '../../Home_screen/views/homescreen_view.dart';
import '../../account_screen/views/account_view.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Obx(
      () => Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: CustomAppbarView(
              leading_width: 50,
              appbar_leading: Container(
                width: 14,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: GestureDetector(
                          onTap: () {
                            scaffoldKey.currentState?.openDrawer();
                          },
                          child: SvgPicture.asset(
                            'assets/icons/side-menu.svg',
                            fit: BoxFit.scaleDown,
                            height: 25,
                            width: 25,
                          )),
                    )
                  ],
                ),
              ),
              font_size: 19,
              appbar_title: controller.selectedIndex.value == 0
                  ? "Family Garden"
                  : controller.selectedIndex.value == 1
                      ? 'Category'
                      : controller.selectedIndex.value == 2
                          ? 'Offers'
                          : controller.isLoggedIn.value
                              ? 'Account'
                              : "Account Login",
              center_title: true,
              leading_image: "Add",
              appBarActions: GestureDetector(
                onTap: () async {
                  print("Dashboard");
                  // Get.find<HomeScreenController>().vegHitAddCartAPI();
                  int vals =
                      await Get.find<HomeScreenController>().hitAddCartAPI();
                  if(vals == 0) {
                    Get.toNamed(Routes.CART_SCREEN)?.then((value) {
                      Get.find<HomeScreenController>().clearHomeFeatureDatas();
                      Get.find<DashboardController>().getCartCount();
                      if (Get.find<DashboardController>().selectedIndex.value ==
                          2) {
                        if (Get.find<OffersController>()
                            .productData
                            .value["product_info"]!.isNotEmpty) {
                          Get.find<OffersController>().hitAddCartAPI();
                          Get.find<OffersController>().getsCategory();
                        }
                      }
                    });
                  }
                  // Get.find<HomeScreenController>().fruitsHitAddCartAPI();
                  controller.update();
                },
                child: controller.selectedIndex.value == 3
                    ? Container()
                    : Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20, top: 15),
                            child: SvgPicture.asset("assets/icons/cart-btn.svg", fit: BoxFit.scaleDown,
                                height: 25, width: 25),
                          ),
                          controller.cartCount.value == 0
                              ? Container()
                              : Container(
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.topRight,
                                  margin:
                                      const EdgeInsets.only(top: 7, left: 9.0),
                                  child: Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.white,
                                        border: Border.all(
                                            color: AppColors.white, width: 1)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Center(
                                          child: Obx(
                                        () => TextWidget(
                                          controller.cartCount.value.toString(),
                                          color: AppColors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                    ),
                                  )),
                        ],
                      ),
              ),
            ),
          ),
          drawer: DrawerView(),
          body: Center(
            child: TabBarView(
              controller: controller.tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                HomeScreenView(),
                CategoriesView(),
                OffersView(),
                // Icon(
                //   Icons.light,
                //   size: 150,
                // ),
                AccountView(),
              ],
            ),
          ),
          // Center(
          //   child: controller.pages.elementAt(controller.selectedIndex.value),
          // ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 5,
                    spreadRadius: 5,
                    color: Color(0xffDDDDDD)),
              ],
            ),
            height: 70,
            child: TabBar(
              controller: controller.tabController,
              padding: EdgeInsets.only(top: 10),
              labelColor: Color(0xff000000),
              unselectedLabelColor: Color(0xff9B9B9B),
              labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: AppColors.black, width: 4.0),
                insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 66.0),
              ),
              indicatorColor: Color(0xff000000),
              onTap: (index) {
                controller.selectedIndex.value = index;
              },
              tabs: [
                Tab(
                  text: 'Home',
                  icon: SvgPicture.asset(
                    'assets/icons/home_icon_.svg',
                    height: 21,
                    width: 21,
                    color: controller.selectedIndex.value == 0
                        ? AppColors.black
                        : Color(0xff6F6F6F),
                  ),
                ),
                Tab(
                  text: 'Categories',
                  icon: Image.asset(
                    'assets/icons/categories.png',
                    height: 21,
                    width: 21,
                    color: controller.selectedIndex.value == 1
                        ? AppColors.black
                        : Color(0xff6F6F6F),
                  ),
                ),
                Tab(
                  text: 'Offers',
                  icon: SvgPicture.asset(
                    'assets/icons/offers_icon.svg',
                    height: 21,
                    width: 21,
                    color: controller.selectedIndex.value == 2
                        ? AppColors.black
                        : Color(0xff6F6F6F),
                  ),
                ),
                Tab(
                  text: 'Account',
                  icon: SvgPicture.asset(
                    'assets/icons/account_icon.svg',
                    height: 21,
                    width: 21,
                    color: controller.selectedIndex.value == 3
                        ? AppColors.black
                        : Color(0xff6F6F6F),
                  ),
                ),
              ],
            ),
          )
          // Theme(
          //   data: Theme.of(context).copyWith(
          //     primaryColor: AppColors.white,
          //     canvasColor: AppColors.white
          //   ),
          //   child: BottomNavigationBar(
          //
          //     selectedItemColor: Color(0xff000000),
          //     showUnselectedLabels: true,
          //     unselectedItemColor: Color(0xff6F6F6F),
          //     unselectedLabelStyle: TextStyle(color: Color(0xff9B9B9B)),
          //     type: BottomNavigationBarType.fixed,
          //     items: <BottomNavigationBarItem>[
          //       BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/home.png')),label: 'Home'),
          //       BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/categories.png')),label: 'Categories'),
          //       BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/offers.png')),label: 'Offers'),
          //       BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/account.png')),label: 'Account'),
          //
          //     ],
          //     iconSize: 22,
          //     currentIndex: controller.selectedIndex.value,
          //     onTap: (index){
          //       controller.selectedIndex(index);
          //     },
          //   ),
          // ),
          ),
    );
  }
}
