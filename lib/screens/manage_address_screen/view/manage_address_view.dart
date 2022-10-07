import 'package:family_garden/screens/manage_address_screen/controller/manage_address_controller.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../../../widgets/custom_textfield.dart';

class ManageAddressView extends GetView<ManageAddressController> {
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
          appbar_title: 'Manage Address',
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
        child: Column(
          children: [
            GetBuilder<ManageAddressController>(
              builder: (value) => Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.addressList.value.length,
                      padding: EdgeInsets.only(bottom: 30, top: 10),
                      itemBuilder: (context, index) {
                        return Container(
                          width: Get.width,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.addressSelector(index);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: new BoxDecoration(
                                              color:
                                                  controller.selectedAddress ==
                                                          index
                                                      ? AppColors.primaryColor
                                                      : AppColors.lightGrey,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text("${1 + index}"),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          controller.addressList[index],
                                          style: TextStyle(fontSize: 11.5),
                                        ),
                                      ],
                                    ),
                                    controller.selectedAddress == index
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Icon(
                                              Icons.check,
                                              color: AppColors.primaryColor,
                                              size: 20,
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                color: Color(0xffE5E5E5),
                                height: 4,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 0,
                        );
                      },
                    ),
                  ],
                ),
              )),
            ),
            CustomTextField(
              caption: 'Address *',
              hasCaption: true,
              controller: controller.addressController,
              hint: '',
              readOnly: false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: CustomTextField(
                    caption: 'City',
                    hasCaption: true,
                    readOnly: true,
                    controller: controller.cityController,
                    hint: '',
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CustomTextField(
                    caption: 'State',
                    hasCaption: true,
                    readOnly: true,
                    controller: controller.stateController,
                    hint: '',
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CustomTextField(
                    caption: 'Pin Code',
                    hasCaption: true,
                    maxline: 1,
                    controller: controller.pinCodeController,
                    hint: '',
                    readOnly: false,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 50,
                width: Get.width,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13))),
                    child: TextWidget(
                      'Add',
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    )),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
