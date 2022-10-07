// import 'package:family_garden/screens/login_screen/controller/login_controller.dart';
// import 'package:family_garden/utils/common_import/common_import.dart';
// import 'package:family_garden/widgets/custom_textfield.dart';
//
// import '../../../routes/app_pages.dart';
//
// class LoginView extends GetView<LoginController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             height: Get.height,
//             width: Get.width,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 22.0, top: 40),
//                   child: Container(
//                     height: 49,
//                     width: 49,
//                     decoration: BoxDecoration(
//                         shape: BoxShape
//                             .circle, // BoxShape.circle or BoxShape.retangle
//                         color: AppColors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: AppColors.black.withOpacity(0.05),
//                             spreadRadius: 7,
//                             blurRadius: 9,
//                             offset: Offset(0, 0),
//                           ),
//                         ]),
//                     child: Center(
//                         child: Padding(
//                       padding: const EdgeInsets.only(left: 5.0),
//                       child: Icon(
//                         Icons.arrow_back_ios,
//                         size: 15,
//                         color: AppColors.black,
//                       ),
//                     )),
//                   ),
//                 ),
//                 Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 22.0, right: 22),
//                   child: Container(
//                     height: 48,
//                     width: 158,
//                     child: Text(
//                       "Enter your mobile number",
//                       maxLines: 2,
//                       style: TextStyle(
//                           fontSize: 21,
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.black),
//                     ),
//                   ),
//                 ),
//                 AppSize.size.h26,
//                 Padding(
//                   padding: const EdgeInsets.only(left: 22.0),
//                   child: Text(
//                     "We will send you confirmation code",
//                     style: TextStyle(
//                         color: AppColors.grey,
//                         fontSize: 12.75,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ),
//                 AppSize.size.h20,
//                 Padding(
//                   padding: const EdgeInsets.only(left: 22.0, right: 22),
//                   child: CustomTextField(
//                     controller: controller.mobileNumberController,
//                     hint: "",
//                     fontSize: 22,
//                     readOnly: false,
//                     keyboardType: TextInputType.number,
//                     prefixText: "+91 ",
//                     maxlength: 10,
//                     counterText: "",
//                   ),
//                 ),
//                 AppSize.size.h20,
//                 Padding(
//                   padding: const EdgeInsets.only(left: 22, right: 22),
//                   child: SizedBox(
//                     height: 50,
//                     width: Get.width,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           Get.toNamed(Routes.VERIFY_OTP);
//                         },
//                         style: ElevatedButton.styleFrom(
//                             primary: AppColors.primaryColor,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(13))),
//                         child: TextWidget(
//                           'Next',
//                           color: AppColors.white,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14,
//                         )),
//                   ),
//                 ),
//                 AppSize.size.h30,
//                 Center(
//                   child: Text(
//                     "By creating passcode you aggree with our",
//                     style: TextStyle(fontSize: 11.25),
//                   ),
//                 ),
//                 AppSize.size.h10,
//                 Center(
//                   child: Text.rich(TextSpan(children: [
//                     TextSpan(
//                         text: "Terms & Conditions ",
//                         style: TextStyle(
//                             color: AppColors.primaryColor, fontSize: 11.25)),
//                     TextSpan(
//                         text: "and ",
//                         style:
//                             TextStyle(color: AppColors.grey, fontSize: 11.25)),
//                     TextSpan(
//                         text: "Privacy Policy",
//                         style: TextStyle(
//                             color: AppColors.primaryColor, fontSize: 11.25))
//                   ])),
//                 ),
//                 Spacer(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
