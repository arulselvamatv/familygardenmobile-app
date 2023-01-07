import 'package:family_garden/screens/categories_screen/controllers/categories_controller.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:family_garden/widgets/custom_text.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../../routes/app_pages.dart';

class CategoriesView extends GetView<CategoriesController> {
  @override
  var controller = Get.put(CategoriesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Container(
          height: Get.height,
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              )),
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: SingleChildScrollView(
              // physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        controller: controller.searchController,
                        maxLines: 1,
                        onChanged: (value) {},
                        onTap: () {
                          Get.toNamed(Routes.SEARCH_SCREEN)?.then((value) =>
                              FocusScope.of(context).requestFocus(FocusNode()));
                        },
                        style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          prefixIcon:
                               SvgPicture.asset('assets/icons/search.svg',height: 24,width: 24,fit: BoxFit.scaleDown,),
                          hintText: "Search for vegetables and fruits",
                          contentPadding: const EdgeInsets.symmetric(vertical: 4),
                          hintStyle: const TextStyle(
                              color: Color(0xff464646),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30)),
                          fillColor: Color(0xfff1f1f1),
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  AppSize.size.h10,
                  ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 30),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.PRODUCT_LISTING_SCREEN,
                                arguments: [
                                  index,
                                  controller.categoriesList[index].categoryId
                                ]);
                          },
                          child: Container(
                            width: Get.width,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15,
                                            top: 10,
                                            bottom: 10,
                                            right: 35),
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: controller
                                                        .categoriesList[index]
                                                        .image ==
                                                    null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                        controller
                                                            .staticImage.value),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                        controller
                                                            .categoriesList[
                                                                index]
                                                            .image),
                                                  ),
                                          ),
                                        ),
                                      ),
                                      TextWidget(
                                        controller.categoriesList[index].name,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 15,
                                        color: Color(0xff808080),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Color(0xffE5E5E5),
                                  height: 0.75,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 0,
                        );
                      },
                      itemCount: controller.categoriesList.length),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
