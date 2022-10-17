import 'package:carousel_slider/carousel_slider.dart';
import 'package:family_garden/screens/product_details_screen/controllers/product_details_controller.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../utils/common_import/common_import.dart';
import '../../../widgets/common_appbar/custom_appbar_view.dart';
import '../../../widgets/custom_textfield.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
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
                        child: Image.asset(
                          'assets/icons/backButton.png',
                          height: 24,
                          width: 24,
                        )),
                  )
                ],
              ),
            ),
            font_size: 19,
            appbar_title: controller.productDetailLoader.value
                ? "Product Details"
                : controller.productDetails?.productName,
            center_title: true,
          ),
        ),
      ),
      body: Obx(
        () => Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              )),
          child: Column(
            children: [
              controller.productDetailLoader.value ? Spacer() : Container(),
              GetBuilder<ProductDetailsController>(
                builder: (value) => controller.productDetailLoader.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                        child: Column(
                          children: [
                            AppSize.size.h15,
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: TextWidget(
                                // 'Carrot',
                                controller.productDetails?.productName,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: AppColors.black,
                                textOverflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            AppSize.size.h3,
                            TextWidget(
                              // 'கேரட்',
                              controller.productDetails?.productNameTamil,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              textOverflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 215,
                              width: Get.width,
                              child: Stack(
                                children: [
                                  CarouselSlider.builder(
                                      carouselController:
                                          controller.carouselController,
                                      itemCount: controller
                                              .carousalImages.isEmpty
                                          ? controller.carouselImage.length
                                          : controller.carousalImages.length,
                                      itemBuilder: (context, index, realIndex) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child:
                                              controller.carousalImages.isEmpty
                                                  ? Image.asset(
                                                      controller
                                                          .carouselImage[index],
                                                      width: Get.width / 1.5,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : Image.network(controller
                                                      .carousalImages[index]
                                                      .thumb!),
                                        );
                                      },
                                      options: CarouselOptions(
                                          // autoPlay: true,
                                          viewportFraction: 1,
                                          // scrollPhysics:
                                          //     NeverScrollableScrollPhysics(),
                                          enableInfiniteScroll: true,
                                          onPageChanged: (index, reason) {
                                            // controller.pageChanged(index);
                                          })),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                        onPressed: () {
                                          controller.carouselController
                                              .nextPage();
                                        },
                                        icon: Icon(
                                            Icons.arrow_forward_ios_outlined)),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                        onPressed: () {
                                          controller.carouselController
                                              .previousPage();
                                        },
                                        icon: Icon(
                                            Icons.arrow_back_ios_outlined)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 25,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        print("onselect");
                                        controller.selecteIndex.value = index;
                                        controller
                                            .onProductWeightSelected(index);
                                        controller.update();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                controller.selecteIndex.value ==
                                                            10 ||
                                                        controller.selecteIndex
                                                                .value !=
                                                            index
                                                    ? AppColors.white
                                                    : Color(0xffB6F1E7),
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            border: Border.all(
                                                color: controller.selecteIndex
                                                                .value ==
                                                            10 ||
                                                        controller.selecteIndex
                                                                .value !=
                                                            index
                                                    ? Color(0xffE8E8E7)
                                                    : Colors.transparent)),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: TextWidget(
                                            controller
                                                .productDetails
                                                ?.options?[0]
                                                .productOptionValue?[index]
                                                .name,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black,
                                          ),
                                        )),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return AppSize.size.w7;
                                  },
                                  itemCount: controller
                                          .productDetails
                                          ?.options?[0]
                                          .productOptionValue
                                          ?.length ??
                                      0),
                            ),
                            AppSize.size.h25,
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        'Description',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black,
                                      ),
                                      AppSize.size.h5,
                                      Container(
                                        child: IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Html(
                                                  data: controller
                                                      .productDetails
                                                      ?.description,
                                                  style: {
                                                    "h6": Style(
                                                      fontSize: FontSize(14),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors.black,
                                                    )
                                                  },
                                                ),
                                                // child: TextWidget(
                                                //   'Carrot the juicy and crunchy vegetable is the favorite of many, and can be eaten raw, cooked, or prepared as a salad. Loaded with vitamins and minerals like calcium, vitamin K, A, beta carotene, and many more it takes care of our bone health and eyesight. Carrot is a veggie that is a must in your pantry.',
                                                //   fontSize: 11,
                                                //   fontWeight: FontWeight.w500,
                                                //   color: Color(0xff333333),
                                                // ),
                                              ),
                                              AppSize.size.w5,
                                              VerticalDivider(
                                                width: 1.5,
                                                thickness: 1.5,
                                                color: Color(0xffE5E5E5),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      )),
              ),
              controller.productDetailLoader.value ? Spacer() : Container(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.onFavouriteButtonSelected();
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xffE9E9EA)),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/icons/favourite.png',
                            color:
                                controller.productDetails?.iswishlist == false
                                    ? Color(0xffDEDEDE)
                                    : Color(0xffFF8A00),
                          ),
                        ),
                      ),
                    ),
                    AppSize.size.w15,
                    GestureDetector(
                      onTap: () {
                        controller.onAddToCartSelected();
                      },
                      child: Container(
                        height: 32,
                        width: 127,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                  color: Color(0xff000000).withOpacity(
                                      controller.addToCart.value ? 0.2 : 0)),
                            ],
                            color: controller.addToCart.value
                                ? AppColors.white
                                : AppColors.primaryColor),
                        child: controller.addToCart.value
                            ? Row(
                                children: [
                                  SizedBox(
                                      width: 40,
                                      child: TextButton(
                                          style: ButtonStyle(
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                          ),
                                          onPressed: () {
                                            controller.minus();
                                          },
                                          child: Image.asset(
                                              "assets/icons/minus.png"))),
                                  Spacer(),
                                  // TextWidget('-',color: AppColors.white,fontSize: 8,),
                                  TextWidget(
                                    controller.counter.toString(),
                                    color: AppColors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Spacer(),
                                  SizedBox(
                                      width: 40,
                                      child: TextButton(
                                          style: ButtonStyle(
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                          ),
                                          onPressed: () {
                                            controller.add();
                                          },
                                          child: Image.asset(
                                              "assets/icons/add.png"))),
                                ],
                              )
                            : Center(
                                child: TextWidget(
                                  'Add to Cart',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ),
                      ),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextWidget(
                          controller.productDetails?.special,
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                        TextWidget(
                          controller.productDetails?.price,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff6A6A6A),
                          decoration: TextDecoration.lineThrough,
                        ),
                        TextWidget(controller.productDetails?.percentOff,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFF8A00)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
