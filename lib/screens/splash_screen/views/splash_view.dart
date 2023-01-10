import 'package:flutter_svg/svg.dart';
import '../../../utils/common_import/common_import.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: SvgPicture.asset(
            "assets/icons/logo-green.svg",
            height: 150,
            width: 150,
                fit: BoxFit.scaleDown,
          ))
        ],
      ),
    );
  }
}
