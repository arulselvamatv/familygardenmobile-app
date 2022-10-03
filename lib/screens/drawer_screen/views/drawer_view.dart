import 'package:family_garden/screens/drawer_screen/controllers/drawer_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/utils/theme/app_colors.dart';
import 'package:family_garden/utils/theme/app_sizes.dart';
import 'package:family_garden/widgets/custom_text.dart';
import 'package:get/get.dart';

class DrawerView extends GetView<DrawerWidgetController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DrawerWidgetController());
    return SizedBox(
      height: Get.height,
      width: Get.width / 1.3,
      child: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor),
                        child: Center(
                          child: TextWidget(
                            'FG',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      AppSize.size.w15,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width / 2.1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    "Family Garden",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff050000),
                                  ),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Colors.black,
                                        size: 20,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              width: Get.width / 2.1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    'Thoraipakkam, chennai',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor,
                                  ),
                                  ImageIcon(AssetImage(
                                    "assets/icons/location.png",
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppSize.size.h10,
              Container(
                height: 25,
                width: Get.width,
                color: AppColors.primaryColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: RichText(
                    text: TextSpan(
                        text: 'Delivery in 2hrs + ',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                            text: '100% Care',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFFFC00)),
                          )
                        ]),
                  ),
                ),
              ),
              AppSize.size.h20,
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                // padding: const EdgeInsets.only(bottom: 20, top: 10),
                shrinkWrap: true,
                itemCount: controller.sideMenus.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    child: Container(
                      child: ListTile(
                        dense: true,
                        onTap: () {
                          controller.sideMenuNavigation(index);
                        },
                        leading: Image.asset(
                          controller.sideMenus[index]["image"],
                          height: 24,
                          width: 24,
                          fit: BoxFit.fill,
                          color: Colors.black,
                        ),
                        title: TextWidget(
                          controller.sideMenus[index]["name"],
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Spacer(),

              Container(
                width: Get.width / 1.3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 35,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.primaryColor,
                        ),
                        child: Center(
                          child: TextWidget(
                            'Login',fontSize: 14,fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            border: Border.all(color: AppColors.primaryColor)),
                        child: Center(
                          child: TextWidget(
                            'Sign Up',fontSize: 14,fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                width: Get.width / 1.3,
                child :
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/c.png'),
                    AppSize.size.w5,
                    TextWidget('Family Garden. 2022',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff3A3A3A),)
                  ],
                )
              ),
              AppSize.size.h30
            ],
          ),
        ),
      ),
    );
  }
}
