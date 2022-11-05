import 'package:family_garden/models/order_history_model.dart';
import 'package:family_garden/models/order_info_model.dart';
import 'package:family_garden/network/api_helper.dart';
import 'package:get/get.dart';

class OrderDetailController extends GetxController {
  RxBool isLoaded = false.obs;
  final orderId = ''.obs;
  var orderInfo;
  // var orderInfo = OrderInfoModel().obs;

  @override
  void onInit() {
    isLoaded.value = false;
    orderId.value = Get.arguments;
    print(Get.arguments);
    getOrderInfo(orderId.value);
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

  Future<void> getOrderInfo(String orderID) async {
    print("Data $orderId");
    var response = await ApiHelper.getOrderInfo(orderId: int.parse(orderID));
    orderInfo = response;
    print(orderInfo["order_id"]);
    isLoaded.value = true;
    update();
  }
}
