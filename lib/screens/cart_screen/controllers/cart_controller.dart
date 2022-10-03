import 'package:get/get.dart';
import '../../../utils/common_import/common_import.dart';

class CartController extends GetxController{

  TextEditingController search = TextEditingController();
  TextEditingController cuponCode = TextEditingController();

  List cartList = [
    {'name' : 'Carrot', 'nameInTamil' : 'கேரட்', 'price' : '₹32.00', 'oldPrice' : '₹35.00', 'offer' : '9% OFF', 'image' : 'assets/images/Carrot.png','grams' : '250 grams'},
    {'name' : 'Coriander Leaves', 'nameInTamil' : 'கொத்தமல்லி தழை ', 'price' : '₹15.00', 'oldPrice' : '₹30.00', 'offer' : '50% OFF', 'image' : 'assets/images/coriander.png','grams' : '1 bunch'},
    {'name' : 'Apple 3piece-450-550gm', 'nameInTamil' : 'ஆப்பிள் ', 'price' : '₹125.00', 'oldPrice' : '₹150.00', 'offer' : '17% OFF', 'image' : 'assets/images/apple.png','grams' : '1 pack'},
  ];

}