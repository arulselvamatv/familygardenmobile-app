import 'package:family_garden/screens/login_screen/controller/login_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWidgetView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 140,
      width: Get.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 79,
                  width: 79,
                  child: SvgPicture.asset("assets/images/appLogo.svg"),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    Container(
                      height: 130,
                      width: 105,
                      child: SvgPicture.asset("assets/images/Login.svg"),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
