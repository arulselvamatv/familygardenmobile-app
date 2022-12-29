import 'package:family_garden/network/api_helper.dart';
import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:intl/intl.dart';
import '../../../models/checkout_cart_datas_model.dart';
import '../../../models/checkout_confirm_model.dart';
import '../../../models/time_slot_model.dart';
import '../../../routes/app_pages.dart';

class TimeAndOrderConfirmationController extends GetxController{
  RxList inBetweenTime = ["7.00 AM - 9.00 AM","10.00 AM - 12.00 PM","03.00 PM - 05.00 PM","06.00 PM - 08.00 PM",].obs;
  RxList inBetweenTimeValid = [false,true,true,false].obs;
  RxList selectedDays = [true,false].obs;
  RxList selectedTimeSlot = ["",""].obs;
  RxList availableBoolList = [].obs;
  RxList startTimeList = [].obs;
  RxList endTimeList = [].obs;
  RxList boolList = [false,true,true,false].obs;
  RxList products = ["Apple","Banana","Cherry","Mango"].obs;
  RxList category = ["Fruits","Fruits","Fruits","Fruits"].obs;
  RxList qty = ["1","1","1","1"].obs;
  RxList price = ["₹40.00","₹125.00","₹160.00","₹109.00"].obs;
  RxString subTotal = "₹720.00".obs;
  RxString flatShippingRate = "₹720.00".obs;
  RxString couponRate = "₹720.00".obs;
  var timeSlotDatas = TimeSlotsModel().obs;
  RxList timeSlots = [].obs;
  var todayDate = DateTime.now();
  var tommorowDate = DateTime.now().add(Duration(days: 1));
  RxString today = "".obs;
  RxString tommorow = "".obs;
  RxBool isLoading = false.obs;
  RxInt currentTimeNumber = 0.obs;
  RxList passinData = [].obs;
  CheckoutCartDatasModel? cartData;

  @override
  void onInit(){
    getFormatDates();
    getTimeSlots();
    super.onInit();
  }

  getFormatDates(){
    passinData.value.add(Get.arguments[0]);
    passinData.value.add(Get.arguments[1]);
    passinData.value.add(Get.arguments[2]);
    passinData.value.add("");
    passinData.value.add("");
    var vals = DateFormat('HH:mm:ss').format(todayDate);
    print(vals);
    currentTimeNumber.value = int.parse(vals.substring(0,2));
    print("sdfdslfnklsdfksdfkepwfpwe $currentTimeNumber");
    today.value = (DateFormat('dd/MM/yyyy').format(todayDate));
    tommorow.value = (DateFormat('dd/MM/yyyy').format(tommorowDate));
    update();
  }

  getCartDatas()async{
    var response =await ApiHelper.checkOutCartDatas("", "");
    if(response.responseCode == 200){
      cartData = response.data;
      print("Total Data sdfsdf ${cartData?.totals?[0].text}");
      isLoading.value = true;
    }
    update();
  }

  getTimeSlots() async{
    var response = await ApiHelper.timeSlot();
    if(response.responseCode == 200){
      timeSlotDatas.value = response.data!;
      getConvertedDatas();
    }
    update();
  }

  conitnueBtn(context){
    if(passinData[3] == ""){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("please select the time"),
      ));
    }else{
      Get.toNamed(Routes.PAYMENT, arguments: [
        passinData[0],
        passinData[1],
        passinData[2],passinData[3],passinData[4]
      ]);
    }
    print(passinData);
  }

  getConvertedDatas(){
    for(var i= 0; i < timeSlotDatas.value.timeSlots!.length;i++){
      print(double.parse(timeSlotDatas.value.timeSlots?[i].endTime ?? "0"));
      print(currentTimeNumber.value);
      print(currentTimeNumber.value > double.parse(timeSlotDatas.value.timeSlots?[i].endTime ?? "0"));
      var startTime = double.parse(timeSlotDatas.value.timeSlots?[i].startTime ?? "0");
      var endTime = double.parse(timeSlotDatas.value.timeSlots?[i].endTime ?? "0");
      if(startTime <= 13){
        if(12 <= startTime ){
          startTimeList.value.add("${timeSlotDatas.value.timeSlots?[i].startTime} PM");
        }
        startTimeList.value.add("${timeSlotDatas.value.timeSlots?[i].startTime} AM");
      }else{
        var conversion = startTime - 12;
        startTimeList.value.add("${conversion}0 PM");
      }
      if(endTime < 13){
        if(12 <= endTime){
          endTimeList.value.add("${timeSlotDatas.value.timeSlots?[i].endTime} PM");
        }else{
          endTimeList.value.add("${timeSlotDatas.value.timeSlots?[i].endTime} AM");
        }
      }else{
        var conversion = endTime - 12;
        endTimeList.value.add("${conversion}0 PM");
      }
      availableBoolList.value.add(false);
    }
    getCartDatas();
  }

  timeSlotPicked(index){
    availableBoolList.value[index] = !availableBoolList.value[index];
    for(var i= 0;i<availableBoolList.length;i++){
      if(i == index){

      }else if(availableBoolList[i] == true){
          availableBoolList[i] = false;
      }
    }
    if(availableBoolList.value[index]){
      if(selectedDays[0]){
        selectedTimeSlot[1] = today.value;
        passinData[3] = today.value;
      }else{
        selectedTimeSlot[1] = tommorow.value;
        passinData[3] = tommorow.value;
      }
      selectedTimeSlot[0] = timeSlotDatas.value.timeSlots![index].timeSlotId;
      passinData[4] = timeSlotDatas.value.timeSlots![index].timeSlotId;
    }else{
      selectedTimeSlot[0] = "";
      selectedTimeSlot[1] = "";
      passinData[3] = "";
      passinData[4] = "";
    }
    print(selectedTimeSlot);
    update();
    availableBoolList.refresh();
  }
}