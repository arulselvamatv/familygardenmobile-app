import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/network/set_local_datas.dart';
import 'package:family_garden/routes/app_pages.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/LoginWidget/pop_up_notification_view.dart';
import 'package:family_garden/widgets/common_appbar/custom_appbar_view.dart';
import 'package:family_garden/widgets/loading_widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  @override
  var controller = Get.put(OrderDetailController());

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
            appbar_title: "Order History",
            center_title: true,
            leading_image: "Add",
          ),
        ),
        body: Obx(
          () => Container(
              height: Get.height,
              decoration: const BoxDecoration(
                  color: Color(0xffF3F3F3),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: !controller.isLoaded.value
                  ? Center(
                      child: Loading(),
                    )
                  : SingleChildScrollView(
                      child: SingleChildScrollView(
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Order Summary",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 1),
                              child: Row(children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 150,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 75,
                                              child: Text("OrderID")),
                                          Text(
                                              ": #${controller.orderInfo.value.orderId}"),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 75,
                                              child: Text("Dated")),
                                          // Text("Dated"),
                                          Text(
                                              ": ${controller.orderInfo.value.dateAdded}"),
                                        ],
                                      ),
                                    )
                                    // Text(
                                    //     "OrderID : #${controller.orderInfo["orders"][0]["order_id"]}"),
                                    // Text(
                                    //     "Dated : ${controller.orderInfo["orders"][0]["date_added"]}"),
                                  ],
                                ),
                                Spacer(),
                                SizedBox(
                                    child: CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.grey.shade200,
                                  child: Image.asset(
                                    'assets/images/price-tag.png',
                                  ),
                                ))
                              ]),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.fromLTRB(10, 1, 10, 10),
                            //   child: Container(
                            //     padding: EdgeInsets.only(
                            //         left: 20.0,
                            //         right: 20.0,
                            //         top: 5.0,
                            //         bottom: 5.0),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(25.0),
                            //       color: AppColors.limeGreen,
                            //     ),
                            //     child: TextWidget(
                            //       "Download Invoice",
                            //       fontSize: 12,
                            //       color: AppColors.black,
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Divider(
                                color: AppColors.lightGrey,
                                thickness: 1.5,
                              ),
                            ),
                            AppSize.size.h20,
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Order Details',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            AppSize.size.h10,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 45,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        AppSize.size.w15,
                                        Expanded(
                                            child: Text(
                                          "Product",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: AppColors.white),
                                        )),
                                        Container(
                                          width: 60,
                                          child: Text(
                                            "Category",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: AppColors.white),
                                          ),
                                        ),
                                        AppSize.size.w20,
                                        Container(
                                          width: 19,
                                          child: Text(
                                            "Qty",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: AppColors.white),
                                          ),
                                        ),
                                        AppSize.size.w20,
                                        Container(
                                          width: 50,
                                          child: Text(
                                            "Price",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: AppColors.white),
                                          ),
                                        ),
                                        AppSize.size.w20
                                      ],
                                    ),
                                  ),
                                  ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        // height: 100,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                            color: AppColors.white
                                                .withOpacity(0.5)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // AppSize.size.w15,
                                            Expanded(
                                                child: Row(
                                              children: [
                                                Obx(
                                                  () => Checkbox(
                                                    checkColor:
                                                        Colors.white,
                                                    fillColor:
                                                        MaterialStateProperty
                                                            .all(AppColors
                                                                .primaryColor),
                                                    value: controller
                                                        .boolList
                                                        .value[index],
                                                    shape: CircleBorder(),
                                                    onChanged:
                                                        (bool? value) {
                                                      print(value);
                                                      controller.boolList
                                                              .value[
                                                          index] = value!;
                                                      controller.boolList
                                                          .refresh();
                                                    },
                                                  ),
                                                ),
                                                Flexible(
                                                  // height: 100,
                                                  child: Text(
                                                    controller
                                                            .orderInfo
                                                            .value
                                                            .products?[
                                                                index]
                                                            .name ??
                                                        "",
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        overflow:
                                                            TextOverflow
                                                                .ellipsis),
                                                  ),
                                                ),
                                                // controller
                                                //             .orderInfo
                                                //             .value
                                                //             .products
                                                //             ?.isNotEmpty ??
                                                //         false
                                                //     ? SizedBox(
                                                //         height: 10,
                                                //         width: 20,
                                                //         child: Text(controller
                                                //                 .orderInfo
                                                //                 .value
                                                //                 .products?[
                                                //                     index]
                                                //                 .option?[0]
                                                //                 .value ??
                                                //             ""),
                                                //       )
                                                //     : SizedBox(
                                                //         height: 10,
                                                //         width: 20,
                                                //         child: Text("")),
                                              ],
                                            )),
                                            Container(
                                              width: 60,
                                              child: Text(
                                                controller
                                                        .orderInfo
                                                        .value
                                                        .products?[index]
                                                        .model ??
                                                    "",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ),
                                            AppSize.size.w20,
                                            Container(
                                              width: 15,
                                              child: Text(
                                                controller
                                                        .orderInfo
                                                        .value
                                                        .products?[index]
                                                        .quantity ??
                                                    "",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ),
                                            AppSize.size.w20,
                                            Container(
                                              width: 50,
                                              child: Text(
                                                controller
                                                        .orderInfo
                                                        .value
                                                        .products?[index]
                                                        .total ??
                                                    "",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ),
                                            AppSize.size.w20
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Divider(
                                        color: AppColors.dividerColor,
                                      );
                                    },
                                    itemCount: controller.orderInfo.value
                                            .products?.length ??
                                        0,
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
                                      padding:
                                          const EdgeInsets.only(left: 21.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Sub-Total",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    FontWeight.w500),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            width: 50,
                                            child: Text(
                                              controller.orderInfo.value
                                                      .subTotals?.value ??
                                                  "0.00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w500),
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
                                      padding:
                                          const EdgeInsets.only(left: 21.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Flat Shipping Rate",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    FontWeight.w500),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            width: 50,
                                            child: Text(
                                              controller.orderInfo.value
                                                      .shipping?.value ??
                                                  "0.00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w500),
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
                                      padding:
                                          const EdgeInsets.only(left: 21.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Coupon",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    FontWeight.w500),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            width: 50,
                                            child: Text(
                                              controller.orderInfo.value
                                                      .coupon?.value ??
                                                  "0.00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.w500),
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
                                            bottomRight:
                                                Radius.circular(10))),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 21.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight:
                                                    FontWeight.w500),
                                          ),
                                          Spacer(),
                                          SizedBox(
                                            width: 50,
                                            child: Text(
                                              controller.orderInfo.value
                                                      .totals?.value ??
                                                  "0.00",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                          ),
                                          AppSize.size.w20
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            AppSize.size.h30,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0),
                              child: Html(
                                  data: controller
                                      .orderInfo.value.paymentAddress),
                            ),
                            AppSize.size.h30,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                    child: Text(
                                      "Payment Method",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  AppSize.size.h20,
                                  controller.orderInfo.value
                                              .paymentMethod ==
                                          "Cash On Delivery"
                                      ? Text(
                                          controller.orderInfo.value
                                                  .paymentMethod ??
                                              "",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        )
                                      : Image.asset("assets/images/ccavenue_pay_options.jpg"),
                                ],
                              ),
                            ),
                            AppSize.size.h16,
                            Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                    child: Text(
                                      "Shipping Method: ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  AppSize.size.h20,
                                  Text(
                                    controller.orderInfo.value
                                            .shippingMethod ??
                                        "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 22.0),
                            //   child: Text(
                            //     "Shipping Method: ${controller.orderInfo.value.shippingMethod ?? ""}",
                            //     style: TextStyle(
                            //         fontSize: 10,
                            //         fontWeight: FontWeight.w500),
                            //   ),
                            // ),
                            AppSize.size.h40,
                            Center(
                              child: Text(
                                "Order Journey",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 16.0),
                              child: SizedBox(
                                height: 75,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 26.37,
                                      width: 26.37,
                                      decoration: BoxDecoration(
                                          // color: AppColors.primaryColor,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.primaryColor,
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7.77,
                                            vertical: 8.05),
                                        child: Container(
                                          height: 10.55,
                                          width: 10.55,
                                          decoration: const BoxDecoration(
                                              color: AppColors.primaryColor,
                                              shape: BoxShape.circle),
                                        ),
                                      ),
                                    ),
                                    controller.orderInfo.value.histories?[0]
                                                .status !=
                                            "Completed"
                                        ? SizedBox(
                                            width: Get.width / 3,
                                            child: dashedHorizontalLine())
                                        : SizedBox(
                                            width: Get.width / 3,
                                          ),
                                    Container(
                                      height: 26.37,
                                      width: 26.37,
                                      decoration: BoxDecoration(
                                          // color: AppColors.primaryColor,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.primaryColor,
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7.77,
                                            vertical: 8.05),
                                        child: Container(
                                          height: 10.55,
                                          width: 10.55,
                                          decoration: const BoxDecoration(
                                              color: AppColors.primaryColor,
                                              shape: BoxShape.circle),
                                        ),
                                      ),
                                    ),
                                    controller.orderInfo.value.histories?[0]
                                                .status !=
                                            "Completed"
                                        ? SizedBox(
                                            width: Get.width / 3,
                                            child: dashedHorizontalLine())
                                        : SizedBox(
                                            width: Get.width / 3,
                                          ),
                                    Container(
                                      height: 26.37,
                                      width: 26.37,
                                      decoration: BoxDecoration(
                                          // color: AppColors.primaryColor,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.primaryColor,
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7.77,
                                            vertical: 8.05),
                                        child: Container(
                                          height: 10.55,
                                          width: 10.55,
                                          decoration: const BoxDecoration(
                                              color: AppColors.primaryColor,
                                              shape: BoxShape.circle),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0),
                              child: SizedBox(
                                height: 55,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // AppSize.size.w16,
                                    SizedBox(
                                      height: 35,
                                      width: 100,
                                      // width: ,
                                      // width: 26.37,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Order Successful",
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: 35,
                                        width: 100,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(controller
                                                  .orderInfo
                                                  .value
                                                  .histories!
                                                  .isNotEmpty
                                              ? (controller.orderInfo.value
                                                  .histories?[0].status) ?? ""
                                              : ""),
                                        )),

                                    SizedBox(
                                      height: 35,
                                      width: 100,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: (controller.orderInfo.value
                                                .histories?.length)! > 1
                                            ? Text(controller
                                                    .orderInfo
                                                    .value
                                                    .histories?[1]
                                                    .status ??
                                                "")
                                            : Text(""),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     Get.toNamed(Routes.DASHBOARD);
                            //   },
                            //   child: Padding(
                            //     padding: const EdgeInsets.symmetric(
                            //         horizontal: 14.0),
                            //     child: Container(
                            //       height: 50,
                            //       width: Get.width,
                            //       decoration: BoxDecoration(
                            //           color: AppColors.primaryColor,
                            //           borderRadius:
                            //               BorderRadius.circular(7)),
                            //       child: Center(
                            //         child: Text(
                            //           "Re Order",
                            //           style: TextStyle(
                            //               fontSize: 15,
                            //               color: AppColors.white),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            AppSize.size.h30,
                          ],
                        ),
                      ),
                    )),
        ));
  }

  Widget dashedHorizontalLine() {
    return Row(
      children: [
        for (int i = 0; i < 30; i++)
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.black,
                    thickness: 2,
                  ),
                ),
                Container(
                  width: 2,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
