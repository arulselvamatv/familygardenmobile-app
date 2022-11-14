import 'package:family_garden/utils/common_import/common_import.dart';

class LoginViewController extends GetxController
{
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool showPassword = true.obs;
}
