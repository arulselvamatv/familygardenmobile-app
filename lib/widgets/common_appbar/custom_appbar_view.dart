import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/common_appbar/custom_appbar_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class CustomAppbarView extends GetView<CustomAppbarController> {
  const CustomAppbarView({
    Key? key,
    this.appbar_leading,
    this.appbar_title,
    this.center_title,
    this.leading_width,
    this.font_size,
    this.leading_image,
  }) : super(key: key);
  final Widget? appbar_leading;
  final String? appbar_title;
  final bool? center_title;
  final double? leading_width;
  final double? font_size;
  final String? leading_image;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: (SystemUiOverlayStyle.dark),
      leadingWidth: leading_width,
      centerTitle: center_title,
      automaticallyImplyLeading: false,
      leading: appbar_leading,
      title: TextWidget(
        appbar_title,
        fontSize: font_size,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      actions: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.CART_SCREEN);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 15),
                child: leading_image == "Add"
                    ? Image.asset("assets/icons/plus.png",
                        height: 25, width: 25)
                    : Image.asset("assets/icons/cart.png",
                        height: 25, width: 25),
              ),
            ),
            leading_image == "Add"
                ? Container()
                : Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(top: 10, left: 3.0),
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                          border: Border.all(color: AppColors.white, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                            child: TextWidget(
                          "0",
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
                      ),
                    ),
                  ),
          ],
        )
      ],
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    );
  }
}
