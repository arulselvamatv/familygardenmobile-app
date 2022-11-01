import 'dart:convert';

import 'package:family_garden/utils/common_import/common_import.dart';

import '../../../network/api_constants/api_constants.dart';
import '../../../network/api_constants/api_end_points.dart';
import 'package:http/http.dart' as http;

class SearchController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxBool isLoader = false.obs;
  RxList productName = [].obs;

  void onInit() {
    super.onInit();
    searchProducts();
  }

  searchProducts() async {
    isLoader.value = true;
    // var response = await ApiHelper.searchProduct(searchController.text);
    //
    // if(response.isSuccessFul){
    //
    //   print(response.data);
    // }
    String url = "${ApiConstants.baseUrl}${EndPoints.search}";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({'search': "${searchController.text}"});
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var body = jsonDecode(await response.stream.bytesToString());
      productName.value = body['products'];
      isLoader.value = false;
    }
  }
}
