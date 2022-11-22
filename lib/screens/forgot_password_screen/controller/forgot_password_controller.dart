import 'package:family_garden/utils/common_import/common_import.dart';

class ForgotPasswordController extends GetxController {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController mobileNumberController = TextEditingController();
  RxString mobileNumber = "".obs;
}
