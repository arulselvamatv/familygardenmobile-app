import 'package:carousel_slider/carousel_slider.dart';
import 'package:family_garden/screens/Home_screen/controllers/homescreen_controller.dart';
import 'package:family_garden/utils/theme/app_colors.dart';
import 'package:family_garden/utils/theme/app_sizes.dart';
import 'package:family_garden/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      key: controller.scaffoldKey,
      appBar: AppBar(
        systemOverlayStyle: (SystemUiOverlayStyle.dark),
        leadingWidth: 30,
        leading:

        SizedBox(
          height: 20,width: 20,
            child: Image.asset("assets/icons/sideMenu.png",fit: BoxFit.contain,)),
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
      body:
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          height: Get.height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: SingleChildScrollView(
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    child: TextFormField(
                      controller: controller.search,
                      maxLines: 1,
                      onChanged: (value) {
                      },

                      decoration:  InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search for vegetables and fruits",
                        contentPadding: EdgeInsets.symmetric(vertical: 4),
                        hintStyle: TextStyle(
                            color: Color(0xff1B1B1B),
                            fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30)),
                        fillColor: Color(0xfff1f1f1),
                        filled: true,
                      ),
                    ),
                  ),
                  AppSize.size.h20,
                  Container(
                    height: 130,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage('assets/images/freeDeliveryBanner.png'),fit: BoxFit.fill)
                    ),
                  ),
                  AppSize.size.h10,
                  SizedBox(
                    height: 160,
                    width: Get.width,
                    child: CarouselSlider.builder(
                        carouselController: controller.carouselController,
                        itemCount: controller.carousel.length,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(controller.carousel[index],fit: BoxFit.fill,),
                          );
                        },
                        options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
controller.pageChanged(index);
                            })),
                  ),
              GetBuilder<HomeScreenController>(
                builder: (careController) => Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          height: 6,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.carousel.length,
                              itemBuilder: (context, i) {
                                return Container(
                                  width: 15.0,
                                  height: 15.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    //  borderRadius: BorderRadius.circular(4),
                                    color: controller.currentIndex.value == i
                                        ? Color(0xff1B1B1B)
                                        :  Colors.grey,
                                  ),
                                );
                              }),
                        ),
                      ),
                    )),
                  AppSize.size.h20,
                  TextWidget("Shop by Category",fontSize: 18,fontWeight: FontWeight.w600,),
                  AppSize.size.h10,
                  Container(
                    height: 130,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                      return Container(
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xfff1f1f1)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                child: Image.asset
                                  (controller.category[index]['image']),
                              ),
                            ),
                            AppSize.size.h10,
                            Container(
                              constraints: BoxConstraints(maxWidth: 65),
                                child: TextWidget(controller.category[index]['name'],fontSize: 10,fontWeight: FontWeight.w600,textAlign: TextAlign.center,height: 1.5,maxLines: 2,textOverflow: TextOverflow.ellipsis,))
                          ],
                        ),
                      );
                    }, separatorBuilder: (context, index){
                      return AppSize.size.w10;
                    }, itemCount: controller.category.length),
                  ),
                  AppSize.size.h20,
                  TextWidget("Best Sellers",fontSize: 18,fontWeight: FontWeight.w600,),
                  AppSize.size.h10,
                  Container(
                    height: 150,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                          return Container(
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.grey,width: 0.5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Image.asset(controller.bestSellers[index]['image'],height: 60,fit: BoxFit.contain,),
                                ),
                                TextWidget(controller.bestSellers[index]['name'],fontSize: 12,fontWeight: FontWeight.w800,),
                                TextWidget(controller.bestSellers[index]['nameInTamil'],fontSize: 12,fontWeight: FontWeight.w500,),
                                TextWidget(controller.bestSellers[index]['price'],fontSize: 12,fontWeight: FontWeight.w800,),
                                TextWidget(controller.bestSellers[index]['oldPrice'],fontSize: 10,fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough,),
                              ],
                            ),
                          );
                        }, separatorBuilder: (context, index){
                      return AppSize.size.w10;
                    }, itemCount: controller.bestSellers.length),
                  ),


                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}