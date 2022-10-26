import '../../../utils/common_import/common_import.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void onInit() async {
    super.onInit();
    cityController.text = 'Chennai';
    stateController.text = 'Tamil Nadu';
  }
}
