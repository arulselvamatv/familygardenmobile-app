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
      orderInfo.value = response.data!;
      // subTotal.value =
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
