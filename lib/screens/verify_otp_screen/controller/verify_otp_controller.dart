import 'package:family_garden/network/api_helper.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';

class VerifyOTPController extends GetxController {
  TextEditingController otpController = TextEditingController();
  RxString otp = "".obs;
  RxBool isLoader = false.obs;
  RxString mobileNum = "".obs;
  RxBool isNotValid = false.obs;

  void onInit() {
    getMobileNum();
    super.onInit();
  }

  getMobileNum() {
    mobileNum.value = Get.arguments;
    update();
  }

  checkOtp() async {
    isLoader.value = true;
    var response = await ApiHelper.verifyOtp(otpController.text,mobileNum.value);
    if (response.data?.status == "1") {
      isNotValid.value = false;
      isLoader.value = true;
      otpController.text = "";
      print("OTP RECEIVED SUCCESSFlly : ${response.data?.message}");
      Get.toNamed(Routes.CHANGE_PASSWORD,arguments: mobileNum.value);
    } else {
      isNotValid.value = true;
      otpController.text = "";
      print("OTP RECEIVED SUCCESSFlly : ${response.data?.message}");
      isLoader.value = false;
    }
  }

  sendAccountOtp() async {
    isLoader.value = false;
    var response = await ApiHelper.accountOtpSend(mobileNum.value);
    if (response.data?.status == 1) {
      isLoader.value = true;
      isNotValid.value = false;
      Get.snackbar("Success", "Resended the OTP");
      // Get.toNamed(Routes.VERIFY_OTP,arguments: mobileNumberController.text);
    } else {
      isLoader.value = true;
      isNotValid.value = true;
      Get.snackbar("warning", "Something went wrong");
    }
    update();
  }
}
