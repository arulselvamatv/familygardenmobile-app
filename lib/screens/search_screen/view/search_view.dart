import 'package:family_garden/utils/common_import/common_import.dart';
import '../../../routes/app_pages.dart';
import '../controller/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: AppColors.primaryColor,
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: 55,
                width: Get.width,
                color: AppColors.primaryColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            'assets/icons/backButton.png',
                            height: 24,
                            width: 24,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        height: 40,
                        width: Get.width / 1.3,
                        child: TextFormField(
                          controller: controller.searchController,
                          maxLines: 1,
                          onChanged: (value) {
                            controller.searchProducts();
                          },
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            prefixIcon: ImageIcon(
                                AssetImage('assets/icons/search.png')),
                            hintText: "Search for vegetables and fruits",
                            contentPadding: EdgeInsets.symmetric(vertical: 4),
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
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  child: Obx(() => controller.isLoader.value ? Center(child: CircularProgressIndicator()) : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.separated (
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                print(controller.productName.value[index]['product_id']);
                                Get.toNamed(Routes.PRODUCT_DETAILS_SCREEN,
                                    arguments: controller.productName.value[index]['product_id']);
                              },
                              child: Container(
                                child: TextWidget(
                                  controller.productName.value[index]['name'],
                                  fontSize: 20,color: AppColors.black,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return AppSize.size.h15;
                          },
                          itemCount: controller.productName.length),
                  ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
