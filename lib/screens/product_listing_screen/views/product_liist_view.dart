import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter_svg/svg.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: Obx(
          () => CustomAppbarView(
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
                        child: SvgPicture.asset(
                          'assets/icons/BackIcon.svg',
                          height: 24,
                          width: 24,
                        )),
                  )
                ],
              ),
            ),
            font_size: 19,
            appbar_title: controller.title.value,
            center_title: true,
            leading_image: "Add",
            appBarActions: GestureDetector(
              onTap: () async {
                Get.toNamed(Routes.CART_SCREEN);
                controller.update();
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 15),
                    child: Image.asset("assets/icons/cart.png",
                        height: 25, width: 25),
                  ),
                  controller.cartCount.value == 0
                      ? Container()
                      : Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.only(top: 7, left: 9.0),
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                                border: Border.all(
                                    color: AppColors.white, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Center(
                                  child: Obx(
                                () => TextWidget(
                                  controller.cartCount.value.toString(),
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(
          ()=> Container(
          decoration: const BoxDecoration(
              color: Color(0xffF3F3F3),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              )),
          child: controller.isCategoryLoader.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 45,
                    child: TextFormField(
                      controller: controller.searchController,
                      maxLines: 1,
                      onChanged: (value) {},
                      onTap: () {
                        Get.toNamed(Routes.SEARCH_SCREEN)
                            ?.then((value) {
                          controller.getCartCount();
                        });
                      },
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        prefixIcon: ImageIcon(
                            AssetImage('assets/icons/search.png')),
                        hintText: "Search for vegetables and fruits",
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 4),
                        hintStyle: TextStyle(
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
                AppSize.size.h15,
                SizedBox(
                  width: Get.width,
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      Positioned(
                        bottom: 2,
                        child: Container(
                          height: 0.75,
                          width: Get.width,
                          color: Color(0xffDBDBDB),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 85,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  controller.categoriesIndex.value = index;
                                  controller.title.value = (controller.categoriesList.value[index].name)!;
                                  controller.update();
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.white,
                                      ),
                                      child: controller
                                          .categoriesList[
                                      index]
                                          .image ==
                                          null
                                          ? CircleAvatar(
                                        backgroundImage:
                                        AssetImage(
                                            controller
                                                .staticImage
                                                .value),
                                      )
                                          : CircleAvatar(
                                        backgroundImage:
                                        NetworkImage(
                                            controller
                                                .categoriesList[
                                            index]
                                                .image),
                                      ),
                                    ),
                                    AppSize.size.h10,
                                    Container(
                                        constraints: BoxConstraints(
                                            maxWidth: 64),
                                        child: TextWidget(
                                          controller
                                              .categoriesList[index]
                                              .name,
                                          fontSize: 10,
                                          fontWeight:
                                          FontWeight.w400,
                                          color: AppColors.black,
                                          textAlign:
                                          TextAlign.center,
                                          maxLines: 2,
                                          textOverflow:
                                          TextOverflow.ellipsis,
                                        )),
                                    Spacer(),
                                    Obx(
                                          () => Visibility(
                                        visible: controller
                                            .categoriesIndex
                                            .value ==
                                            index,
                                        child: Container(
                                          height: 4.5,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(10),
                                              color: AppColors
                                                  .primaryColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return AppSize.size.w20;
                            },
                            itemCount:
                            controller.categoriesList.length),
                      ),
                    ],
                  ),
                ),
                AppSize.size.h15,
              ],
            ),
                ),
        ),
      ),
    );
  }
}
