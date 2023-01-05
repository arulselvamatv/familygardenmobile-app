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
      body:Obx(
        ()=> Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              )),
          child: !controller.isLoading.value? Center(child: CircularProgressIndicator(),):Padding(
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
                                GestureDetector(
                                  onTap: (){
                                    controller.selectedDays.value[0] = true;
                                    controller.selectedDays.value[1] = false;
                                    controller.availableBoolList.value =[];
                                    for(var i= 0;i < controller.timeSlotDatas.value.timeSlots!.length;i++){
                                      controller.availableBoolList.add(false);
                                    }
                                    controller.update();
                                    controller.selectedDays.refresh();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color:controller.selectedDays[0]? AppColors.orange:AppColors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      border: controller.selectedDays.value[0]?Border.all(
                                          color: AppColors.orange, width: 1):Border.all(
                                          color: AppColors.grey, width: 1)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.today.value,
                                          style: TextStyle(
                                              color: controller.selectedDays[0]? AppColors.white:AppColors.black, fontSize: 12),
                                        ),
                                        Text(
                                          "Today",
                                          style: TextStyle(
                                              color: controller.selectedDays[0]? AppColors.white:AppColors.black, fontSize: 8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                AppSize.size.w15,
                                GestureDetector(
                                  onTap: (){
                                    controller.selectedDays.value[1] = true;
                                    controller.selectedDays.value[0] = false;
                                    controller.availableBoolList.value=[];
                                    for(var i= 0;i < controller.timeSlotDatas.value.timeSlots!.length;i++){
                                      controller.availableBoolList.add(false);
                                    }
                                    controller.update();
                                    controller.selectedDays.refresh();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color:controller.selectedDays[1]? AppColors.orange:AppColors.white,
                                        borderRadius:BorderRadius.circular(10),
                                        border: controller.selectedDays.value[1]?Border.all(
                                            color: AppColors.orange, width: 1):Border.all(
                                            color: AppColors.grey, width: 1)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.tommorow.value,
                                          style: TextStyle(
                                              color: controller.selectedDays[1]? AppColors.white:AppColors.black, fontSize: 12),
                                        ),
                                        Text(
                                          "Tommorow",
                                          style: TextStyle(
                                              color: controller.selectedDays[1]? AppColors.white:AppColors.black, fontSize: 8),
                                        )
                                      ],
                                    ),
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
                    itemCount: controller.timeSlotDatas.value.timeSlots?.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return IgnorePointer(
                          ignoring: controller.selectedDays.value[0] ? controller.currentTimeNumber.value > double.parse(controller.timeSlotDatas.value.timeSlots?[index].endTime ?? "0"):false,
                          child: GestureDetector(
                            onTap: (){
                              controller.timeSlotPicked(index);
                            },
                            child: Container(
                              height: 30,
                              width: Get.width,
                              decoration: BoxDecoration(
                                // color:controller.selectedDays.value[0] ?  controller.currentTimeNumber.value > double.parse(controller.timeSlotDatas.value.timeSlots?[index].endTime ?? "0")? controller.availableBoolList.value[index]?AppColors.slightGreyBackground.withOpacity(0.3):AppColors.white:AppColors.white:AppColors.white,
                                color:controller.selectedDays.value[0]?controller.currentTimeNumber.value > double.parse(controller.timeSlotDatas.value.timeSlots?[index].endTime ?? "0")?AppColors.slightGreyBackground:controller.availableBoolList.value[index]?AppColors.white:AppColors.white:controller.availableBoolList.value[index]?AppColors.white:AppColors.white,
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
                                                controller.availableBoolList.value[index],
                                            activeColor: AppColors.primaryColor,
                                            checkColor: AppColors.white,
                                            onChanged: (bool? value) {
                                              controller.timeSlotPicked(index);
                                              // controller.availableBoolList.value[index] =
                                              //     value;
                                              // controller.availableBoolList.refresh();
                                            }),
                                      ),
                                  ),
                                  AppSize.size.w20,
                                  Text("${controller.startTimeList[index]} - ${controller.endTimeList[index]}"),
                                  Spacer(),
                                  controller.selectedDays.value[0]?controller.currentTimeNumber.value > double.parse(controller.timeSlotDatas.value.timeSlots?[index].endTime ?? "0")?Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Text ("slot full",style: TextStyle(fontSize: 8),),
                                  ):controller.availableBoolList.value[index]?Container():Container():controller.availableBoolList.value[index]?Container():Container()
                                ],
                              ),
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
                        decoration: const BoxDecoration(
                          color: AppColors.slightGrey,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppSize.size.w15,
                            const Expanded(
                                child: Text(
                              "Product",
                              style:
                                  TextStyle(fontSize: 11, color: AppColors.white),
                            )),
                            Container(
                              width: 60,
                              child: const Text(
                                "Category",
                                style: TextStyle(
                                    fontSize: 11, color: AppColors.white),
                              ),
                            ),
                            AppSize.size.w20,
                            Container(
                              width: 19,
                              child: const Text(
                                "Qty",
                                style: TextStyle(
                                    fontSize: 11, color: AppColors.white),
                              ),
                            ),
                            AppSize.size.w20,
                            Container(
                              width: 50,
                              child: const Text(
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
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                // height: 100,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: AppColors.white.withOpacity(0.5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // AppSize.size.w15,
                                      Expanded(
                                          child:
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0,top: 10),
                                            child: Text (
                                              controller.cartData?.products?[index].name ?? "",
                                              maxLines: 3,
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  overflow: TextOverflow.ellipsis),
                                            ),
                                          ),
                                        ),
                                      SizedBox(
                                        width: 60,
                                        child: Text(
                                          controller.cartData?.products?[index].model ?? "",
                                          style: const TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                      AppSize.size.w20,
                                      Container(
                                        width: 15,
                                        child: Text(
                                          controller.cartData?.products?[index].quantity ?? "",
                                          style: const TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                      AppSize.size.w20,
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          controller.cartData?.products?[index].price ?? "",
                                          style: const TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                      AppSize.size.w20
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            color: AppColors.dividerColor,
                          );
                        },
                        itemCount: controller.cartData?.products?.length ?? 0,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                      ),
                      const Divider(
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
                              const Text(
                                "Sub-Total",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  controller.cartData?.subTotals?.value ?? "",
                                  style: const TextStyle(
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
                              const Text(
                                "Flat Shipping Rate",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  controller.cartData?.shipping?.value ?? "0.00",
                                  style: const TextStyle(
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
                                  controller.cartData?.coupon?.value ?? "0.00",
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
                                  controller.cartData?.totals?.value ?? "0.00",
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
                          controller.conitnueBtn(context);
                        },
                        child: Container(
                          height: 49,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(13)),
                          child: Center(
                            child: Text(
                              "Continue",
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
      ),
    );
  }
}
