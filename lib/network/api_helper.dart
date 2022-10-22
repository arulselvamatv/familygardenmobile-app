import 'dart:convert';
import 'dart:io';
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
import '../models/categories_model.dart';
import '../models/category_product_model.dart';
import '../models/payment_address_save_model.dart';
import '../models/payment_method_save_model.dart';
import '../models/product_detail_model.dart';
import '../models/shipping_method_model.dart';
import '../models/shipping_method_save_model.dart';
import '../models/signupModel.dart';
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
        "${ApiConstants.baseUrl}${EndPoints.homeCarousel}${EndPoints.apiToken}";
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
      path) async {
    String url = "${ApiConstants.baseUrl}${EndPoints.productCategory}";
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'path': path, 'limit': '75'});
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
    String url = "${ApiConstants.baseUrl}${EndPoints.productCategoryList}";
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
        "${ApiConstants.baseUrl}${EndPoints.homeFeature}${EndPoints.apiRoutes}${EndPoints.apiToken}";
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
      print(EndPoints.apiToken);
      print(encodedBody);
      var response = await http.post(
          Uri.parse(
              "${ApiConstants.baseUrl}${EndPoints.cartAdd}${EndPoints.apiToken}"),
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
        "${ApiConstants.baseUrl}${EndPoints.cartList}${EndPoints.apiToken}";
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
    // String url = "${ApiConstants.baseUrl}${EndPoints.category}";
    try {
      final response = await http.post(
        Uri.parse(
            "${ApiConstants.baseUrl}${EndPoints.cartAdd}${EndPoints.apiToken}"),
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
        "${ApiConstants.baseUrl}${EndPoints.checkOut}${EndPoints.apiToken}";
    try {
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
        "${ApiConstants.baseUrl}${EndPoints.paymentMethod}${EndPoints.apiToken}";
    var response = await http.post(
      Uri.parse(url),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print(body);
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
              "${ApiConstants.baseUrl}${EndPoints.paymentAddressSave}${EndPoints.apiToken}"));
      print(EndPoints.apiToken);
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
        "${ApiConstants.baseUrl}${EndPoints.shippingMethod}${EndPoints.apiToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var res = ShippingMethodModel.fromJson(body);
        print(res.shippingMethods.flat.title);
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
              "${ApiConstants.baseUrl}${EndPoints.shippingMethodSave}${EndPoints.apiToken}"));
      print(EndPoints.apiToken);
      request.bodyFields = {'shipping_method': 'flat.flat', 'comment': ''};
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        print(body);
        var res = ShippingMethodSaveModel.fromJson(body);
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

  static Future<HTTPResponse<PaymentMethodSaveModel>>
      paymentMethodSave() async {
    try {
      var request = http.Request(
          'POST',
          Uri.parse(
              "${ApiConstants.baseUrl}${EndPoints.paymentMethodSave}${EndPoints.apiToken}"));
      request.bodyFields = {
        'comment': '',
        'payment_method': 'ccavenuepay',
        'agree': '1'
      };
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        print(body);
        var res = PaymentMethodSaveModel.fromJson(body);
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

  static Future<HTTPResponse<CheckoutConfirmModel>> checkOutConfirm() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.checkoutConfirm}${EndPoints.apiToken}";
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
        "${ApiConstants.baseUrl}${EndPoints.login}${EndPoints.apiToken}";
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'email': email, 'password': password});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        // var body = jsonDecode(response.body);
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
        "${ApiConstants.baseUrl}${EndPoints.signup}${EndPoints.apiToken}";
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
        "${ApiConstants.baseUrl}${EndPoints.addAddress}${EndPoints.apiToken}";
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
}
