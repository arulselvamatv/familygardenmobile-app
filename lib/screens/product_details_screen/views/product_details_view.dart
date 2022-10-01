import 'package:carousel_slider/carousel_slider.dart';
import 'package:family_garden/screens/product_details_screen/controllers/product_details_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  @override
  Widget build(BuildContext context) {
    return
        Obx(() =>
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
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            'assets/icons/backButton.png',
                            height: 24,
                            width: 24,
                          )),
                    )
                  ],
                ),
              ),
              title: TextWidget(
                'Order',
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                textOverflow: TextOverflow.ellipsis,
              ),
              actions: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 15),
                      child: Image.asset("assets/icons/cart.png",
                          height: 25, width: 25),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.only(top: 10, left: 3.0),
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
                              child: TextWidget(
                            "0",
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                      ),
                    ),
                  ],
                )
              ],
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
            ),
            body: Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppSize.size.h15,
                    TextWidget(
                      'Carrot',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                    AppSize.size.h3,
                    TextWidget(
                      'கேரட்',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 215,
                      width: Get.width,
                      child: Stack(
                        children: [
                          CarouselSlider.builder(
                              carouselController: controller.carouselController,
                              itemCount: controller.carouselImage.length,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(
                                    controller.carouselImage[index],
                                    width: Get.width / 1.5,
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                  autoPlay: false,
                                  viewportFraction: 1,
                                  scrollPhysics: NeverScrollableScrollPhysics(),
                                  enableInfiniteScroll: false,
                                  onPageChanged: (index, reason) {
                                    // controller.pageChanged(index);
                                  })),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                onPressed: () {
                                  controller.carouselController.nextPage();
                                },
                                icon: Icon(Icons.arrow_forward_ios_outlined)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                onPressed: () {
                                  controller.carouselController.previousPage();
                                },
                                icon: Icon(Icons.arrow_back_ios_outlined)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index){
                            return GestureDetector(
                              onTap: (){
                                controller.onProductWeightSelected(index);
                              },
                              child: Container (
                                decoration: BoxDecoration(color: controller.selecteIndex != index ? Colors.white : Color(0xffB6F1E7),
                                borderRadius: BorderRadius.circular(13),
                                  border: Border.all(color: controller.selecteIndex != index ? Color(0xffE8E8E7) : Colors.transparent)
                                ),
                                child: Center(child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: TextWidget(controller.productWeight[index],fontSize: 10,fontWeight: FontWeight.w600,color: Colors.black,),
                                )),
                              ),
                            );
                          }, separatorBuilder: (context, index){
                        return AppSize.size.w7;
                      }, itemCount: controller.productWeight.length),
                    ),
                    AppSize.size.h25,
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget('Description',fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black,),
                              AppSize.size.h5,
                              Container(
                                child: IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: TextWidget ('Carrot the juicy and crunchy vegetable is the favorite of many, and can be eaten raw, cooked, or prepared as a salad. Loaded with vitamins and minerals like calcium, vitamin K, A, beta carotene, and many more it takes care of our bone health and eyesight. Carrot is a veggie that is a must in your pantry.',
                                        fontSize: 11,fontWeight: FontWeight.w500,color: Color(0xff333333),),
                                      ),
                                     AppSize.size.w5,
                                     VerticalDivider(width: 1.5,thickness: 1.5,color: Color(0xffE5E5E5),)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    AppSize.size.h20,
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget('Benefits',fontSize: 14,fontWeight: FontWeight.w700,color: Colors.black,),
                              AppSize.size.h5,
                              TextWidget('- Good for the eyes\n- Lowers the risk of heart disease\n- Boosts Immunity',
                              fontSize: 11,fontWeight: FontWeight.w500,color: Color(0xff333333),)
                            ],
                          ),
                        )),
                    AppSize.size.h30,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (){
                              controller.onFavouriteButtonSelected();
                            },
                            child: Container (
                              height: 32,width: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xffE9E9EA)),
                              ),
                              child: Center(
                                child: Image.asset('assets/icons/favourite.png',color: controller.favourite.value == false ? Color(0xffDEDEDE) : Color(0xffFF8A00),),
                              ),
                            ),
                          ),
                          AppSize.size.w15,
                          GestureDetector(
                            onTap: (){
                              controller.onAddToCartSelected();
                            },
                            child: Container(
                              height: 32,
                              width: 127,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 0),
                                        blurRadius: 3,
                                        spreadRadius: 3,
                                        color: Color(0xff000000).withOpacity(controller.addToCart.value ? 0.2 : 0)),
                                  ],
                                  color: controller.addToCart.value ? Colors.white : AppColors.primaryColor
                              ),
                              child: controller.addToCart.value ? Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                      child: TextButton(
                                          style: ButtonStyle(
                                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                                          ),
                                          onPressed: (){
                                        controller.minus();
                                      }, child: Image.asset("assets/icons/minus.png"))),
                                  Spacer(),
                                  // TextWidget('-',color: Colors.white,fontSize: 8,),
                                  TextWidget(controller.counter.toString(),color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600,),
                                  Spacer(),
                                  SizedBox(
                                      width: 40,
                                      child: TextButton(
                                          style: ButtonStyle(
                                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                                          ),
                                          onPressed: (){
                                        controller.add();
                                      }, child: Image.asset("assets/icons/add.png"))),


                                ],
                              ) : Center(
                                child: TextWidget('Add to Cart',fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white,),
                              ),
                            ),
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextWidget('₹32.00',fontSize: 19,fontWeight: FontWeight.w600,color: Colors.black,),
                              TextWidget('₹35.00',fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff6A6A6A),decoration: TextDecoration.lineThrough,),
                              TextWidget('9% off',fontSize: 13,fontWeight: FontWeight.w500,color: Color(0xffFF8A00)),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
    );
  }
}
