import 'package:family_garden/utils/common_import/common_import.dart';

class LoginWidgetController extends GetxController {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool showPassword = true.obs;
}
