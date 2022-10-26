import 'package:family_garden/screens/payments_screen/controller/payment_controller.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';

class PaymentView extends GetView<PaymentController> {
  @override
  var controller = Get.put(PaymentController());
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
                      child: Image.asset(
                        'assets/icons/backButton.png',
                        height: 24,
                        width: 24,
                      )),
                )
              ],
            ),
          ),
          font_size: 19,
          appbar_title: 'Payments',
          center_title: true,
          leading_image: "Add",
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
        child: Obx(() => controller.isPaymentScreenLoader.value
            ? controller.isCartEmpty.value
                ? Center(
                    child: Text("Add Product to continue"),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppSize.size.h20,
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: Container(
                            height: 42,
                            width: Get.size.width,
                            decoration: BoxDecoration(
                                color: AppColors.limeGreen,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(13, 8, 16, 10),
                                child: Container(
                                    width: Get.size.width / 1.50,
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Congratulations You Saved ",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.black)),
                                        TextSpan(
                                            text: "Rs. ${controller.savedPrice.value}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.black)),
                                      ]),
                                      maxLines: 1,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        AppSize.size.h40,
                        Padding(
                          padding: const EdgeInsets.only(left: 17.0),
                          child: Text(
                            "Choose Payment Option",
                            style: TextStyle(
                                fontSize: 14.5, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: Get.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 19.0, top: 30),
                                child: SizedBox(
                                  height: 24.0,
                                  width: 24.0,
                                  child: Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => BorderSide(
                                          width: 0.75,
                                          color: Color(0xffC0BEBE)),
                                    ),
                                    activeColor: AppColors.primaryColor,
                                    value: controller.isCCavenueSelected.value,
                                    onChanged: (value) {
                                      controller.onCheckBoxClickCCAvenue(value);
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: SizedBox(
                                  height: 100,
                                  width: Get.width / 1.4,
                                  child: Html(
                                    data: controller
                                            .paymentMethod["payment_methods"]
                                        ["ccavenuepay"]["title"],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                            height: 71,
                            width: Get.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 19.0, top: 28),
                                  child: SizedBox(
                                    height: 24.0,
                                    width: 24.0,
                                    child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => BorderSide(
                                            width: 0.75,
                                            color: Color(0xffC0BEBE)),
                                      ),
                                      activeColor: AppColors.primaryColor,
                                      value: controller.isCODselected.value,
                                      onChanged: (value) {
                                        controller.onCheckBoxClickCOD(value);
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, top: 32.0),
                                  child: SizedBox(
                                    height: 61,
                                    width: Get.width / 1.4,
                                    child: Text((controller.paymentMethod[
                                                "payment_methods"]["cod"]
                                            ["title"] ??
                                        "")),
                                  ),
                                )
                              ],
                            )),
                        SizedBox(
                          height: 34,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 21.0),
                          child: Text(
                            "Order Note (Optional)",
                            style: TextStyle(
                                fontSize: 14.5, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24.0, 21, 28, 0),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 115,
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Icon(Icons.short_text_sharp))
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 93.5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 23.0, right: 23),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Price Details",
                                      style: TextStyle(
                                          fontSize: 14.5,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Price(1 item)",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.opacityGrey),
                                        ),
                                        Text("Rs. ${controller.actulPrice}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.opacityGrey))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Delivery Charges",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.opacityGrey),
                                        ),
                                        Text("${controller.deliveryCharges}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.opacityGrey))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 23.0, right: 23),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Amount Payable",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black),
                                  ),
                                  Text("Rs. ${controller.payableAmount}",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 26,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: SizedBox(
                                    height: 50,
                                    width: Get.width / 2.5,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          // controller.deliverHereBtn(context);
                                          // controller.onPressAddBtn();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: AppColors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(13),
                                                side: BorderSide(
                                                    color: AppColors
                                                        .primaryColor))),
                                        child: TextWidget(
                                          'Purcharse More',
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: SizedBox(
                                    height: 50,
                                    width: Get.width / 2.7,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          controller.continueBtn(context);
                                          // controller.onPressAddBtn();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: AppColors.primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(13))),
                                        child: TextWidget(
                                          'Continue',
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        )
                      ],
                    ),
                  )
            : Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
