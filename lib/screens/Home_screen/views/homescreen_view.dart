import 'package:family_garden/screens/Home_screen/controllers/homescreen_controller.dart';
import 'package:family_garden/utils/theme/app_colors.dart';
import 'package:family_garden/utils/theme/app_sizes.dart';
import 'package:family_garden/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      key: controller.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55), child: AppBar(
        systemOverlayStyle: (SystemUiOverlayStyle.dark),
        leading: Image.asset("assets/icons/sideMenu.png",height: 20,width: 24,),
        title: TextWidget("Family Garden",fontSize: 26,fontWeight: FontWeight.w600,color: Colors.white,),
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
                margin: EdgeInsets.only(top: 10,left: 3.0),
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
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Container(
          height: Get.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )
          ),
          child: Column(
            children: [
AppSize.size.h10,
              Container(
                height: 51,
                padding: const EdgeInsets.only(left: 15, right: 15),

                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: controller.search,
                        onChanged: (value) {
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search for vegetables and fruits",
                          hintStyle: TextStyle(
                              color: Color(0xff1B1B1B),
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none),
                          fillColor: Color(0xfff1f1f1),
                          filled: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}