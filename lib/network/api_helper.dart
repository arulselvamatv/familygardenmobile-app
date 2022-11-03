import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:family_garden/models/add_address_model.dart';
import 'package:family_garden/models/add_cart_model.dart';
import 'package:family_garden/models/cart_list_model.dart';
import 'package:family_garden/models/checkout_confirm_model.dart';
import 'package:family_garden/models/checkout_model.dart';
import 'package:family_garden/models/get_token_model.dart';
import 'package:family_garden/models/home_feature_model.dart';
import 'package:family_garden/models/home_slider_model.dart';
import 'package:family_garden/models/login_model.dart';
import 'package:family_garden/models/payment_method_model.dart';
import 'package:flutter_svg/avd.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_count_model.dart';
import '../models/categories_model.dart';
import '../models/category_product_model.dart';
import '../models/checkoutConfirmCODModel.dart';
import '../models/home_features_model.dart';
import '../models/informationDetailsModel.dart';
import '../models/order_history_model.dart';
import '../models/order_info_model.dart';
import '../models/payment_address_save_model.dart';
import '../models/payment_method_save_model.dart';
import '../models/product_detail_model.dart';
import '../models/shipping_method_model.dart';
import '../models/shipping_method_save_model.dart';
import '../models/signupModel.dart';
import '../models/wishlistmodel.dart';
import 'api_constants/api_constants.dart';
import 'api_constants/api_end_points.dart';
import 'http_response_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  // static getToken() async {
  //   final response = await http.post(
  //     Uri.parse("${ApiConstants.baseUrl}${EndPoints.getToken}"),
  //     headers: {
  //       "Content-Type": "application/x-www-form-urlencoded",
  //     },
  //     encoding: Encoding.getByName('utf-8'),
  //     body: {"key": ApiConstants.key},
  //   );
  //   print(response.body);
  // }

  // static String apiToken = "&api_token=${ApiConstants.jwtToken}";

  static Future<HTTPResponse<GetTokenModel>> getToken() async {
    // String url = "${ApiConstants.baseUrl}${EndPoints.category}";
    try {
      final response = await http.post(
        Uri.parse("${ApiConstants.baseUrl}${EndPoints.getToken}"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"key": ApiConstants.key},
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var res = GetTokenModel.fromJson(body);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<HomeSliderModel>> getHomeSliderDetails() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.homeCarousel}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
        // headers: APIConstants.commonHeaders,
        // body: json.encode(jsonString),
      );

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var res = HomeSliderModel.fromJson(body);

        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<CategoriesModel>> getCategories() async {
    String url = "${ApiConstants.baseUrl}${EndPoints.category}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var res = CategoriesModel.fromJson(body);

        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<ProductCategoryModel>> getProductCategory(
      path, page) async {
    // print(path);
    String url = "${ApiConstants.baseUrl}${EndPoints.productCategory}";
    // String url = "https://dev.familygarden.in/${EndPoints.productCategory}";
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'path': path, 'limit': '10', 'page': "$page"});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        // print('getProductCategory $body');
        var res = ProductCategoryModel.fromJson(body);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<ProductDetailsModel>> getProductCategoryDetails(
      productId) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.productCategoryList}&api_token=${ApiConstants.jwtToken}";
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'product_id': "$productId"});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        var res = ProductDetailsModel.fromJson(body);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<HomeFeatureModel>> homeFeature() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.homeFeature}${EndPoints.apiRoutes}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        // var Listresponse = homeFeatureModelFromJson(body);
        var res = HomeFeatureModel.fromJson(body);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<AddCartModel>> addCart(body) async {
    // String url = "${ApiConstants.baseUrl}${EndPoints.category}";
    try {
      // final response = await http.post(
      //     Uri.parse(
      //         "${ApiConstants.baseUrl}${EndPoints.cartAdd}${EndPoints.apiToken}"),
      //     body: body);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      var encodedBody = json.encode(body);
      print("&api_token=${ApiConstants.jwtToken}");
      print(encodedBody);
      var response = await http.post(
          Uri.parse(
              "${ApiConstants.baseUrl}${EndPoints.cartAdd}&api_token=${ApiConstants.jwtToken}"),
          headers: headers,
          body: encodedBody);
      // final uri = Uri.http(
      //     ,
      //     '/path',
      //     body);
      // final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
      // final response = await http.post(uri, headers: headers);

      print(response.body);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var res = AddCartModel.fromJson(body);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<CartListModel>> cartList() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.cartList}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var res = CartListModel.fromJson(body);
        // print("Cart List Model ${res.checkout}");
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<AddCartModel>> addAddress(
      firstName, lastName, address1, country_id, telephone, zone_id) async {
    // String url = "${ApiConstants.baseUrl}${EndPoints.category}";
    try {
      final response = await http.post(
        Uri.parse(
            "${ApiConstants.baseUrl}${EndPoints.cartAdd}&api_token=${ApiConstants.jwtToken}"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {
          'firstname': firstName,
          'lastname': lastName,
          'address_1': address1,
          'country_id': country_id,
          'telephone': telephone,
          'zone_id': zone_id
        },
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var res = AddCartModel.fromJson(body);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<CheckoutModel>> checkOut() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.checkOut}&api_token=${ApiConstants.jwtToken}";
    try {
      print("ApiConstants.jwtToken ${ApiConstants.jwtToken}");
      print("Checkout url : $url");
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        // var Listresponse = homeFeatureModelFromJson(body);
        var res = CheckoutModel.fromJson(body);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future paymentMethod() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.paymentMethod}&api_token=${ApiConstants.jwtToken}";
    var response = await http.post(
      Uri.parse(url),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print('paymentMethod $body');
      return body;
    }
    // var res = AutoGenerate.fromJson(body);
    //     return HTTPResponse(
    //       true,
    //       body,
    //       responseCode: response.statusCode,
    //     );
    //   } else {
    //     return HTTPResponse(
    //       false,
    //       null,
    //       message:
    //           "Invalid response received from server! Please try again in a minute or two.",
    //     );
    //   }
    // } on SocketException {
    //   return HTTPResponse(
    //     false,
    //     null,
    //     message:
    //         "Unable to reach the internet! Please try again in a minute or two.",
    //   );
    // } on FormatException {
    //   return HTTPResponse(
    //     false,
    //     null,
    //     message:
    //         "Invalid response received from server! Please try again in a minute or two.",
    //   );
    // } catch (e) {
    //   print(e);
    //   return HTTPResponse(
    //     false,
    //     null,
    //     message: "Something went wrong! Please try again in a minute or two.",
    //   );
    // }
  }

  static Future<HTTPResponse<PaymentAddressSaveModel>> paymentAddressSave(
      formData) async {
    try {
      var request = http.Request(
          'POST',
          Uri.parse(
              "${ApiConstants.baseUrl}${EndPoints.paymentAddressSave}&api_token=${ApiConstants.jwtToken}"));
      print("&api_token=${ApiConstants.jwtToken}");
      request.bodyFields = {
        'firstname':
            formData["firstname"] == "" && formData["firstname"] == null
                ? "deepa "
                : formData["firstname"],
        'lastname': formData["lastname"] == "" && formData["lastname"] == null
            ? "g"
            : formData["lastname"],
        'address_1':
            formData["address_1"] == "" && formData["address_1"] == null
                ? "chennai"
                : formData["address_1"],
        'city': formData["city"] == "" && formData["city"] == null
            ? "chennai"
            : formData["city"],
        'postcode': "600017",
        'telephone':
            formData["telephone"] == "" && formData["telephone"] == null
                ? "8097700316"
                : formData["telephone"],
        'address_2':
            formData["address_2"] == "" && formData["address_2"] == null
                ? "chennai"
                : formData["address_2"],
        'company': formData["company"] == "" && formData["company"] == null
            ? "atv"
            : formData["company"],
        'email': formData["email"] == "" && formData["email"] == null
            ? "gdeepacse1@gmail.com"
            : formData["email"]
      };
      print("Add address ${request.bodyFields}");
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        print(body);
        var res = PaymentAddressSaveModel.fromJson(body);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<ShippingMethodModel>> shippingMethod() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.shippingMethod}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print("ShippingMethodModel ${body}");
        var res = ShippingMethodModel.fromJson(body);
        // print("ShippingMethodModel ${res.shippingMethods.flat.title}");
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<ShippingMethodSaveModel>>
      shippingMethodSave() async {
    try {
      var request = http.Request(
          'POST',
          Uri.parse(
              "${ApiConstants.baseUrl}${EndPoints.shippingMethodSave}&api_token=${ApiConstants.jwtToken}"));
      print("&api_token=${ApiConstants.jwtToken}");
      request.bodyFields = {'shipping_method': 'flat.flat', 'comment': ''};
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        print("Streamed shipping method response ${body}");
        // var res = ShippingMethodSaveModel.fromJson(body);
        return HTTPResponse(
          true,
          null,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<PaymentMethodSaveModel>> paymentMethodSave(
      data) async {
    var url =
        "${ApiConstants.baseUrl}${EndPoints.paymentMethodSave}&api_token=${ApiConstants.jwtToken}";
    var dio = Dio();
    try {
      var params = {"payment_method": data, "comment": "test", "agree": "1"};
      // var map = new Map<String, dynamic>();
      // map['payment_method'] = "cod";
      // map['comment'] = "";
      // map['agree'] = 1;
      // FormData formData = FormData.fromMap(map);
      var response = await dio.post(url, data: jsonEncode(params));
      print("payment save res ${response.data.toString()}");
      // var body = {"payment_method": "cod", "comment": "test", "agree": "1"};
      // var data = json.encode(body);
      // final response = await http.post(
      //   Uri.parse(
      //       "https://dev.familygarden.in/${EndPoints.paymentMethodSave}&api_token=${ApiConstants.jwtToken}"),
      //   headers: {"Content-Type": "application/json"},
      //   // encoding: Encoding.getByName('utf-8'),
      //   body: data,
      // );
      // print("payment save body ${response.body}");
      //   var request = http.Request(
      //       'POST',
      //       Uri.parse(
      //           "${ApiConstants.baseUrl}${EndPoints.paymentMethodSave}&api_token=${ApiConstants.jwtToken}"));
      //
      //   // encoding: Encoding.getByName('utf-8'),
      // //   headers: {
      // //     "Content-Type": "application/x-www-form-urlencoded",
      // // },
      //   request.bodyFields = {
      //     'comment': '',
      //     'payment_method': 'cod',
      //     'agree': '1'
      //   };
      //   var data = {'comment': '', 'payment_method': 'cod', 'agree': '1'};
      //   print(ApiConstants.jwtToken);
      //   var headers = {
      //     'Content-Type': 'application/x-www-form-urlencoded',
      //   };
      //   request.headers.addAll(headers);
      //   print('request.headers ${request.bodyFields}');
      //   http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // var body = jsonDecode(response);
        // print("payment method save $body");
        // var res = PaymentMethodSaveModel.fromJson(body);
        return HTTPResponse(
          true,
          null,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<CheckoutConfirmModel>> checkOutConfirm() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.checkoutConfirm}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print("body ${body}");
        var res = CheckoutConfirmModel.fromJson(body);

        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print("Error on checkout confirm $e");
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<CheckoutConfirmCODModel>>
      checkOutCODConfirm() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.checkoutConfirm}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print("body ${body}");
        var res = CheckoutConfirmCODModel.fromJson(body);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print("Error on checkout confirm $e");
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<LoginModel>> login(email, password) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.login}&api_token=${ApiConstants.jwtToken}";
    print("login url ${url}");
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'email': email, 'password': password});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print(url);
        var body = jsonDecode(await response.stream.bytesToString());
        print(body);
        var res = LoginModel.fromJson(body);
        // print(res.errorWarning);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<SignupModel>> signup(
      firstname, lastname, email, telephone, password, confirm, agree) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.signup}&api_token=${ApiConstants.jwtToken}";
    try {
      print({
        'firstname': firstname,
        'lastname': "g",
        'email': email,
        'telephone': telephone,
        'password': password,
        'confirm': confirm,
        'agree': '1'
      });
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({
        'firstname': firstname,
        'lastname': "g",
        'email': email,
        'telephone': telephone,
        'password': password,
        'confirm': confirm,
        'agree': '1'
      });
      http.StreamedResponse response = await request.send();
      print(response);
      if (response.statusCode == 200) {
        // var body = jsonDecode(response.body);
        var body = jsonDecode(await response.stream.bytesToString());
        print(body);
        var res = SignupModel.fromJson(body);
        // print(res.errorWarning);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<AddAddressModel>> addAddresses(
      firstname,
      lastname,
      address_1,
      country_id,
      zone_id,
      telephone,
      city,
      postcode,
      company,
      address_2) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.addAddress}&api_token=${ApiConstants.jwtToken}";
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var request = http.Request('POST', Uri.parse(url));
      request.bodyFields = {
        'firstname': firstname,
        'lastname': lastname,
        'address_1': address_1,
        'country_id': country_id,
        'zone_id': zone_id,
        'telephone': telephone,
        'city': city,
        'postcode': postcode,
        'company': company,
        'address_2': address_2
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        print("body $body");
        var res = AddAddressModel.fromJson(body);
        // print(res.errorWarning);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static cartCount() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.cartCount}&api_token=${ApiConstants.jwtToken}";
    // try {
    var response = await http.post(
      Uri.parse(url),
    );
    return jsonDecode(response.body);
    //   if (response.statusCode == 200) {
    //     var body = jsonDecode(response.body);
    //     print("body ${body}");
    //     var res = cartCountModel.fromJson(body);
    //     return HTTPResponse(
    //       true,
    //       res,
    //       responseCode: response.statusCode,
    //     );
    //   } else {
    //     return HTTPResponse(
    //       false,
    //       null,
    //       message:
    //           "Invalid response received from server! Please try again in a minute or two.",
    //     );
    //   }
    // } on SocketException {
    //   return HTTPResponse(
    //     false,
    //     null,
    //     message:
    //         "Unable to reach the internet! Please try again in a minute or two.",
    //   );
    // } on FormatException {
    //   return HTTPResponse(
    //     false,
    //     null,
    //     message:
    //         "Invalid response received from server! Please try again in a minute or two.",
    //   );
    // } catch (e) {
    //   print(e);
    //   return HTTPResponse(
    //     false,
    //     null,
    //     message: "Something went wrong! Please try again in a minute or two.",
    //   );
    // }
  }

  static Future<HTTPResponse<HomeFeaturesModel>> getHomeFeatures() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.homeFeature}${EndPoints.apiRoutes}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        // var Listresponse = homeFeatureModelFromJson(body);
        var res = HomeFeaturesModel.fromJson(body);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<OrderInfoModel>> getOrderInfo(
      String orderID) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.getOrderInfoEndpoint}&api_token=${ApiConstants.jwtToken}";
    print(url);

    var dio = Dio();
    try {
      var map = new Map<String, dynamic>();
      map['order_id'] = orderID;
      FormData formData = FormData.fromMap(map);
      var response = await dio.post(url, data: formData);
      print(response.data.toString());
      var res = OrderInfoModel.fromJson(jsonDecode(response.data));
      return HTTPResponse(
        true,
        res,
        responseCode: response.statusCode,
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    }
    // print(orderID);
    // try {
    // }
    //   var request = new http.MultipartRequest("POST", Uri.parse(url));
    //
    //   request.fields['order_id'] = orderID;
    //   http.Response response =
    //       await http.Response.fromStream(await request.send());
    //   print(response.statusCode.toString());
    //
    //   if (response.statusCode == 200) {
    //     var res = OrderInfoModel.fromJson(jsonDecode(response.body));
    //     return HTTPResponse(
    //       true,
    //       res,
    //       responseCode: response.statusCode,
    //     );
    //   } else {
    //     return HTTPResponse(
    //       false,
    //       null,
    //       message:
    //           "Invalid response received from server! Please try again in a minute or two.",
    //     );
    //   }
    // } on SocketException {
    //   return HTTPResponse(
    //     false,
    //     null,
    //     message:
    //         "Unable to reach the internet! Please try again in a minute or two.",
    //   );
    // } on FormatException {
    //   return HTTPResponse(
    //     false,
    //     null,
    //     message:
    //         "Invalid response received from server! Please try again in a minute or two.",
    //   );
    // } catch (e, stacktrace) {
    //   print({e, stacktrace.toString()});
    //   return HTTPResponse(
    //     false,
    //     null,
    //     message: "Something went wrong! Please try again in a minute or two.",
    //   );
    // }
  }

  static Future<HTTPResponse<OrderHistoryModel>> getOrders() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.getOrdersEndpoint}&api_token=${ApiConstants.jwtToken}";
    print(url);
    // print(EndPoints.apiToken);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        var res = OrderHistoryModel.fromJson(body);
        print(OrderHistoryModel.fromJson(body).toJson());
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<WishListModel>> getWishList() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.wishList}&api_token=${ApiConstants.jwtToken}";
    print(url);
    // print(EndPoints.apiToken);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = json.decode(await response.stream.bytesToString());
        var res = WishListModel.fromJson(body);
        print(res);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<AddCartModel>> removeWishList(productId) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.wishList}&api_token=${ApiConstants.jwtToken}";
    print(url);
    print(ApiConstants.jwtToken);
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'remove': "$productId"});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        print(body);
        var res = AddCartModel.fromJson(body);
        print(AddCartModel.fromJson(body).toJson());
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<Null>> updatePassword(
      String password, String confirmPassword) async {
    // String url = "${ApiConstants.baseUrl}${EndPoints.category}";
    try {
      final response = await http.post(
        Uri.parse(
            "${ApiConstants.baseUrl}${EndPoints.updatePassword}&api_token=${ApiConstants.jwtToken}"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {
          'password': password,
          'confirm': confirmPassword,
        },
      );
      var body = jsonDecode(response.body);
      print(body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return HTTPResponse(
          true,
          null,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<PaymentAddressSaveModel>>
      existingPaymentAddressSave(formData) async {
    try {
      var request = http.Request(
          'POST',
          Uri.parse(
              "${ApiConstants.baseUrl}${EndPoints.paymentExistingAddressSave}&api_token=${ApiConstants.jwtToken}"));
      print("&api_token=${ApiConstants.jwtToken}");
      request.bodyFields = {
        'payment_address': 'existing',
        'address_id': '${formData['address_id']}'
        // 'firstname':
        //     formData["firstname"] == "" && formData["firstname"] == null
        //         ? "deepa "
        //         : formData["firstname"],
        // 'lastname': formData["lastname"] == "" && formData["lastname"] == null
        //     ? "g"
        //     : formData["lastname"],
        // 'address_1':
        //     formData["address_1"] == "" && formData["address_1"] == null
        //         ? "chennai"
        //         : formData["address_1"],
        // 'city': formData["city"] == "" && formData["city"] == null
        //     ? "chennai"
        //     : formData["city"],
        // 'postcode': "600017",
        // 'telephone':
        //     formData["telephone"] == "" && formData["telephone"] == null
        //         ? "8097700316"
        //         : formData["telephone"],
        // 'address_2':
        //     formData["address_2"] == "" && formData["address_2"] == null
        //         ? "chennai"
        //         : formData["address_2"],
        // 'company': formData["company"] == "" && formData["company"] == null
        //     ? "atv"
        //     : formData["company"],
        // 'email': formData["email"] == "" && formData["email"] == null
        //     ? "gdeepacse1@gmail.com"
        //     : formData["email"]
      };
      print("Add address ${request.bodyFields}");
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        print('paymentAddressSave $body');
        var res = PaymentAddressSaveModel.fromJson(body);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<int> logOut() async {
    var req = await http.get(Uri.parse(
        "${ApiConstants.baseUrl}${EndPoints.loguout}?&api_token=${ApiConstants.jwtToken}"));
    if (req.statusCode == 200) {
      var body = json.decode(req.body);
      if (body["status"] == 1) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('Login', "false");
        return 1;
      }

      // print(body);
    }
    return 0;
  }

  static orderSuccess() async {
    var req = await http.post(Uri.parse(
        "${ApiConstants.baseUrl}${EndPoints.orderSuccess}&api_token=${ApiConstants.jwtToken}"));
    print("Order success Statuscode ${req.statusCode}");
    if (req.statusCode == 200) {
      var body = json.decode(req.body);
      print("Order success Response ${body}");
      return body["orderDetails"]["order_id"];
    }
    return "0";
  }

  static Future<int> accountUpdate(
      firstName, lastName, emailId, telephone) async {
    var req = await http.post(
      Uri.parse(
          "${ApiConstants.baseUrl}${EndPoints.editAccount}&api_token=${ApiConstants.jwtToken}"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        'firstname': firstName,
        'lastname': lastName,
        'email': emailId,
        'telephone': telephone,
      },
    );
    if (req.statusCode == 200) {
      var body = json.decode(req.body);
      print(body);
      return body["status"];
    }
    return 0;
  }

  static addWishList(String productId) async {
    var req = await http.post(
        Uri.parse(
            "${ApiConstants.baseUrl}${EndPoints.addWishList}&api_token=${ApiConstants.jwtToken}"),
        body: {'product_id': productId});
    if (req.statusCode == 200) {
      print(json.decode(req.body));
    } else {
      print("Failure wishlist");
    }
  }

  static informationApi() async {
    // var req = await http.post(
    //     Uri.parse(
    //         "${ApiConstants.baseUrl}/index.php?route=mobileapi/information&api_token=${ApiConstants.jwtToken}"),
    //     body: {'information_id': '10'});
    var req = await http.post(
        Uri.parse(
            "https://dev.familygarden.in//index.php?route=mobileapi/information&api_token=${ApiConstants.jwtToken}"),
        body: {'information_id': '10'});
  }

  static Future<HTTPResponse<informationDetailsModel>>
      informationDetails() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.informationDetails}&api_token=${ApiConstants.jwtToken}";
    // String url =
    //     "https://dev.familygarden.in/${EndPoints.informationDetails}&api_token=${ApiConstants.jwtToken}";
    print(url);
    print(ApiConstants.jwtToken);
    try {
      var response =
          await http.post(Uri.parse(url), body: {'information_id': '10'});
      // var request = http.MultipartRequest('POST', Uri.parse(url));
      // request.fields.addAll({'remove': "$productId"});
      // http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print("Information API $body");
        var res = informationDetailsModel.fromJson(body);
        return HTTPResponse(
          true,
          res,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message:
              "Invalid response received from server! Please try again in a minute or two.",
        );
      }
    } on SocketException {
      return HTTPResponse(
        false,
        null,
        message:
            "Unable to reach the internet! Please try again in a minute or two.",
      );
    } on FormatException {
      return HTTPResponse(
        false,
        null,
        message:
            "Invalid response received from server! Please try again in a minute or two.",
      );
    } catch (e) {
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  // static removeWishList(String productId) async {
  //   var req = await http.post(
  //       Uri.parse(
  //           "${ApiConstants.baseUrl}${EndPoints.addWishList}&api_token=${ApiConstants.jwtToken}"),
  //       body: {'product_id': productId});
  //   if (req.statusCode == 200) {
  //     print(json.decode(req.body));
  //   } else {
  //     print("Failure wishlist");
  //   }
  // }
}
