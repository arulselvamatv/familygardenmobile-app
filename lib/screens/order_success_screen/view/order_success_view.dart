import 'package:family_garden/screens/order_success_screen/controller/order_success_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter_svg/svg.dart';

import '../../../routes/app_pages.dart';

class OrderSuccessView extends GetView<OrderSuccessController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.DASHBOARD);
        return true;
      },
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(color: AppColors.bgColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 210,
                width: 210,
                child: SvgPicture.asset("assets/images/successCart.svg"),
              ),
              AppSize.size.h30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    'Order Placed !',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                  AppSize.size.w10,
                  SvgPicture.asset("assets/images/Emoji.svg",height: 24,
                    width: 24,fit: BoxFit.scaleDown,)
                ],
              ),
              AppSize.size.h15,
              TextWidget(
                "Your Order was placed Successfully. \n More Details Check your Orders History",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
                textAlign: TextAlign.center,
              ),
              AppSize.size.h15,
              Obx(
                () => TextWidget(
                  "- Order No : ${controller.orderId.value} -",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  textAlign: TextAlign.center,
                ),
              ),
              AppSize.size.h20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 50,
                  width: Get.width,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.ORDER_HISTORY_SCREEN);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFF8A00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      child: TextWidget(
                        'Track My Orders',
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      )),
                ),
              ),
              AppSize.size.h15,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: SizedBox(
                    height: 50,
                    width: Get.width,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.DASHBOARD);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bgColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13))),
                        child: TextWidget(
                          'Purchase More',
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
