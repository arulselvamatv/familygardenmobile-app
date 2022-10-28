import 'package:family_garden/routes/app_pages.dart';
import 'package:family_garden/widgets/loading_widget.dart';

import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../../../widgets/custom_textfield.dart';
import '../controllers/order_history_screen_controller.dart';

class OrderHistoryView extends GetView<OrderHistoryScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryScreenController>(
      builder: (s) => Scaffold(
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
          body: Container(
            decoration: const BoxDecoration(
                color: Color(0xffF3F3F3),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            child: controller.isProductLoader.value
                ? Center(
                    child: Loading(),
                  )
                : s.orders.length == 0
                    ? Container(
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset('assets/images/no_order1.png')
                            ],
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 10, right: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Container(
                                        height: 45,
                                        child: TextFormField(
                                          controller: controller.search,
                                          maxLines: 1,
                                          onChanged: (value) {},
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                          decoration: InputDecoration(
                                            prefixIcon: ImageIcon(AssetImage(
                                                'assets/icons/search.png')),
                                            hintText: "Search orders",
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 4),
                                            hintStyle: TextStyle(
                                                color: Color(0xff464646),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            fillColor: AppColors.lightGrey,
                                            filled: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      TextWidget(
                                        'Filter',
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Icon(
                                          Icons.filter_list,
                                          size: 15,
                                          color: AppColors.black,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            ListView.separated(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                primary: false,
                                padding: EdgeInsets.only(bottom: 30),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.ORDER_DETAIL,
                                          arguments:
                                              controller.orders[index].orderId);
                                      controller.update();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 14,
                                          bottom: 12,
                                          top: 29,
                                          right: 14),
                                      height: 130,
                                      width: Get.width,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: SizedBox(
                                                height: 90,
                                                width: 90,
                                                child: Image.asset(
                                                  controller.staticImage.value,
                                                  fit: BoxFit.fill,
                                                )),
                                          ),

                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0)),

                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: Get.width / 2.5,
                                                  child: Row(
                                                    children: [
                                                      TextWidget(
                                                        "Order id : ",
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        maxLines: 1,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                      ),
                                                      TextWidget(
                                                        "#" +
                                                            controller
                                                                .orders[index]
                                                                .orderId
                                                                .toString(),
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        maxLines: 1,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                AppSize.size.h5,
                                                SizedBox(
                                                  width: Get.width / 2.5,
                                                  child: TextWidget(
                                                    controller.orders[index]
                                                        .dateAdded,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.black,
                                                    maxLines: 1,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                AppSize.size.h5,
                                                Row(
                                                  children: [
                                                    TextWidget(
                                                      "No of Products :",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.black,
                                                    ),
                                                    TextWidget(
                                                      controller.orders[index]
                                                          .products
                                                          .toString(),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors.black,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),

                                          // Padding(padding: EdgeInsets.only(left: 10.0)),

                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  controller
                                                      .orders[index].total,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  maxLines: 1,
                                                  color: AppColors.primaryColor,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                AppSize.size.h5,
                                                TextWidget(
                                                  "status:",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                AppSize.size.h5,
                                                TextWidget(
                                                  controller
                                                      .orders[index].status,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  maxLines: 1,
                                                  color: Colors.red,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),

                                          //   Padding(padding: EdgeInsets.only(left: 5.0)),

                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: CircleAvatar(
                                                    radius: 10,
                                                    backgroundColor:
                                                        AppColors.primaryColor,
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      size: 13,
                                                    ),
                                                  ),
                                                ),
                                                AppSize.size.h5,
                                                Center(
                                                  child: TextWidget(
                                                    "show more",
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w600,
                                                    maxLines: 1,
                                                    color: Colors.black,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: AppColors.lightGrey,
                                    height: 1,
                                  );
                                },
                                itemCount: controller.orders.length)
                          ],
                        ),
                      ),
          )),
    );
  }
}
