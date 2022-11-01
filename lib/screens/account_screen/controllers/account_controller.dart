import 'package:family_garden/network/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/common_import/common_import.dart';

class AccountController extends GetxController {
  var isLoggedIn = false.obs;
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString emailId = "".obs;
  RxString telephone = "".obs;

  void onInit() {
    getLoginDetails();
  }

  getLoginDetails() async {
    print("Caled");
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("Login")) {
      String login = prefs.getString("Login")!;
      if (login == "true") {
        isLoggedIn.value = true;
        firstName.value = prefs.getString("firstName")!;
        lastName.value = prefs.getString("lastName")!;
        emailId.value = prefs.getString("emailId")!;
        telephone.value = prefs.getString("telephone")!;
      }
    }
    update();
  }
// logout() {
//   print(ApiHelper.logOut());
// }
}
