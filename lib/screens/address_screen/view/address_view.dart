import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../controller/address_controller.dart';

class AddressView extends GetView<AddressController> {
  @override
  var controller = Get.put(AddressController());

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
          appbar_title: 'Address',
          center_title: true,
          leading_image: "Add",
          appBarActions: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.ADDADDRESS)
                  ?.then((value) => controller.getCheckout());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 15),
              child: Image.asset(
                "assets/icons/plus.png",
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              )),
          child: controller.isLoader.value
              ? controller.isaddressScreenLoader.value
                  ? controller.isEmptyAddress.value
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Text("Add Address to continue"),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            GetBuilder<AddressController>(
                              builder: (value) => Expanded(
                                  child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Color(0xffFFFFFF),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            topLeft: Radius.circular(30),
                                          )),
                                      child: ListView.separated(
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: controller.addressModel.value
                                                .addresses?.length ??
                                            0,
                                        padding: EdgeInsets.only(
                                            bottom: 30, top: 10),
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Container(
                                                width: Get.width,
                                                child: Container(
                                                  height: 139,
                                                  color: Colors.white,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 19.0,
                                                                top: 16),
                                                        child: SizedBox(
                                                          height: 24.0,
                                                          width: 24.0,
                                                          child: Checkbox(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.0),
                                                            ),
                                                            side:
                                                                MaterialStateBorderSide
                                                                    .resolveWith(
                                                              (states) => BorderSide(
                                                                  width: 0.75,
                                                                  color: Color(
                                                                      0xffC0BEBE)),
                                                            ),
                                                            activeColor: AppColors
                                                                .primaryColor,
                                                            value: controller
                                                                .checkBoxBoolList
                                                                .value[index],
                                                            onChanged: (value) {
                                                              controller
                                                                  .onCheckBoxClick(
                                                                      value,
                                                                      index);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 16.0,
                                                                top: 17),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  controller
                                                                          .addressModel
                                                                          .value
                                                                          .addresses?[
                                                                              index]
                                                                          .firstname ??
                                                                      "",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                SizedBox(
                                                                  width: 13,
                                                                ),
                                                                Container(
                                                                  height: 16,
                                                                  width: 45,
                                                                  decoration: BoxDecoration(
                                                                      color: AppColors
                                                                          .silver,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Home",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              8,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              width: 175,
                                                              child: Text(
                                                                '${controller.addressModel.value.addresses?[index].address_1 ?? ""}, ${controller.addressModel.value.addresses?[index].address_2 ?? ""}',
                                                                maxLines: 3,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 17,
                                                            ),
                                                            Text(controller
                                                                    .addressModel
                                                                    .value
                                                                    .addresses?[
                                                                        index]
                                                                    .telephone ??
                                                                ""),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Divider(),
                                              Visibility(
                                                  visible: (controller
                                                              .addressModel
                                                              .value
                                                              .addresses
                                                              ?.length)! -
                                                          1 ==
                                                      index,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                              Routes.ADDADDRESS)
                                                          ?.then((value) =>
                                                              controller
                                                                  .getCheckout());
                                                    },
                                                    child: Container(
                                                      height: 48,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 24.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              Icons.add,
                                                              size: 32,
                                                            ),
                                                            SizedBox(
                                                              width: 21,
                                                            ),
                                                            Text(
                                                              "Add New Address",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: 0,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ),
                            Container(
                              height: 20,
                              width: Get.width,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                height: 50,
                                width: Get.width,
                                child: ElevatedButton(
                                    onPressed: () {
                                      controller.deliverHereBtn(context);
                                      // controller.onPressAddBtn();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(13))),
                                    child: TextWidget(
                                      'Deliver Here',
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        )
                  : Center(child: CircularProgressIndicator())
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
