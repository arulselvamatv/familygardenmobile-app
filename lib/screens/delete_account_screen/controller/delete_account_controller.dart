import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/screens/account_screen/controllers/account_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../network/api_constants/api_constants.dart';
import '../../../network/set_local_datas.dart';
import '../../../routes/app_pages.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../../drawer_screen/controllers/drawer_controller.dart';

class DeleteAccountController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  RxBool showPassword = true.obs;
  RxString userName = "".obs;
  RxString telephone = "".obs;
  RxBool isValid = true.obs;

  @override
  void onInit() {
    getLoginDetails();
    super.onInit();
  }

  getLoginDetails() async {
    var prefs = await SharedPreferences.getInstance();
    userName.value = prefs.getString("firstName")!;
    telephone.value = prefs.getString("telephone")!;
    update();
  }

  deleteAccountBtn(context)async{
    isValid.value =  passwordController.text.isNotEmpty;
    if(isValid.value){
      var response = await ApiHelper.login(telephone.value, passwordController.text);
      if (response.data?.errorWarning == ""){
        var res = await ApiHelper.deleteAccount(response.data?.session?.customerId);
        if(res.data?.status == 1){
          int res = await ApiHelper.logOut();
          final prefs =
          await SharedPreferences
              .getInstance();
          if (res == 1) {
            prefs.clear();
            Get.put(AccountController());
            Get.find<AccountController>()
                .isLoggedIn
                .value = false;
            Get.find<AccountController>()
                .isLoggedIn.refresh();

            // controller.isLoggedIn.refresh();
            // controller.update();
            Get.put(DrawerWidgetController());
            Get.find<DrawerWidgetController>()
                .isLoggedin
                .value = true;
            Get.find<DrawerWidgetController>()
                .isLoggedin
                .refresh();
            var response =
            await ApiHelper.getToken();
            if (response.data?.apiToken !=
                null) {
              SetLocalDatas.setToken(
                  (response.data?.apiToken)!);
              print(ApiConstants.jwtToken);
            }
            Get.put(DashboardController());
            Get.find<DashboardController>()
                .isLoggedIn
                .value = false;
            // Get.snackbar('success',
            //     "Logout successfully");
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
              duration:
              Duration(milliseconds: 350),
              content:
              Text("Account Deleted Successfully"),
            ));
            Get.toNamed(Routes.DASHBOARD);
          }
        }else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Account delete Failure"),
          ));
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Invalid Password"),
        ));
      }
    }else{

    }
    update();
  }
}
