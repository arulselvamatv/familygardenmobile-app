import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/network/set_local_datas.dart';
import 'package:family_garden/screens/manage_address_screen/controller/manage_address_controller.dart';
import 'package:family_garden/widgets/LoginWidget/pop_up_notification_view.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';

class ManageAddressView extends GetView<ManageAddressController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
            appbar_title: 'Manage Address',
            center_title: true,
            leading_image: "Add",
            appBarActions: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.ADDADDRESS)
                    ?.then((value) => controller.getAccountAddresses());
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
                            GetBuilder<ManageAddressController>(
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
                                        physics:
                                            NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: controller.addresses
                                                .value.addresses?.length ??
                                            0,
                                        padding: EdgeInsets.only(
                                            bottom: 30, top: 10),
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                width: Get.width,
                                                child: Container(
                                                  height: 150,
                                                  width: Get.width,
                                                  color: Colors.white,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets
                                                                .only(
                                                            left: 16.0,
                                                            top: 17),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  Get.width /
                                                                      2,
                                                              child: Html(
                                                                  data: controller
                                                                      .addresses
                                                                      .value
                                                                      .addresses?[
                                                                          index]
                                                                      .address,
                                                                  shrinkWrap:
                                                                      true),
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              width: 100,
                                                              child: Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap:
                                                                        () {
                                                                      Get.toNamed(Routes.ADDADDRESS, arguments: controller.addresses.value.addresses?[index].addressId)?.then((value) =>
                                                                          controller.getAccountAddresses());
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40,
                                                                      width:
                                                                          40,
                                                                      child:
                                                                          SvgPicture.asset("assets/icons/edit_address.svg"),
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap:
                                                                        () async {
                                                                      print(controller
                                                                          .addresses
                                                                          .value
                                                                          .addresses?[index]
                                                                          .addressId);
                                                                      var res = await ApiHelper.deleteAddress((controller
                                                                          .addresses
                                                                          .value
                                                                          .addresses?[index]
                                                                          .addressId)!,false);
                                                                      print(
                                                                          res.responseCode);
                                                                      if (res.responseCode ==
                                                                          200) {
                                                                        controller.addresses.value.addresses?.removeAt(index);
                                                                        if ((controller.addresses.value.addresses?.isEmpty)!) {
                                                                          controller.isEmptyAddress.value = true;
                                                                        }
                                                                        controller.update();
                                                                        controller.addresses.refresh();
                                                                      }
                                                                    },
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          25,
                                                                      width:
                                                                          25,
                                                                      child:
                                                                          SvgPicture.asset(
                                                                        "assets/icons/delete_address.svg",
                                                                        height:
                                                                            25,
                                                                        width:
                                                                            25,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Divider()
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20),
                              child: SizedBox(
                                height: 50,
                                width: Get.width,
                                child: ElevatedButton(
                                    onPressed: () {
                                      controller.addAddressBtn(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(13))),
                                    child: TextWidget(
                                      'Add Address',
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
                  : Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}
