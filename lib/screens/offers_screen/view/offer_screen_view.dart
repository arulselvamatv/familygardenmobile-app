import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:family_garden/screens/offers_screen/controller/offers_controller.dart';
import 'package:family_garden/screens/product_listing_screen/controllers/products_listing_controller.dart';
import '../../../models/category_product_model.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../../../widgets/custom_text.dart';

class OffersView extends GetView<OffersController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OffersController());
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          // controller.hitAddCartAPI();
          Get.back();
          return true;
        },
        child: Scaffold(
            backgroundColor: AppColors.primaryColor,
            // appBar: PreferredSize(
            //   preferredSize: Size.fromHeight(55),
            //   child: Obx(
            //     () => CustomAppbarView(
            //       leading_width: 50,
            //       appbar_leading: Container(
            //         width: 14,
            //         child: Row(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(left: 15.0),
            //               child: GestureDetector(
            //                   onTap: () {
            //                     Get.back();
            //                   },
            //                   child: Image.asset(
            //                     'assets/icons/backButton.png',
            //                     height: 24,
            //                     width: 24,
            //                   )),
            //             )
            //           ],
            //         ),
            //       ),
            //       font_size: 19,
            //       appbar_title: controller.title.value,
            //       center_title: true,
            //       leading_image: "Add",
            //       appBarActions: Stack(
            //         children: [
            //           // GestureDetector(
            //           //   onTap: () {
            //           //     controller.hitAddCartAPI();
            //           //     Get.toNamed(Routes.CART_SCREEN)?.then((value) =>
            //           //         controller.getCategoryProduct(
            //           //             controller.categoryId.value));
            //           //   },
            //           //   child: Padding(
            //           //     padding: const EdgeInsets.only(right: 20, top: 15),
            //           //     child: Image.asset("assets/icons/cart.png",
            //           //         height: 25, width: 25),
            //           //   ),
            //           // ),
            //           Container(
            //             width: 30,
            //             height: 30,
            //             alignment: Alignment.topRight,
            //             margin: const EdgeInsets.only(top: 10, left: 3.0),
            //             child: Container(
            //               width: 18,
            //               height: 18,
            //               decoration: BoxDecoration(
            //                   shape: BoxShape.circle,
            //                   color: AppColors.white,
            //                   border:
            //                       Border.all(color: AppColors.white, width: 1)),
            //               child: Padding(
            //                 padding: const EdgeInsets.all(0.0),
            //                 child: Center(
            //                     child: TextWidget(
            //                   "0",
            //                   color: AppColors.black,
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w600,
            //                 )),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            body: Container(
              decoration: const BoxDecoration(
                  color: Color(0xffF3F3F3),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: Container(
                height: Get.height,
                width: Get.width,
              ),
            )),
      ),
    );
  }
}
