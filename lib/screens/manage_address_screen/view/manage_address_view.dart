import 'package:family_garden/screens/manage_address_screen/controller/manage_address_controller.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../../../widgets/custom_textfield.dart';

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
            appbar_title: 'Manage Address',
            center_title: true,
            leading_image: "Add",
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
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: controller.addresses.value
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
                                                  height: 200,
                                                  width: Get.width,
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
                                                            Html(
                                                                data: controller
                                                                    .addresses
                                                                    .value
                                                                    .addresses?[
                                                                        index]
                                                                    .address,
                                                                shrinkWrap:
                                                                    true),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
