import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/common_appbar/custom_appbar_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
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
    this.appBarActions,
  }) : super(key: key);
  final Widget? appbar_leading;
  final String? appbar_title;
  final bool? center_title;
  final double? leading_width;
  final double? font_size;
  final Widget? appBarActions;
  final String? leading_image;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: (SystemUiOverlayStyle.dark),
      leadingWidth: leading_width,
      centerTitle: center_title,
      automaticallyImplyLeading: false,
      leading: appbar_leading,
      title: appbar_title == "Family Garden"
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 21,
                    width: 21,
                    child: SvgPicture.asset("assets/icons/logo.svg")),
                SizedBox(
                  width: 10,
                ),
                TextWidget(
                  appbar_title,
                  fontSize: font_size,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ],
            )
          : TextWidget(
              appbar_title,
              fontSize: font_size,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
      actions: [appBarActions ?? Container()],
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    );
  }
}
