import 'package:family_garden/routes/app_pages.dart';
import 'package:family_garden/screens/add_address_screen/controller/add_address_controller.dart';
import 'package:family_garden/screens/profile_screen/controllers/profile_controller.dart';
import 'package:family_garden/widgets/custom_textfield.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';

class AddAddressView extends GetView<AddAddressController> {
  @override
  var controller = Get.put(AddAddressController());

  @override
  Widget build(BuildContext context) {
    final formGlobalKey = GlobalKey<FormState>();
    return Scaffold(
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
          appbar_title: 'Add New Address',
          center_title: true,
          leading_image: "Add",
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Form(
                key: formGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70,
                      child: CustomTextField(
                        caption: 'Name *',
                        hasCaption: true,
                        fontSize: 12,
                        controller: controller.nameController,
                        validator: (value) {
                          if (value == null || value == "") {
                            return "please enter name";
                          } else {
                            return null;
                          }
                        },
                        hint: '',
                        readOnly: false,
                      ),
                    ),
                    AppSize.size.h15,
                    SizedBox(
                      height: 70,
                      child: CustomTextField(
                        caption: 'Phone Number *',
                        hasCaption: true,
                        fontSize: 12,
                        keyboardType: TextInputType.number,
                        controller: controller.phoneNumController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        hint: '',
                        counterText: "",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter phone number';
                          } else {
                            if (value.length < 10) {
                              return "entered mobile number invalid";
                            } else {
                              return null;
                            }
                          }
                        },
                        maxlength: 10,
                        readOnly: false,
                      ),
                    ),
                    AppSize.size.h15,
                    CustomTextField(
                      caption: 'Email',
                      hasCaption: true,
                      fontSize: 12,
                      controller: controller.emailController,
                      validator: (value) {
                        if (value == null || value == "") {
                          return null;
                        } else {
                          if (controller.isValidEmail(value)) {
                            return null;
                          } else {
                            return "please enter Valid Email";
                          }
                        }
                      },
                      hint: '',
                      readOnly: false,
                    ),
                    AppSize.size.h15,
                    CustomTextField(
                      caption: 'Address *',
                      hasCaption: true,
                      fontSize: 12,
                      controller: controller.addressController,
                      hint: '',
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Enter Address";
                        } else {
                          return null;
                        }
                      },
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
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxlength: 6,
                            counterText: "",
                            fontSize: 12,
                            controller: controller.pinCodeController,
                            validator: (value) {
                              if (value == null || value == "") {
                                return "Enter Pincode";
                              } else {
                                return null;
                              }
                            },
                            hint: '',
                            readOnly: false,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 3),
                      child: TextWidget(
                        '* Delivery Availble in \n Chennai only',
                        fontSize: 7,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFE6400),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20, top: 20),
                    //   child: TextWidget(
                    //     'Type of Address',
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.w400,
                    //     color: Color(0xff535353),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20, top: 10),
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         height: 30,
                    //         width: 80,
                    //         child: ElevatedButton(
                    //             onPressed: () {
                    //               controller.isHomeClicked.value = true;
                    //               controller.isWorkClicked.value = false;
                    //             },
                    //             style: ElevatedButton.styleFrom(
                    //                 backgroundColor:
                    //                     controller.isHomeClicked.value
                    //                         ? AppColors.primaryColor
                    //                         : Color(0xffF0F0F0),
                    //                 shape: RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(4))),
                    //             child: TextWidget(
                    //               'Home',
                    //               color: AppColors.black,
                    //               fontWeight: FontWeight.w500,
                    //               fontSize: 14,
                    //             )),
                    //       ),
                    //       AppSize.size.w10,
                    //       SizedBox(
                    //         height: 30,
                    //         width: 80,
                    //         child: ElevatedButton(
                    //             onPressed: () {
                    //               controller.isWorkClicked.value = true;
                    //               controller.isHomeClicked.value = false;
                    //             },
                    //             style: ElevatedButton.styleFrom(
                    //                 backgroundColor:
                    //                     controller.isWorkClicked.value
                    //                         ? AppColors.primaryColor
                    //                         : Color(0xffF0F0F0),
                    //                 shape: RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(4))),
                    //             child: TextWidget(
                    //               'Work',
                    //               color: AppColors.black,
                    //               fontWeight: FontWeight.w500,
                    //               fontSize: 14,
                    //             )),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 50,
                        width: Get.width,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formGlobalKey.currentState!.validate()) {
                                formGlobalKey.currentState!.save();
                                controller.saveAddress();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13))),
                            child: TextWidget(
                              'Save Address',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            )),
                      ),
                    ),
                    AppSize.size.h40
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
