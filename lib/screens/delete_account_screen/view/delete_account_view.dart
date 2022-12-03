import 'package:family_garden/screens/delete_account_screen/controller/delete_account_controller.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';

class DeleteAccountView extends GetView<DeleteAccountController> {
  @override
  Widget build(BuildContext context) {
    final formGlobalKey = GlobalKey<FormState>();
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
          appbar_title: 'Delete Account',
          center_title: true,
          leading_image: "Add",
        ),
      ),
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Obx(
          ()=> Container (
            height: Get.height - 95,
            width: Get.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            child: Column (
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AppSize.size.h30,
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //   child: SizedBox(height: 98, width: 98, child: CircleAvatar()),
                    // ),
                    AppSize.size.h30,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text("Deleting Your Account is Permanent",style: TextStyle(fontSize: 16),),
                          Spacer(),
                          Container(height: 34,width: 34,child: SvgPicture.asset ("assets/icons/Exclamatory.svg",height: 34,width: 34,))
                        ],
                      ),
                    ),
                    AppSize.size.h30,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Padding(
                        padding: EdgeInsets.only(right: 50.0),
                        child: Text("Your profile, wishlist, order history and saved address will be permanently deleted.",style: TextStyle(fontSize: 11,height: 1.5),),
                      ),
                    ),
                    AppSize.size.h3,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Padding(
                        padding: EdgeInsets.only(right: 50.0),
                        child: Text("You’ll lose any recommendations and endorsements you’ve given or received.",style: TextStyle(fontSize: 11,height: 1.5),),
                      ),
                    ),
                    AppSize.size.h55,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        width: Get.width,
                          color: Color(0xffF2F2F2),

                        // decoration: BoxDecoration(
                        //
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.black,
                        //       blurRadius: 2.0,
                        //       spreadRadius: 0.0,
                        //       offset: Offset(1.0, 1.0), // shadow direction: bottom right
                        //     )
                        //   ],
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13.0),
                          child: Text.rich(
                              TextSpan(
                            children: [
                              TextSpan(text: 'You’re requested to delete ',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,height: 1.5)),
                              TextSpan(text: controller.userName.value,style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600,height: 1.5)),
                              TextSpan(text: ", You can stop the deletion process by logging back your Family Garden account with in 30 Days.",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600,height: 1.5))
                            ]
                          )),
                        ),
                      ),
                    ),
                    AppSize.size.h20,
                    Container(height: 1,width: Get.width,color: Colors.black,),
                    AppSize.size.h30,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter password';
                          }
                          return null;
                        },
                        obscureText: controller.showPassword.value,
                        enableSuggestions: false,
                        autocorrect: false,
                        obscuringCharacter: '*',
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          suffixIconConstraints:
                          BoxConstraints(minHeight: 24, minWidth: 24),
                          suffixIcon: !controller.showPassword.value
                              ? GestureDetector(
                              onTap: () {
                                controller.showPassword.value =
                                !controller.showPassword.value;
                              },
                              child: SvgPicture.asset(
                                "assets/icons/hide Password.svg",
                                color: AppColors.black,
                              ))
                              : GestureDetector(
                              onTap: () {
                                controller.showPassword.value =
                                !controller.showPassword.value;
                              },
                              child: SvgPicture.asset(
                                "assets/icons/show Password.svg",
                                color: AppColors.black,
                              )),
                          labelText: "Password *",
                          labelStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff535353)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: AppColors.dividerColor)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.dividerColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AppSize.size.h8,
                    !controller.isValid.value? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 12,
                          ),
                          AppSize.size.w5,
                          Text(
                            "Enter Password",
                            style: TextStyle(color: Colors.red, fontSize: 11),
                          ),
                        ],
                      ),
                    ):Container()
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 45,
                    width: Get.width,
                    child: ElevatedButton(
                        onPressed: () {
                            controller.deleteAccountBtn(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13))),
                        child: TextWidget(
                          'Delete Account',
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        )),
                  ),
                ),
                AppSize.size.h40,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
