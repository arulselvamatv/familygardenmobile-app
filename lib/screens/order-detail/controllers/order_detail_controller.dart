import 'package:family_garden/models/order_history_model.dart';
import 'package:family_garden/models/order_info_model.dart';
import 'package:family_garden/network/api_constants/api_constants.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';

class OrderDetailController extends GetxController {
  RxBool isLoaded = false.obs;
  final orderId = ''.obs;
  var orderInfo = OrderInfoModel().obs;
  RxBool isChecked = false.obs;
  RxList boolList = [].obs;
  ValueNotifier<bool> showAppNotificationNotifierInitial = ValueNotifier(false);
  RxDouble subTotal = 0.0.obs;
  RxDouble shippingRate = 0.0.obs;
  RxDouble couponRate = 0.0.obs;
  RxDouble total = 0.0.obs;
  // var orderInfo = OrderInfoModel().obs;

  @override
  void onInit() {
    isLoaded.value = false;
    orderId.value = Get.arguments;
    getOrderInfo(orderId.value);
    print("sfdsdf");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getOrderInfo(String orderID) async {
    print(ApiConstants.jwtToken);
    boolList.clear();
    print("Data $orderId");
    var response = await ApiHelper.getOrderInfo(orderId: int.parse(orderID));
    print("LOG::::::${response.data!.logged}");
    if (response.data!.logged == null || response.data!.logged == "null") {
      print("LOG::::::${response.data!.logged}");
      showAppNotificationNotifierInitial.value = true;
    } else {
      // sub total
      var doubleString = response.data?.subTotals?.value;
      if (doubleString != null) {
        var subTotalDouble = double.parse(doubleString.substring(1));
        response.data?.subTotals?.value = subTotalDouble.toStringAsFixed(2);
      }
      // sub total
      doubleString = response.data?.totals?.value;
      if (doubleString != null) {
        var subTotalDouble = double.parse(doubleString.substring(1));
        response.data?.totals?.value = subTotalDouble.toStringAsFixed(2);
      }
      // sub total
      doubleString = response.data?.shipping?.value;
      if (doubleString != null) {
        var subTotalDouble = double.parse(doubleString.substring(1));
        response.data?.shipping?.value = subTotalDouble.toStringAsFixed(2);
      }
      // sub total
      doubleString = response.data?.coupon?.value;
      if (doubleString != null) {
        var subTotalDouble = double.parse(doubleString.substring(1));
        response.data?.coupon?.value = subTotalDouble.toStringAsFixed(2);
      }
      orderInfo.value = response.data!;
      print('Model ${orderInfo.value.subTotals?.value}, ${orderInfo.value.totals?.value}, ${orderInfo.value.shipping?.value}, ${orderInfo.value.coupon?.value}');
      print('Response ${response.data?.subTotals?.value}, ${response.data?.totals?.value}, ${response.data?.shipping?.value}, ${response.data?.coupon?.value}');
      // doubleString.value =
      //     double.parse(orderInfo.value.subTotals?.value!.toStringAsFixed(2));
      getBoolList();
    }
    isLoaded.value = true;
    update();
  }

  getBoolList() {
    for (var i = 0; i < (orderInfo.value.products?.length ?? 0); i++) {
      boolList.add(false);
    }
    update();
  }
}
