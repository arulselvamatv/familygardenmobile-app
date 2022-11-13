import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/network/set_local_datas.dart';
import 'package:family_garden/routes/app_pages.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/LoginWidget/pop_up_notification_view.dart';
import 'package:family_garden/widgets/common_appbar/custom_appbar_view.dart';
import 'package:family_garden/widgets/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  const OrderDetailView({Key? key}) : super(key: key);

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
            appbar_title: "Order History",
            center_title: true,
            leading_image: "Add",
          ),
        ),
        body: Obx(
          () => Stack(
            children:
            [
              Container(
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
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
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 30, 10, 1),
                                child: Row(children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: 75, child: Text("OrderID")),
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
                                                width: 75, child: Text("Dated")),
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
                                      fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                              ),
                              AppSize.size.h10,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
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
                                            width: 50,
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
                                            width: 28,
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
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          // height: 100,
                                          width: Get.width,
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
                                                      checkColor: Colors.white,
                                                      fillColor:
                                                          MaterialStateProperty.all(
                                                              Colors.orange),
                                                      value: controller
                                                          .isChecked.value,
                                                      shape: CircleBorder(),
                                                      onChanged: (bool? value) {
                                                        print(value);
                                                        controller.isChecked.value =
                                                            value!;
                                                        controller.update();
                                                      },
                                                    ),
                                                  ),
                                                  Flexible(
                                                    // height: 100,
                                                    child: Text(
                                                      controller
                                                              .orderInfo
                                                              .value
                                                              .products?[index]
                                                              .name ??
                                                          "",
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                              Container(
                                                width: 50,
                                                child: Text(
                                                  "Category",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ),
                                              AppSize.size.w20,
                                              Container(
                                                width: 19,
                                                child: Text(
                                                  "Qty",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ),
                                              AppSize.size.w20,
                                              Container(
                                                width: 28,
                                                child: Text(
                                                  "Price",
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
                                        return SizedBox();
                                      },
                                      itemCount: controller
                                              .orderInfo.value.products?.length ??
                                          0,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),

              ValueListenableBuilder<bool>(
                valueListenable: controller.showAppNotificationNotifierInitial,
                builder: (context, value, child)
                {
                  print("HomeBooksView :: showAppNotificationNotifier $value :: ${MediaQuery.of(context).size}");
                  return AnimatedPositioned(
                    top: value ? 0 : - Get.width - 1000,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInCubic,
                    child: PopUpNotificationView(
                      onClosePressed: ()
                      async {
                        print(ApiConstants.jwtToken);
                        var prefs = await SharedPreferences.getInstance();
                        prefs.clear();
                        var response = await ApiHelper.getToken();
                        if (response.data?.apiToken != null)
                        {
                          SetLocalDatas.setToken((response.data?.apiToken)!);
                          print(ApiConstants.jwtToken);
                          Navigator.pop(context);
                          Get.offAndToNamed(Routes.LOGIN_VIEW);
                          Get.toNamed(Routes.LOGIN_VIEW);
                        }
                      },
                    ),
                  );
                },
              ),

            ],
          ),
        ));
  }
}
