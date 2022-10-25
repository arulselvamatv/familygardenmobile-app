import 'package:family_garden/routes/app_pages.dart';
import 'package:family_garden/screens/profile_screen/controllers/profile_controller.dart';
import 'package:family_garden/widgets/custom_textfield.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../../utils/common_import/common_import.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  var controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            height: Get.height - 140,
            width: Get.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            child: Padding(
              padding: const EdgeInsets.only(top: 25,left: 16,right: 16),
              child: Column(
                children: [

                  Flexible(
                    child: SizedBox(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            TextWidget(
                              'Prasanth',
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),

                            Padding(padding: EdgeInsets.only(top: 20.0),),

                            Row(
                              children: [

                                Expanded(
                                  child: InkWell(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColors.dividerColor)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 6),
                                            child: Container(
                                                height: 18,
                                                width: 18,
                                                child: Image.asset(
                                                  'assets/icons/orderHistory.png',
                                                  fit: BoxFit.fill,
                                                  color: AppColors.primaryColor,
                                                )),
                                          ),
                                          AppSize.size.w7,
                                          TextWidget(
                                            'Order history',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: (){
                                      Get.toNamed(Routes.WISH_LIST_SCREEN);
                                    },
                                  ),
                                ),

                                Padding(padding: EdgeInsets.only(left: 10.0)),

                                Expanded(
                                  child: InkWell(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: AppColors.dividerColor)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 6),
                                            child: Container(
                                                height: 18,
                                                width: 18,
                                                child: Image.asset(
                                                  'assets/icons/wishist.png',
                                                  fit: BoxFit.fill,color: AppColors.primaryColor,
                                                )),
                                          ),
                                          AppSize.size.w7,
                                          TextWidget(
                                            'Wishlist',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color:AppColors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: (){
                                      Get.toNamed(Routes.WISH_LIST_SCREEN);
                                    },
                                  ),
                                ),

                              ],
                            ),


                            Padding(padding: EdgeInsets.only(top: 20.0),),


                            Divider(
                              color: Color(0xffE5E5E5),
                              thickness: 1,
                            ),

                            Padding(padding: EdgeInsets.only(top: 15.0),),


                            TextWidget(
                              'Account Settings',
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),

                             Padding(padding: EdgeInsets.only(top: 10.0)),

                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.EDIT_PROFILE);
                              },
                               child: Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: Image.asset(
                                          'assets/icons/account.png',
                                          fit: BoxFit.fill,
                                          color: AppColors.primaryColor,
                                        )),

                                    AppSize.size.w10,

                                    Expanded(
                                      child: TextWidget(
                                        'Edit Profile',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                    ),


                                    Icon(Icons.arrow_forward_ios,size: 15,)
                                  ],
                            ),
                               ),
                             ),

                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.MANAGE_ADDRESS_SCREEN);
                              },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: Image.asset(
                                          'assets/icons/address book.png',
                                          fit: BoxFit.fill,
                                          color: AppColors.primaryColor,
                                        )),

                                    AppSize.size.w10,

                                    Expanded(
                                      flex: 2,
                                      child:TextWidget(
                                        'Save Address',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                    ),

                                    Icon(Icons.arrow_forward_ios,size: 15,)

                                  ],
                            ),
                                ),
                              ),

                            Padding(padding: EdgeInsets.only(top: 20.0),),


                            Divider(
                              color: Color(0xffE5E5E5),
                              thickness: 1,
                            ),


                            Padding(padding: EdgeInsets.only(top: 15.0)),


                            TextWidget(
                              'FeedBack & Informations',
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),

                            Padding(padding: EdgeInsets.only(top: 10.0)),

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  SizedBox(
                                      height: 18,
                                      width: 18,
                                      child: Image.asset(
                                        'assets/icons/address book.png',
                                        fit: BoxFit.fill,
                                        color: AppColors.primaryColor,
                                      )),

                                  AppSize.size.w10,

                                  Expanded(
                                    child: TextWidget(
                                      'Terms & Conditions',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  ),


                                  Icon(Icons.arrow_forward_ios,size: 15,)
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  SizedBox(
                                      height: 18,
                                      width: 18,
                                      child: Image.asset(
                                        'assets/icons/Faq.png',
                                        fit: BoxFit.fill,
                                        color: AppColors.primaryColor,
                                      )),

                                  AppSize.size.w10,

                                  Expanded(
                                    flex: 2,
                                    child: TextWidget(
                                      'FAQs',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  ),

                                  Icon(Icons.arrow_forward_ios,size: 15,)

                                ],
                              ),
                            ),

                            Padding(padding: EdgeInsets.only(top: 20.0),),


                            Divider(
                              color: Color(0xffE5E5E5),
                              thickness: 1,
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                    child: SizedBox(
                      height: 50,
                      width: Get.width,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13))),
                          child: TextWidget(
                            'Log Out',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//      controller.isProductLoader.value ? Spacer() : Container(),
//               GetBuilder<WishListScreenController>(
//                 builder: (value) => controller.isProductLoader.value
//                     ? Center(
//                         child: CircularProgressIndicator(),
//                       )
//                     :   GetBuilder<WishListScreenController>(
//                   builder: (productListController) => Expanded(
//                     child: controller.isProductLoader.value
//                         ? Center(child: CircularProgressIndicator())
//                         : ListView.separated(
//                         scrollDirection: Axis.vertical,
//                         shrinkWrap: true,
//                         padding: EdgeInsets.only(bottom: 30),
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: () {
//                             },
//                             child: Container(
//                               height: 130,
//                               color: AppColors.white,
//                               width: Get.width,
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 14, bottom: 12, top: 29, right: 20),
//                                     child: SizedBox(
//                                       height: 90,
//                                       width: 90,
//                                       child: Image.asset(
//                                         controller.staticImage.value,
//                                         fit: BoxFit.fill,
//                                       )
//                                     ),
//                                   ),
//
//                                   Expanded(
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(vertical: 12),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//
//                                           SizedBox(
//                                             width: Get.width / 2.5,
//                                             child: TextWidget(
//                                               "Carrot",
//                                               fontSize: 14,
//                                               fontWeight:
//                                               FontWeight.w700,
//                                               maxLines: 1,
//                                               textOverflow: TextOverflow.ellipsis,
//                                             ),
//                                           ),
//
//                                           AppSize.size.h5,
//
//                                           SizedBox(
//                                             width:
//                                             Get.width / 2.5,
//                                             child: TextWidget(
//                                               "கேரட்",
//                                               fontSize: 13,
//                                               fontWeight:
//                                               FontWeight.w500,
//                                               maxLines: 1,
//                                               textOverflow:
//                                               TextOverflow
//                                                   .ellipsis,
//                                             ),
//                                           ),
//
//                                           TextWidget(
//                                             "250 grams",
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w600,
//                                             color: AppColors.black.withOpacity(0.5),
//                                           ),
//
//                                           Spacer(),
//
//                                           Container(
//                                             padding: EdgeInsets.only(left: 6.0,right: 6.0,top: 5.0,bottom: 5.0),
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(25.0),
//                                               color: AppColors.primaryColor,
//                                             ),
//                                             child: TextWidget(
//                                              "Add to Cart",
//                                               fontSize: 12,
//                                               color: AppColors.white,
//                                               fontWeight:
//                                               FontWeight.w500,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//
//
//                                   Expanded(
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(vertical: 12),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//
//                                           TextWidget(
//                                             "out of stock",
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w600,
//                                             maxLines: 1,
//                                             color: Colors.red,
//                                             textOverflow: TextOverflow.ellipsis,
//                                           ),
//
//                                           AppSize.size.h5,
//
//                                           TextWidget(
//                                             "₹32",
//                                             fontSize: 16,
//                                             fontWeight:
//                                             FontWeight.w600,
//                                             maxLines: 1,
//                                             textOverflow:
//                                             TextOverflow
//                                                 .ellipsis,
//                                           ),
//
//                                           Padding(padding: EdgeInsets.only(top: 2.0)),
//
//                                           TextWidget(
//                                             "₹35.00",
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w500,
//                                             decoration: TextDecoration.lineThrough,
//                                           ),
//
//                                           Spacer(),
//
//                                           Container(
//                                             padding: EdgeInsets.only(left: 6.0,right: 6.0,top: 5.0,bottom: 5.0),
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(25.0),
//                                               color: Colors.amber,
//                                             ),
//                                             child: TextWidget(
//                                               "Remove",
//                                               fontSize: 12,
//                                               color: AppColors.white,
//                                               fontWeight:
//                                               FontWeight.w500,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) {
//                           return Divider(
//                             color: Color(0xffE5E5E5),
//                             thickness: 1,
//                           );
//                         },
//                         itemCount:10,
//                        // itemCount: controller.products.value.length
//                     ),
//                   ),
//                 ),
//               )
