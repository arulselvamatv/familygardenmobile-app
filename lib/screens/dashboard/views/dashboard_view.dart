import 'package:family_garden/screens/categories_screen/views/categories_view.dart';
import 'package:family_garden/screens/dashboard/controllers/dashboard_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/theme/app_colors.dart';
import '../../../utils/theme/app_sizes.dart';
import '../../../widgets/custom_text.dart';
import '../../Home_screen/views/homescreen_view.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            systemOverlayStyle: (SystemUiOverlayStyle.dark),
            leadingWidth: 50,
            centerTitle: controller.selectedIndex.value == 0 ? false : true,
            leading: Container(
              width: 14,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Image.asset('assets/icons/sideMenu.png',height: 25,width: 25,fit: BoxFit.fill,)),
                  )
                ],
              ),
            ),
            title: TextWidget(controller.selectedIndex.value == 0 ? "Family Garden" : controller.selectedIndex.value == 1 ? 'Category' : controller.selectedIndex.value == 2 ? 'Offers': 'Account',fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white,),
            actions: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20,top: 15),
                    child: Image.asset("assets/icons/cart.png",height: 25,width: 25),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(top: 10,left: 3.0),
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                            child: TextWidget("0",color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,)
                        ),
                      ),
                    ),
                  ),

                ],
              )
            ],
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
          ),
          body: Center(
            child: TabBarView(
              controller: controller.tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                HomeScreenView(),
                CategoriesView(),
                Icon(
                  Icons.discount,
                  size: 150,
                ),
                Icon(
                  Icons.person,
                  size: 150,
                ),
              ],
            ),
          ),
          // Center(
          //   child: controller.pages.elementAt(controller.selectedIndex.value),
          // ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
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
                borderSide: BorderSide(color: Colors.black, width: 4.0),
                insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 66.0),
              ),
              indicatorColor: Color(0xff000000),
              onTap: (index) {
                controller.selectedIndex(index);
              },
              tabs: [
                Tab(
                  text: 'Home',
                  icon: Image.asset(
                    'assets/icons/home.png',
                    height: 21,
                    width: 21,
                    color: controller.selectedIndex == 0
                        ? Colors.black
                        : Color(0xff6F6F6F),
                  ),
                ),
                Tab(
                  text: 'Categories',
                  icon: Image.asset(
                    'assets/icons/categories.png',
                    height: 21,
                    width: 21,
                    color: controller.selectedIndex == 1
                        ? Colors.black
                        : Color(0xff6F6F6F),
                  ),
                ),
                Tab(
                  text: 'Offers',
                  icon: Image.asset(
                    'assets/icons/offers.png',
                    height: 21,
                    width: 21,
                    color: controller.selectedIndex == 2
                        ? Colors.black
                        : Color(0xff6F6F6F),
                  ),
                ),
                Tab(
                  text: 'Account',
                  icon: Image.asset(
                    'assets/icons/account.png',
                    height: 21,
                    width: 21,
                    color: controller.selectedIndex == 3
                        ? Colors.black
                        : Color(0xff6F6F6F),
                  ),
                ),
              ],
            ),
          )
          // Theme(
          //   data: Theme.of(context).copyWith(
          //     primaryColor: Colors.white,
          //     canvasColor: Colors.white
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
