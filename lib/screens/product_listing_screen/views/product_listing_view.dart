import 'package:family_garden/screens/product_listing_screen/controllers/products_listing_controller.dart';
import 'package:family_garden/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/theme/app_sizes.dart';
import '../../../widgets/custom_text.dart';

class ProductListingView extends GetView<ProductListingController>{
  @override
  Widget build(BuildContext context) {
    return   Obx(() =>
        Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            systemOverlayStyle: (SystemUiOverlayStyle.dark),
            leadingWidth: 50,
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: Container(
              width: 14,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                        child: Image.asset('assets/icons/backButton.png',height: 24,width: 24,)),
                  )
                ],
              ),
            ),
            title: TextWidget(controller.category[controller.categoriesIndex.value]['name'].toString(),fontSize: 19,fontWeight: FontWeight.w600,color: Colors.white,textOverflow: TextOverflow.ellipsis,),
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
          Container(
            decoration: const BoxDecoration(
                color: Color(0xffF3F3F3),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )
            ),
            child: Column(
              children: [
                AppSize.size.h15,
                Obx(() =>
                   Stack(
                     fit: StackFit.loose,
                     children: [
                       Positioned(
                         bottom: 2,
                         child: Container (
                           height: 0.75,
                           width: Get.width,
                           color: Color(0xffDBDBDB),
                         ),
                       ),

                       Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 85,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index){
                              return GestureDetector(
                                onTap: (){
                                  controller.categoriesOnTap(index);
                                },
                                child: Container (
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,

                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Image.asset(controller.category[index]['image']),
                                        ),
                                      ),
                                      AppSize.size.h10,
                                      Container(
                                          constraints: BoxConstraints(maxWidth: 64),
                                          child: TextWidget(controller.category[index]['name'],fontSize: 10,fontWeight: FontWeight.w400,color: Colors.black,textAlign: TextAlign.center,maxLines: 2,textOverflow: TextOverflow.ellipsis,)),
                                      Spacer(),
                                      Visibility(
                                        visible: controller.categoriesIndex.value == index,
                                        child: Container(height: 4.5,width: 45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: AppColors.primaryColor
                                        ),),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }, separatorBuilder: (context, index){
                          return AppSize.size.w10;
                        }, itemCount: controller.category.length),
                  ),
                     ],
                   ),
                ),
                AppSize.size.h15,
              GetBuilder<ProductListingController>(
                  builder: (productListController) =>
                   Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 30),
                        itemBuilder: (context, index){

                          return GestureDetector(
                            onTap: (){

                            },
                            child: Stack(
                              children: [
                                Container (
                                  height: 130,
                                  color: Colors.white,
                                  width: Get.width,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 14,bottom: 12,top: 29,right: 20),
                                        child: Container (
                                          height: 90,
                                          width: 90,
                                          child: Image.asset(controller.categoryList[index]['image'],fit: BoxFit.fill,),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(controller.categoryList[index]['name'],fontSize: 14,fontWeight: FontWeight.w600,maxLines: 1,textOverflow: TextOverflow.ellipsis,),
                                            AppSize.size.h5,

                                              TextWidget(controller.categoryList[index]['nameInTamil'],fontSize: 14,fontWeight: FontWeight.w500,maxLines: 1,textOverflow: TextOverflow.ellipsis,),
                                            AppSize.size.h5,
                                            Container(
                                              height: 21,
                                              width:127,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: Colors.grey,width: 0.5)
                                              ),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  isExpanded: true,
                                                  isDense: true,
                                                  value: controller.selectedItemValue[index].toString(),
                                                  icon: const Icon(Icons.keyboard_arrow_down,size: 15,color: Colors.black,),
                                                  elevation: 16,
                                                  style: const TextStyle(color: Colors.black),

                                                  onChanged: (String? value) {
                                                    controller.dropDownChanged(value,index);
                                                  },
                                                  items: controller.itemsList.map<DropdownMenuItem<String>>((String value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 6),
                                                        child: Text(value,style: TextStyle(fontSize: 12,color: Colors.black),),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                            AppSize.size.h5,
                                                      TextWidget(controller.categoryList[index]['price'],fontSize: 17,fontWeight: FontWeight.w600,),
                                            Spacer(),
                                            TextWidget(controller.categoryList[index]['oldPrice'],fontSize: 12,fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough,),

                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16,bottom: 14),
                                        child: GestureDetector(
                                          onTap: (){
                                            controller.cartButton(index);
                                          },
                                          child: Container(
                                            height: 26,
                                            width: 71,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              // border: Border.all(),

                                                boxShadow: [
                                                  BoxShadow(
                                                      offset: Offset(0, 0),
                                                      blurRadius: 3,
                                                      spreadRadius: 3,
                                                      color: Color(0xff000000).withOpacity(controller.cartBoolList[index] == true ? 0.2 : 0)),
                                                ],
                                              color: controller.cartBoolList[index] == true ? Colors.white : AppColors.primaryColor
                                            ),
                                            child: controller.cartBoolList[index] == true ? Row (
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                onTap: (){
                                                  controller.minus(index);
                                                },
                                                  child: Container (
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Image.asset("assets/icons/minus.png"),
                                                  ),
                                                ),
                                                Spacer(),
                                                // TextWidget('-',color: Colors.white,fontSize: 8,),
                                                TextWidget(controller.counterList[index].toString(),color: Colors.black,fontSize: 13,fontWeight: FontWeight.w600,),
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: (){
                                                    controller.add(index);
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Image.asset("assets/icons/add.png"),
                                                  ),
                                                ),                                            ],
                                            ) : Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 6),
                                              child: Row (
                                                children: [
                                                  Image.asset('assets/icons/addToCart.png',height: 13,width: 13,fit: BoxFit.fill,),
                                                  AppSize.size.w5,
                                                  TextWidget('Add',fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white,)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    height: 21,
                                    width: 53,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFE6400),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(15)
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5,top: 5),
                                      child: TextWidget(controller.categoryList[index]['offer'],fontSize: 10,fontWeight: FontWeight.w600,color: Colors.white,),
                                    ),
                                  ),
                                )

                              ],
                            ),

                          );
                        }, separatorBuilder: (context, index){
                      return AppSize.size.h10;
                    }, itemCount: controller.categoryList.length),
                  ),
                ),

              ],
            ),

          )
      ),
    );
  }
}