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
  static Future<HTTPResponse<GetTokenModel>> getToken() async {
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
    String url = "${ApiConstants.baseUrl}${EndPoints.productCategory}";
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'path': path, 'limit': '10', 'page': "$page"});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
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
      print(e);
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
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      var encodedBody = json.encode(body);
      var response = await http.post(
          Uri.parse(
              "${ApiConstants.baseUrl}${EndPoints.cartAdd}&api_token=${ApiConstants.jwtToken}"),
          headers: headers,
          body: encodedBody);
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

  static Future<HTTPResponse<CartListModel>> cartList() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.cartList}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var res = CartListModel.fromJson(body);
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
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
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
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return body;
    }
  }

  static Future<HTTPResponse<PaymentAddressSaveModel>> paymentAddressSave(
      formData) async {
    try {
      var request = http.Request(
          'POST',
          Uri.parse(
              "${ApiConstants.baseUrl}${EndPoints.paymentAddressSave}&api_token=${ApiConstants.jwtToken}"));
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
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
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
        var res = ShippingMethodModel.fromJson(body);
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
      request.bodyFields = {'shipping_method': 'flat.flat', 'comment': ''};
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
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
      var response = await dio.post(url, data: jsonEncode(params));
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

  static Future<HTTPResponse<CheckoutConfirmModel>> checkOutConfirm() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.checkoutConfirm}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
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
      print(e);
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
      print(e);
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
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'email': email, 'password': password});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        var res = LoginModel.fromJson(body);
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
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        var res = SignupModel.fromJson(body);
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
        var res = AddAddressModel.fromJson(body);
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
    var response = await http.post(
      Uri.parse(url),
    );
    return jsonDecode(response.body);
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
    var dio = Dio();
    try {
      var map = new Map<String, dynamic>();
      map['order_id'] = orderID;
      FormData formData = FormData.fromMap(map);
      var response = await dio.post(url, data: formData);
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
  }

  static Future<HTTPResponse<OrderHistoryModel>> getOrders() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.getOrdersEndpoint}&api_token=${ApiConstants.jwtToken}";
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        var res = OrderHistoryModel.fromJson(body);
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
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = json.decode(await response.stream.bytesToString());
        var res = WishListModel.fromJson(body);
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
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'remove': "$productId"});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
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
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<Null>> updatePassword(
      String password, String confirmPassword) async {
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
      request.bodyFields = {
        'payment_address': 'existing',
        'address_id': '${formData['address_id']}'
      };
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
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
    }
    return 0;
  }

  static orderSuccess() async {
    var req = await http.post(Uri.parse(
        "${ApiConstants.baseUrl}${EndPoints.orderSuccess}&api_token=${ApiConstants.jwtToken}"));
    if (req.statusCode == 200) {
      var body = json.decode(req.body);
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
    } else {
      print("Failure wishlist");
    }
  }

  static Future<HTTPResponse<informationDetailsModel>>
      informationDetails() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.informationDetails}&api_token=${ApiConstants.jwtToken}";
    try {
      var response =
          await http.post(Uri.parse(url), body: {'information_id': '10'});
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
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
}
