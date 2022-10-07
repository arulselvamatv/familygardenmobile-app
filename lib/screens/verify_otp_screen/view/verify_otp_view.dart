import 'package:family_garden/screens/verify_otp_screen/controller/verify_otp_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class VerifyOTPView extends GetView<VerifyOTPController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22.0, top: 40),
                  child: Container(
                    height: 49,
                    width: 49,
                    decoration: BoxDecoration(
                        shape: BoxShape
                            .circle, // BoxShape.circle or BoxShape.retangle
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.05),
                            spreadRadius: 7,
                            blurRadius: 9,
                            offset: Offset(0, 0),
                          ),
                        ]),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: AppColors.black,
                      ),
                    )),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0, right: 22),
                  child: Container(
                    height: 48,
                    width: 222,
                    child: Text(
                      "Enter the code sent to your mobile",
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black),
                    ),
                  ),
                ),
                AppSize.size.h24,
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Text(
                    "We sent it to +91 987654****",
                    style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 12.75,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textFieldOTP(
                        first: true,
                        last: false,
                        controllerr: controller.contrller1,
                        context: context),
                    textFieldOTP(
                        first: true,
                        last: false,
                        controllerr: controller.contrller2,
                        context: context),
                    textFieldOTP(
                        first: true,
                        last: false,
                        controllerr: controller.contrller3,
                        context: context),
                    textFieldOTP(
                        first: true,
                        last: false,
                        controllerr: controller.contrller4,
                        context: context),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFieldOTP(
      {bool? first, last, TextEditingController? controllerr, context}) {
    return Container(
      height: Get.height / 12,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: controllerr,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black54),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black54),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
