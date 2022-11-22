import 'package:family_garden/screens/forgot_password_screen/controller/forgot_password_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter_svg/svg.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../../../widgets/custom_textfield.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  var controller = Get.put(ForgotPasswordController());

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
          appbar_title: "Forget Password ?",
          center_title: true,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 79,
                      width: 79,
                      child: SvgPicture.asset("assets/images/appLogo.svg"),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        Container(
                          height: 150,
                          width: 105,
                          child: SvgPicture.asset("assets/icons/sofa_girl.svg"),
                        ),
                      ],
                    )
                  ],
                ),
                // const Text(
                //   "Verify OTP",
                //   style: TextStyle(
                //       color: AppColors.darkGreen,
                //       fontWeight: FontWeight.w700,
                //       fontSize: 22),
                // ),
                // AppSize.size.h20,
                Text(
                  "Enter Your E- Mail Address / Mobile Number",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
                AppSize.size.h10,
                TextFormField(),
                AppSize.size.h24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 12,
                    ),
                    AppSize.size.w5,
                    Text(
                      "Mobile Number / E Mail Not Exist",
                      style: TextStyle(color: Colors.red, fontSize: 9),
                    ),
                  ],
                ),
                AppSize.size.h30,
                Container(
                  height: 50,
                  width: Get.width,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13))),
                      child: TextWidget(
                        'Send OTP',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
