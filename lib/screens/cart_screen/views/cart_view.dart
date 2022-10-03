import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../utils/common_import/common_import.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'My Cart',
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            textOverflow: TextOverflow.ellipsis,
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 0, bottom: 5),
                child: Image.asset(
                  "assets/icons/delete.png",
                  height: 20,
                  width: 18,
                  fit: BoxFit.contain,
                ),
              ),
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
          child: Column(
            children: [
              AppSize.size.h20,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 45,
                  child: TextFormField(
                    controller: controller.search,
                    maxLines: 1,
                    style: TextStyle(color: Color(0xff000000),fontSize: 15,
                        fontWeight: FontWeight.w400),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      prefixIcon:
                          ImageIcon(AssetImage('assets/icons/search.png')),
                      hintText: "Search for vegetables and fruits",
                      contentPadding: EdgeInsets.symmetric(vertical: 4),
                      hintStyle: TextStyle(
                          color: Color(0xff464646),
                          fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Color(0xfff1f1f1),
                      filled: true,
                    ),
                  ),
                ),
              ),
              AppSize.size.h20,
              TextWidget(
                'Orders',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              AppSize.size.h10,
              GetBuilder<CartController>(
                builder: (cart) => Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: 30,top: 10),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: Get.width,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, top: 10),
                                                child: SizedBox(
                                                  height: 13,
                                                  width: 13,
                                                  child: Checkbox(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.0),
                                                    ),
                                                    side: MaterialStateBorderSide
                                                        .resolveWith(
                                                      (states) => BorderSide(
                                                          width: 0.75,
                                                          color:
                                                              Color(0xffC0BEBE)),
                                                    ),
                                                    activeColor:
                                                        AppColors.primaryColor,
                                                    value: cart
                                                        .checkBoxBoolList[index],
                                                    onChanged: (value) {
                                                      controller.onCheckBoxClick(
                                                          value, index);
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Container(
                                                  height: 80,
                                                  width: 90,
                                                  child: Image.asset(
                                                    cart.cartList[index]['image'],
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          AppSize.size.w10,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  constraints: BoxConstraints(
                                                      maxWidth: Get.width / 2.5),
                                                  child: TextWidget(
                                                    cart.cartList[index]['name'],
                                                    fontSize: 14.5,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  )),
                                              AppSize.size.h5,
                                              TextWidget(
                                                cart.cartList[index]
                                                    ['nameInTamil'],
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                              AppSize.size.h5,
                                              TextWidget(
                                                  cart.cartList[index]['grams'],
                                                  fontSize: 10.5,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff666666)),
                                            ],
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                TextWidget(
                                                  cart.cartList[index]['price'],
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                                TextWidget(
                                                  cart.cartList[index]
                                                      ['oldPrice'],
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                  decoration:
                                                      TextDecoration.lineThrough,
                                                ),
                                                TextWidget(
                                                  cart.cartList[index]['offer'],
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xffFF8A00),
                                                ),
                                                AppSize.size.h10,
                                                Container(
                                                    height: 26,
                                                    width: 71,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      // border: Border.all(),

                                                      boxShadow: [
                                                        BoxShadow(
                                                          offset: Offset(0, 0),
                                                          blurRadius: 3,
                                                          spreadRadius: 3,
                                                          color: Color(0xff000000)
                                                              .withOpacity(0.2),
                                                        )
                                                      ],
                                                      color: Colors.white,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            cart.minus(index);
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Image.asset(
                                                                "assets/icons/minus.png"),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        TextWidget(
                                                          cart.counterList[index]
                                                              .toString(),
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        Spacer(),
                                                        GestureDetector(
                                                          onTap: () {
                                                            cart.add(index);
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Image.asset(
                                                                "assets/icons/add.png"),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      AppSize.size.h15,
                                      Divider(
                                        color: Color(0xffE5E5E5),
                                        height: 0.75,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 0,
                              );
                            },
                            itemCount: cart.cartList.length),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Color(0xffE5E5E5),
                height: 0.75,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Row(
                  children: [
                    SizedBox(
                      height: 33,
                      width: 82,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: TextWidget(
                          'Checkout',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            )),
                      ),
                    ),
                    AppSize.size.w10,
                    Container(
                      height: 23,
                      width: 136,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Color(0xffD6D6D6))),
                      child: TextFormField(
                        controller: controller.cuponCode,
                        maxLines: 1,
                        onChanged: (value) {},
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 9.5,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          hintText: "Cupon Code",
                          contentPadding: EdgeInsets.only(left: 8, right: 5),
                          suffixIcon: SizedBox(
                            height: 23,
                            width: 49,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: TextWidget(
                                'Apply',
                                fontSize: 9.5,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  )),
                            ),
                          ),
                          hintStyle: TextStyle(
                              color: Color(0xff999999),
                              fontSize: 9.5,
                              fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(6)),
                          fillColor: Color(0xffffffff),
                          filled: true,
                        ),
                      ),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Total: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff141414)),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '₹172',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000)),
                                )
                              ]),
                        ),
                        TextWidget(
                          'Saved: ₹43',
                          fontSize: 10.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4A8D30),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
