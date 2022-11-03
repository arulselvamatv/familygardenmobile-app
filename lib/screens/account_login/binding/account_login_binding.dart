import 'package:family_garden/screens/account_login/controller/account_login_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class AccountLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountLoginController>(() => AccountLoginController());
  }
}
