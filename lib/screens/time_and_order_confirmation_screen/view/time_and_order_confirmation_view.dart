import 'package:family_garden/screens/time_and_order_confirmation_screen/controller/time_and_order_confirmation_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter_svg/svg.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';

class TimeAndOrderConfirmationView
    extends GetView<TimeAndOrderConfirmationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
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
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/BackIcon.svg',
                        height: 24,
                        width: 24,
                      )),
                )
              ],
            ),
          ),
          font_size: 19,
          appbar_title: 'Time & Order Confirmation',
          center_title: true,
        ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSize.size.h15,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Choose Your Convenient Time Slot for Delivery",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                          AppSize.size.h15,
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: AppColors.orange,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "15/12/22",
                                      style: TextStyle(
                                          color: AppColors.white, fontSize: 12),
                                    ),
                                    Text(
                                      "Today",
                                      style: TextStyle(
                                          color: AppColors.white, fontSize: 8),
                                    )
                                  ],
                                ),
                              ),
                              AppSize.size.w15,
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.grey, width: 1)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "16/12/22",
                                      style: TextStyle(
                                          color: AppColors.black, fontSize: 12),
                                    ),
                                    Text(
                                      "Tommorow",
                                      style: TextStyle(
                                          color: AppColors.black, fontSize: 8),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                      // Expanded(child: Container()),
                      Container(
                        height: 85,
                        // color: Colors.white,
                        width: 64,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            SizedBox(
                                height: 64,
                                width: 64,
                                child:
                                    SvgPicture.asset("assets/icons/clock.svg"))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ListView.separated(
                  itemCount: controller.inBetweenTime.value.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Obx(
                      ()=> Container(
                        height: 30,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: controller.inBetweenTimeValid.value[index]?AppColors.slightGreyBackground.withOpacity(0.3):AppColors.white,
                            border: Border.all(width: 1, color: AppColors.slightGreyBorder),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppSize.size.w15,
                            SizedBox(
                                height: 14,
                                width: 14,
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  child: Checkbox(
                                      value:
                                          controller.inBetweenTimeValid.value[index],
                                      activeColor: AppColors.primaryColor,
                                      checkColor: AppColors.white,
                                      onChanged: (bool? value) {
                                        controller.inBetweenTimeValid.value[index] =
                                            value;
                                        // controller.update();
                                        controller.inBetweenTimeValid.refresh();
                                      }),
                                ),
                            ),
                            AppSize.size.w20,
                            Text(controller.inBetweenTime.value[index]),
                            Spacer(),
                            controller.inBetweenTimeValid.value[index] ?Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text ("Sold Out",style: TextStyle(fontSize: 8),),
                            ):Container()
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return AppSize.size.h15;
                  },
                ),
                AppSize.size.h40,
                const Text(
                  "Order Details",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                AppSize.size.h20,
                Column(
                  children: [
                    Container(
                      height: 45,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: AppColors.slightGrey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppSize.size.w15,
                          Expanded(
                              child: Text(
                            "Product",
                            style:
                                TextStyle(fontSize: 11, color: AppColors.white),
                          )),
                          Container(
                            width: 60,
                            child: Text(
                              "Category",
                              style: TextStyle(
                                  fontSize: 11, color: AppColors.white),
                            ),
                          ),
                          AppSize.size.w20,
                          Container(
                            width: 19,
                            child: Text(
                              "Qty",
                              style: TextStyle(
                                  fontSize: 11, color: AppColors.white),
                            ),
                          ),
                          AppSize.size.w20,
                          Container(
                            width: 50,
                            child: Text(
                              "Price",
                              style: TextStyle(
                                  fontSize: 11, color: AppColors.white),
                            ),
                          ),
                          AppSize.size.w20
                        ],
                      ),
                    ),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              // height: 100,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0.5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // AppSize.size.w15,
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Obx(
                                        () => Checkbox(
                                          checkColor: Colors.white,
                                          fillColor: MaterialStateProperty.all(
                                              AppColors.primaryColor),
                                          value: controller.boolList.value[index],
                                          shape: CircleBorder(),
                                          onChanged: (bool? value) {
                                            print(value);
                                            controller.boolList.value[index] =
                                                value!;
                                            controller.boolList.refresh();
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        // height: 100,
                                        child: Text(
                                          controller.products.value[index],
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: 11,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ],
                                  )),
                                  Container(
                                    width: 60,
                                    child: Text(
                                      controller.category.value[index],
                                      style: TextStyle(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                  AppSize.size.w20,
                                  Container(
                                    width: 15,
                                    child: Text(
                                      controller.qty[index],
                                      style: TextStyle(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                  AppSize.size.w20,
                                  Container(
                                    width: 50,
                                    child: Text(
                                      controller.price.value[index],
                                      style: TextStyle(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                  AppSize.size.w20
                                ],
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: AppColors.dividerColor,
                        );
                      },
                      itemCount: controller.products.value.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                    ),
                    Divider(
                      color: AppColors.dividerColor,
                    ),
                    AppSize.size.h10,
                    SizedBox(
                      height: 41,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 21.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sub-Total",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 50,
                              child: Text(
                                controller.subTotal.value,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                            AppSize.size.w20
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 41,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 21.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Flat Shipping Rate",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 50,
                              child: Text(
                                controller.flatShippingRate.value,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                            AppSize.size.w20
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 41,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 21.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Coupon",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 50,
                              child: Text(
                                controller.couponRate.value,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ),
                            AppSize.size.w20
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 41,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 21.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Grand Total  ",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 75,
                              child: Text(
                                controller.couponRate.value,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                            AppSize.size.w20
                          ],
                        ),
                      ),
                    ),
                    AppSize.size.h40,
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DASHBOARD);
                      },
                      child: Container(
                        height: 49,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(13)),
                        child: Center(
                          child: Text(
                            "Re Order",
                            style:
                                TextStyle(fontSize: 15, color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    AppSize.size.h55,
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
