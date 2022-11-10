import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/common_appbar/custom_appbar_view.dart';
import 'package:family_garden/widgets/loading_widget.dart';

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
                                            ": #${controller.orderInfo["orders"][0]["order_id"]}"),
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
                                            ": ${controller.orderInfo["orders"][0]["date_added"]}"),
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
                          )
                        ],
                      ),
                    )),
        ));
  }
}
