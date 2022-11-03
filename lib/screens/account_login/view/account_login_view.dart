import 'package:family_garden/screens/account_login/controller/account_login_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

import '../../../widgets/LoginWidget/login_widget_view/login_widget_view.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';

class AccountLoginView extends GetView<AccountLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          appbar_title: 'Account Login',
          center_title: true,
        ),
      ),
      body: LoginWidgetView(
        screenName: 'Account Login',
      ),
    );
  }
}
