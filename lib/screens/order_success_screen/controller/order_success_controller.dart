import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderSuccessController extends GetxController {
  RxString orderId = "".obs;

  @override
  void onInit() async {
    super.onInit();
    if(Get.arguments != null){
      showOrderId();
    }else{
      getOrderId();
    }
  }

  showOrderId(){
    orderId.value = "${Get.arguments}";
    print("COD PRocessed");
    update();
  }

  getOrderId() async {
    print("Get.arguments ${Get.arguments}");
    if (Get.arguments == null) {
      var data = await ApiHelper.orderSuccess();
      print("Order ID: ${data}");
      orderId.value = data;
    } else {
      orderId.value = Get.arguments.toString();
    }
    update();
  }
}
