import 'package:family_garden/screens/verify_otp_screen/controller/verify_otp_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../widgets/common_appbar/custom_appbar_view.dart';

class VerifyOTPView extends GetView<VerifyOTPController> {
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
          appbar_title: "",
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
              const Text(
                "Verify OTP",
                style: TextStyle(
                    color: AppColors.darkGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
              AppSize.size.h20,
              Text(
                "Please enter the OTP Sent to Mobile Number +91 6383293348",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
              AppSize.size.h55,
              SizedBox(
                height: 30,
                child: PinFieldAutoFill(
                  codeLength: 6,
                  controller: controller.otpController,
                  currentCode: controller.otp.value,
                  onCodeChanged: (val) {
                    // if (val?.length == 6 && otpVerified == false) {
                    //   Future otpVerify({required String emailId}) async {
                    //     var variables = {"emailId": emailId, "otp": val};
                    //
                    //     Map data = {
                    //       "query": verifyOTP,
                    //       "operationName": "VerifyOTP",
                    //       "variables": variables
                    //     };
                    //     var body = json.encode(data);
                    //     var respondeData = await clientApiCall(
                    //       body: body,
                    //     );
                    //     if (respondeData['data']['verifyOTP']['message'] ==
                    //         "OTP verified successfully.") {
                    //       final prefs = await SharedPreferences.getInstance();
                    //       await prefs.remove("otp");
                    //
                    //       await prefs.setString('otp', '$val');
                    //       var otp1 = prefs.getString('otp');
                    //       print("otp1 $otp1");
                    //       getOtpValues();
                    //       setState(() {
                    //         otpVerified = true;
                    //       });
                    //     } else {
                    //       Fluttertoast.showToast(
                    //           msg: "Invalid OTP",
                    //           toastLength: Toast.LENGTH_LONG,
                    //           gravity: ToastGravity.BOTTOM,
                    //           timeInSecForIosWeb: 1,
                    //           backgroundColor: Colors.red,
                    //           textColor: Colors.white,
                    //           fontSize: 16.0);
                    //     }
                    //   }
                    //
                    //   otpVerify(emailId: widget.emailId);
                    // }
                  },
                ),
              ),
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
                    "Verification failed! Please enter the correct OTP",
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
                      'Verify OTP',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    )),
              ),
              AppSize.size.h15,
              Center(
                child: Text(
                  "Resend OTP",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.oopsColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
