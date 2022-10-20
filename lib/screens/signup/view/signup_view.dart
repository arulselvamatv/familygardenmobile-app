import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/custom_textfield.dart';
import '../controller/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  var controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22.0, top: 40),
                    child: Container(
                      height: 49,
                      width: 49,
                      decoration: BoxDecoration(
                          shape: BoxShape
                              .circle, // BoxShape.circle or BoxShape.retangle
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.05),
                              spreadRadius: 7,
                              blurRadius: 9,
                              offset: Offset(0, 0),
                            ),
                          ]),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                          color: AppColors.black,
                        ),
                      )),
                    ),
                  ),
                ),
                AppSize.size.h55,
                Container(
                  height: 121,
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: AppColors.darkGreen,
                              fontWeight: FontWeight.w700,
                              fontSize: 22),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child:
                            SvgPicture.asset("assets/images/singup_image.svg"),
                      ),
                    ],
                  ),
                ),
                TextField(
                    decoration: InputDecoration(
                  labelText: "Name *",
                  // hintText: "Enter your email",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SvgPicture.asset(
                      "assets/icons/user.svg",
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 25,
                    minHeight: 25,
                  ),
                  hintStyle: TextStyle(
                      fontSize: 18,
                      // isDense: true,
                      fontWeight: FontWeight.bold), //hint text style
                  labelStyle: TextStyle(
                      fontSize: 13, color: Colors.redAccent), //label style
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
