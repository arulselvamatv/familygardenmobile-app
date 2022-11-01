import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/common_import/common_import.dart';

class AccountController extends GetxController {
  var isLoggedIn = false.obs;
  RxString firstName = "".obs;

  void onInit() {
    getLoginDetails();
  }

  getLoginDetails() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("Login")) {
      String login = prefs.getString("Login")!;
      if (login == "true") {
        isLoggedIn.value = true;
        firstName.value = prefs.getString("firstName")!;
      }
    }
    update();
  }
}
