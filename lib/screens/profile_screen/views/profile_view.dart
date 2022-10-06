import 'package:family_garden/routes/app_pages.dart';
import 'package:family_garden/screens/manage_address_screen/view/manage_address_view.dart';
import 'package:family_garden/screens/profile_screen/controllers/profile_controller.dart';
import 'package:family_garden/widgets/custom_textfield.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../utils/common_import/common_import.dart';

class ProfileView extends GetView<ProfileController> {
  var controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
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
                    controller: controller.nameController,
                    hint: '',
                    readOnly: false,
                  ),
                  CustomTextField(
                    caption: 'Email',
                    hasCaption: true,
                    controller: controller.emailController,
                    hint: '',
                    readOnly: false,
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
                            'Update',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          )),
                    ),
                  ),
                  Spacer(),
                  Divider(
                    color: Color(0xffE5E5E5),
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.MANAGE_ADDRESS_SCREEN);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Container(
                              height: 15,
                              width: 12,
                              child: Image.asset(
                                'assets/icons/address book.png',
                                fit: BoxFit.fill,
                              )),
                        ),
                        AppSize.size.w7,
                        TextWidget(
                          'Manage Address',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff282828),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xffE5E5E5),
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Container(
                            height: 15,
                            width: 12,
                            child: Image.asset(
                              'assets/icons/delete.png',
                              fit: BoxFit.fill,
                              color: Color(0xffFF1111),
                            )),
                      ),
                      AppSize.size.w7,
                      TextWidget(
                        'Delete Account',
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFF1111),
                      ),
                    ],
                  ),
                  AppSize.size.h30
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
