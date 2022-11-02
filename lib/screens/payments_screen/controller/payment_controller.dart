import 'dart:convert';

import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:http/http.dart' as http;
import '../../../models/cart_list_model.dart';
import '../../../models/checkout_confirm_model.dart';
import '../../../models/payment_method_model.dart';
import '../../../network/api_constants/api_end_points.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/common_import/common_import.dart';

class PaymentController extends GetxController {
  RxBool isPaymentScreenLoader = false.obs;
  RxBool isCCavenueSelected = false.obs;
  RxBool isCODselected = false.obs;
  CheckoutConfirmModel? paymentRes;
  RxBool isCartEmpty = false.obs;
  var products = CartListModel().obs;
  RxDouble savedPrice = 0.0.obs;
  RxDouble actulPrice = 0.00.obs;
  RxDouble payableAmount = 0.00.obs;
  RxInt deliveryCharges = 0.obs;
  String code = '';

  // RxDouble savedPrice = 0.0.obs;

  var paymentMethod;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      actulPrice.value = Get.arguments[0];
      savedPrice.value = Get.arguments[1];
      deliveryCharges.value = Get.arguments[2];
      payableAmount.value = deliveryCharges.value + actulPrice.value;
      update();
    }
    getPaymentMethodDetails();
    // getCartListDatas();
  }

  getPaymentMethodDetails() async {
    var response = await ApiHelper.paymentMethod();
    paymentMethod = response;
    isPaymentScreenLoader.value = true;
    update();
  }

  getCartListDatas() async {
    // print(apiToken);
    var response = await ApiHelper.cartList();
    if (response.isSuccessFul) {
      products.value = response.data!;
      getListDatas();
    }
    update();
  }

  getListDatas() {
    var actualPriceAmount = 0.0;
    var offerPriceAmount = 0.0;
    print("products.value.products?.length ${products.value.products?.length}");
    for (int i = 0; i < (products.value.products?.length)!; i++) {
      var offerPrice =
          double.parse((products.value.products?[i].offerPrice?.substring(1))!);
      // var actualPrice = double.parse((products.value.products?[i].actualPrice)!);
      // var percentage = ((actualPrice-offerPrice)/actualPrice)*100;
      // actualPriceAmount += actualPrice * double.parse((products.value.products?[i].quantity)!);
      // offerPriceAmount += offerPrice * double.parse((products.value.products?[i].quantity)!);
    }
    savedPrice.value = actualPriceAmount - offerPriceAmount;
    actulPrice.value = offerPriceAmount;
    payableAmount.value = offerPriceAmount;
    payableAmount.value += (offerPriceAmount < 200.0) ? 50.0 : 0.0;
    // deliveryCharges.value = (offerPriceAmount < 200.0) ? "Rs. 50.0" : "Free";
    update();
  }

  onCheckBoxClickCCAvenue(value) {
    if (isCODselected.value == true) {
      isCODselected.value = !value;
      isCCavenueSelected.value = value;
      code = 'ccavenuepay';
      // code = paymentMethod["payment_methods"]["ccavenuepay"]["code"];
    } else {
      isCCavenueSelected.value = value;
      code = 'ccavenuepay';
      // code = paymentMethod["payment_methods"]["ccavenuepay"]["code"];
    }
    update();
  }

  onCheckBoxClickCOD(value) {
    if (isCCavenueSelected.value == true) {
      isCCavenueSelected.value = !value;
      isCODselected.value = value;
    } else {
      isCODselected.value = value;
    }
    update();
  }

  codMethod() async {
    print("Cod start");
    var response = await http.post(Uri.parse(
        '${ApiConstants.baseUrl}/index.php?route=mobileapi/payment/cod/confirm&api_token=${ApiConstants.jwtToken}'));
    // var request = http.Request(
    //     'POST',
    //     );
    // request.headers.addAll(headers);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      if (body["order_id"] != null) {
        Get.offAndToNamed(Routes.ORDER_SUCCESS_SCREEN,
            arguments: body["order_id"]);
      }
      print("Order Id : ${body["order_id"]}");
    }
    // http.StreamedResponse response = await request.send();
    // print(response.statusCode);
    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    //   var res = await response.stream.bytesToString();
    //   var deco = json.decode(res);
    //   print(deco["order_id"]);
    //   // if(res["order_id"])
    //   var body = jsonDecode(await response.stream.bytesToString());
    //   print(body);
    // } else {
    //   print(response.reasonPhrase);
    // }
    // var res = await http.post(Uri.parse(
    //     "${ApiConstants.baseUrl}/index.php?route=mobileapi/payment/cod/confirm&api_token=${ApiConstants.jwtToken}"));
    //
    // // var request = http.Request(
    // //     'POST',
    // //     Uri.parse(
    // //         ''));
    // // http.StreamedResponse response = await request.send();
    // print("res code ${res.statusCode}");
    // if (res.statusCode == 200) {
    //   var response = res.body;
    //   // print(response)
    //   print("cod confirm res ${response}");
    //   Get.toNamed(Routes.ORDER_SUCCESS_SCREEN, arguments: [
    //     {"orderNumber": ''}
    //   ]);
    // } else {
    //   // print(response.reasonPhrase);
    // }
  }

  continueBtn(context) async {
    if (isCCavenueSelected.value || isCODselected.value) {
      if (isCCavenueSelected.value) {
        var res = await ApiHelper.paymentMethodSave('ccavenuepay');
        if (res.responseCode == 200) {
          var checkoutResponse = await ApiHelper.checkOutConfirm();
          if (checkoutResponse.responseCode == 200) {
            print(checkoutResponse.data);
            paymentRes = checkoutResponse.data!;
            Get.toNamed(Routes.INITIATEPAYMENT, arguments: paymentRes);
          }
        }
      } else {
        var res = await ApiHelper.paymentMethodSave('cod');
        if (res.responseCode == 200) {
          var checkoutResponse = await ApiHelper.checkOutCODConfirm();
          if (checkoutResponse.responseCode == 200) {
            // paymentRes = checkoutResponse.data!;
            codMethod();
          }
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Select the payment method proceed"),
      ));
    }
  }
}
