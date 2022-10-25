import 'package:family_garden/routes/app_pages.dart';
import 'package:family_garden/screens/profile_screen/controllers/profile_controller.dart';
import 'package:family_garden/widgets/custom_textfield.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';

class ProfileView extends GetView<ProfileController> {
  var controller = Get.put(ProfileController());

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
          appbar_title: 'Profile',
          center_title: true,
          leading_image: "Add",
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            height: Get.height - 140,
            width: Get.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    caption: 'Name *',
                    hasCaption: true,
                    fontSize: 12,
                    controller: controller.nameController,
                    hint: '',
                    readOnly: false,
                  ),
                  AppSize.size.h30,
                  CustomTextField(
                    caption: 'Email',
                    hasCaption: true,
                    fontSize: 12,
                    controller: controller.emailController,
                    hint: '',
                    readOnly: false,
                  ),
                  AppSize.size.h30,
                  CustomTextField(
                    caption: 'Address *',
                    hasCaption: true,
                    fontSize: 12,
                    controller: controller.addressController,
                    hint: '',
                    readOnly: false,
                  ),
                  AppSize.size.h30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: CustomTextField(
                          caption: 'City',
                          hasCaption: true,
                          fontSize: 12,
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
                          fontSize: 12,
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
                          fontSize: 12,
                          controller: controller.pinCodeController,
                          hint: '',
                          readOnly: false,
                        ),
                      ),
                    ],
                  ),
                  AppSize.size.h30,
                  AppSize.size.h30,

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
                            'Update',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          )),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
