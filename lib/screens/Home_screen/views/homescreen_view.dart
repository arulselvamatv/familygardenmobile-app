import 'package:carousel_slider/carousel_slider.dart';
import 'package:family_garden/screens/Home_screen/controllers/homescreen_controller.dart';
import 'package:family_garden/utils/theme/app_colors.dart';
import 'package:family_garden/utils/theme/app_sizes.dart';
import 'package:family_garden/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeScreenView extends GetView<HomeScreenController> {
var controller = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body:
        Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SingleChildScrollView(
              // physics: BouncingScrollPhysics(),
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        controller: controller.search,
                        maxLines: 1,
                        onChanged: (value) {
                        },

                        decoration:  InputDecoration(
                          prefixIcon: ImageIcon(AssetImage('assets/icons/search.png')),
                          hintText: "Search for vegetables and fruits",
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                          hintStyle: TextStyle(
                              color: Color(0xff464646),
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30)),
                          fillColor: Color(0xfff1f1f1),
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  AppSize.size.h10,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: 130,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage('assets/images/freeDeliveryBanner.png'),fit: BoxFit.fill)
                    ),
                  ),
                  AppSize.size.h15,
                  SizedBox(
                    height: 160,
                    width: Get.width,
                    child: CarouselSlider.builder(
                        carouselController: controller.carouselController,
                        itemCount: controller.carousel.length,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(controller.carousel[index],width: Get.width,fit: BoxFit.fill,),
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
                builder: (homeController) => Center(
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
                                  width: 6.0,
                                  height: 6.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 3),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    //  borderRadius: BorderRadius.circular(4),
                                    color: controller.currentIndex.value == i
                                        ? Color(0xff1B1B1B)
                                        :  Color(0xffB5B5B5),
                                  ),
                                );
                              }),
                        ),
                      ),
                    )),
                  AppSize.size.h30,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextWidget("Shop by Category",fontSize: 16,fontWeight: FontWeight.w600,),
                  ),
                  AppSize.size.h15,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: 130,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          Get.toNamed(Routes.PRODUCT_LISTING_SCREEN);
                        },
                        child: Container (
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xfff9f9f9)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                  child: Image.asset
                                    (controller.category[index]['image']),
                                ),
                              ),
                              AppSize.size.h10,
                              Container(
                                constraints: BoxConstraints(maxWidth: 70),
                                  child: TextWidget(controller.category[index]['name'],fontSize: 11,fontWeight: FontWeight.w600,textAlign: TextAlign.center,height: 1.5,maxLines: 2,textOverflow: TextOverflow.ellipsis,))
                            ],
                          ),
                        ),
                      );
                    }, separatorBuilder: (context, index){
                      return AppSize.size.w10;
                    }, itemCount: controller.category.length),
                  ),
                  AppSize.size.h30,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextWidget("Best Sellers",fontSize: 14,fontWeight: FontWeight.w600,),
                  ),
                  AppSize.size.h15,
                  GetBuilder<HomeScreenController>(
                    builder: (homeController) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      height: 170,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index){
                            return Stack(
                              children: [
                                Container(
                                  width: 115,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(color: Color(0xffDEDCDC),width: 0.75),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppSize.size.h10,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Image.asset(controller.bestSellers[index]['image'],height: 60,width: 70,fit: BoxFit.fill,),
                                      ),
                                      AppSize.size.h3,
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: TextWidget(controller.bestSellers[index]['name'],fontSize: 10,fontWeight: FontWeight.w800,maxLines: 1,textOverflow: TextOverflow.ellipsis,),
                                      ),
                                      AppSize.size.h3,
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: TextWidget(controller.bestSellers[index]['nameInTamil'],fontSize: 9,fontWeight: FontWeight.w500,maxLines: 1,textOverflow: TextOverflow.ellipsis,),
                                      ),
                                      AppSize.size.h5,
                                      // Container(
                                      //   height: 20,
                                      //   child: DropdownButtonFormField2(
                                      //     value: controller.selectedValue,
                                      //     isExpanded: true,
                                      //     items:  controller.itemsList
                                      //         .map((item) => DropdownMenuItem<String>(
                                      //       value: item,
                                      //       child: Text(
                                      //         item,
                                      //         style: TextStyle(fontSize: 8),
                                      //       ),
                                      //     ))
                                      //         .toList(),
                                      //     onChanged: (value) {
                                      //     },
                                      //     icon: const Icon(
                                      //       Icons.keyboard_arrow_down_rounded,
                                      //       color: Color(0xfff9f9f9),
                                      //     ),
                                      //     iconSize: 10,
                                      //     buttonPadding: EdgeInsets.all(2),
                                      //     scrollbarRadius: const Radius.circular(40),
                                      //     scrollbarThickness: 6,
                                      //     scrollbarAlwaysShow: true,
                                      //     offset: const Offset(0, 5),
                                      //   ),
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Container(
                                          height: 20,
                                          // width:70,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Colors.grey,width: 0.5)
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              isExpanded: true,
                                              isDense: true,
                                              value: controller.selectedItemValue[index].toString(),
                                              icon: const Icon(Icons.keyboard_arrow_down,size: 10,),
                                              elevation: 16,
                                              style: const TextStyle(color: Colors.grey),

                                              onChanged: (String? value) {
                                                controller.dropDownChanged(value,index);
                                              },
                                              items: controller.itemsList.map<DropdownMenuItem<String>>((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 3),
                                                    child: Text(value,style: TextStyle(fontSize: 9),),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // DropdownButtonHideUnderline(
                                      //   child: DropdownButton2(
                                      //     items: controller.itemsList.map((item) =>
                                      //     DropdownMenuItem<String>(
                                      //       value: item,
                                      //         child: TextWidget(item,fontSize: 8,))
                                      //     ).toList(),
                                      //     value: controller.selectedValue,
                                      //     onChanged: (value){
                                      //       controller.selectedValue = value as String;
                                      //     },
                                      //     buttonHeight: 20,
                                      //     buttonWidth: 70,
                                      //     itemHeight: 40,
                                      //   ),
                                      // ),
                                      AppSize.size.h5,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(controller.bestSellers[index]['price'],fontSize: 13,fontWeight: FontWeight.w600,),
                                                TextWidget(controller.bestSellers[index]['oldPrice'],fontSize: 10,fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough,),
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              height: 29,
                                              width: 28,
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryColor,
                                                borderRadius: BorderRadius.circular(7)
                                              ),
                                              child: Center(child: Image.asset ('assets/icons/addToCart.png',height: 15,width: 15,fit: BoxFit.contain,)),
                                            )
                                          ],
                                        ),
                                      ),
                                      AppSize.size.h5,
                                      AppSize.size.h3,

                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    height: 15,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFE6400),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        topRight: Radius.circular(3)
                                      )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8,top: 3),
                                      child: TextWidget(controller.bestSellers[index]['offer'],fontSize: 8,fontWeight: FontWeight.w600,color: Colors.white,),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }, separatorBuilder: (context, index){
                        return AppSize.size.w10;
                      }, itemCount: controller.bestSellers.length),
                    ),
                  ),

                  AppSize.size.h30,


                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}