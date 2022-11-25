import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

import '../../../routes/app_pages.dart';

class ForgotPasswordController extends GetxController {

  TextEditingController mobileNumberController = TextEditingController();
  RxBool isMobileAlredyExist = false.obs;
  RxString mobileNumber = "".obs;
  RxBool loader = true.obs;


  sendAccountOtp()async{
    loader.value = false;
    var response = await ApiHelper.accountOtpSend(mobileNumberController.text);
    if(response.data?.status == 1){
      loader.value = true;

      Get.toNamed(Routes.VERIFY_OTP,arguments: mobileNumberController.text);
    }else{
      loader.value = true;
      isMobileAlredyExist.value = true;
      // Get.snackbar("warning", "Mobile Num not valid");
    }
    update();
  }
}
