import 'package:family_garden/utils/common_import/common_import.dart';

class TimeAndOrderConfirmationController extends GetxController{
  RxList inBetweenTime = ["7.00 AM - 9.00 AM","10.00 AM - 12.00 PM","03.00 PM - 05.00 PM","06.00 PM - 08.00 PM",].obs;
  RxList inBetweenTimeValid = [false,true,true,false].obs;
  RxList boolList = [false,true,true,false].obs;
  RxList products = ["Apple","Banana","Cherry","Mango"].obs;
  RxList category = ["Fruits","Fruits","Fruits","Fruits"].obs;
  RxList qty = ["1","1","1","1"].obs;
  RxList price = ["₹40.00","₹125.00","₹160.00","₹109.00"].obs;
  RxString subTotal = "₹720.00".obs;
  RxString flatShippingRate = "₹720.00".obs;
  RxString couponRate = "₹720.00".obs;
}