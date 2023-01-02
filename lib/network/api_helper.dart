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
import 'package:family_garden/models/profile_update_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/accountOtpModel.dart';
import '../models/account_address_model.dart';
import '../models/categories_model.dart';
import '../models/category_product_model.dart';
import '../models/change_password_model.dart';
import '../models/checkoutConfirmCODModel.dart';
import '../models/checkout_cart_datas_model.dart';
import '../models/coupon_model.dart';
import '../models/delete_account_model.dart';
import '../models/delete_address_model.dart';
import '../models/edit_address_model.dart';
import '../models/forgotPasswordModel.dart';
import '../models/home_features_model.dart';
import '../models/informationDetailsModel.dart';
import '../models/order_history_model.dart';
import '../models/order_info_model.dart';
import '../models/payment_address_save_model.dart';
import '../models/payment_method_save_model.dart';
import '../models/product_detail_model.dart';
import '../models/re_create_session_model.dart';
import '../models/shipping_method_model.dart';
import '../models/shipping_method_save_model.dart';
import '../models/signupModel.dart';
import '../models/time_slot_model.dart';
import '../models/verifyOtpModel.dart';
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
        body: {"key": ApiConstants.getTokenkey},
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
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
        "${ApiConstants.baseUrl}${EndPoints.homeFeature}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var res = HomeFeatureModel.fromJson(body);
        print("res.logged ${res.logged}");

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

  static Future<HTTPResponse<AddCartModel>> addCart(bodys, bool logged) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      var encodedBody = json.encode(bodys);
      var response = await http.post(
          Uri.parse(
              "${ApiConstants.baseUrl}${EndPoints.cartAdd}&api_token=${ApiConstants.jwtToken}"),
          headers: headers,
          body: encodedBody);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var res = AddCartModel.fromJson(body);
        if (!logged) {
          if (res.logged == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              addCart(bodys, true);
              logged = true;
            } else {}
          }
        }
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

  static Future<HTTPResponse<CartListModel>> cartList(bool logged) async {
    print("Called cart screen");
    String url =
        "${ApiConstants.baseUrl}${EndPoints.cartList}&api_token=${ApiConstants.jwtToken}";
    print("Cart URL $url");
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var res = CartListModel.fromJson(body);
        print("Cart Logged ${res.logged}");
        if (!logged) {
          if (res.logged == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              cartList(true);
            }
          }
        }
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

  static Future<HTTPResponse<CheckoutModel>> checkOut(bool logged) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.checkOut}&api_token=${ApiConstants.jwtToken}";
    print("Checkout URL $url");
    try {
      print(ApiConstants.jwtToken);
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var res = CheckoutModel.fromJson(body);
        print("checkout Logged ${res.logged}");
        if (!logged) {
          if (res.logged == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              checkOut(true);
              logged = true;
            }
          }
        }
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

  static Future paymentMethod(bool logged) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.paymentMethod}&api_token=${ApiConstants.jwtToken}";
    var response = await http.post(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      if (!logged) {
        if (body["logged"] == null) {
          var res = await reCreateSession();
          if (res.responseCode == 200) {
            paymentMethod(true);
            logged = true;
          }
        }
      }
      // if(body["logged"] == null){
      //   var res = await reCreateSession();
      //   if(res.responseCode == 200){
      //     paymentMethod();
      //   }
      // }
      return body;
    }
  }

  static Future<HTTPResponse<PaymentAddressSaveModel>> paymentAddressSave(
      formData, bool logged) async {
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
        if (!logged) {
          if (res.logged == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              paymentAddressSave(formData, true);
              logged = true;
            }
          }
        }
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

  static Future<HTTPResponse<ShippingMethodModel>> shippingMethod(
      bool logged) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.shippingMethod}&api_token=${ApiConstants.jwtToken}";
    try {
      print(url);
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var res = ShippingMethodModel.fromJson(body);
        if (!logged) {
          if (res.logged == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              shippingMethod(true);
              logged = true;
            }
          }
        }
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

  static Future<HTTPResponse<ShippingMethodSaveModel>> shippingMethodSave(
      logged) async {
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
        if (!logged) {
          if (body["logged"] == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              shippingMethodSave(true);
              logged = true;
            }
          }
        }
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
      print(" sdasd $e");
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<CheckoutCartDatasModel>> checkOutCartDatas(
      String date, String timeSlotId, bool logged) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.checkoutConfirm}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print("response of coConfirm $body");
        var res = CheckoutCartDatasModel.fromJson(body);
        if (!logged) {
          if (res.logged == null) {
            var response = await reCreateSession();
            if (response.responseCode == 200) {
              checkOutCartDatas(date, timeSlotId, true);
              logged = true;
            }
          }
        }
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
      print("sdfsdf $e");
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<CheckoutConfirmModel>> checkOutConfirm(
      String date, String timeSlotId) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.checkoutConfirm}&api_token=${ApiConstants.jwtToken}";
    try {
      var passingBody = {"date": date, "time": timeSlotId};
      var response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print("response of CCAVENUE $body");
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
      print("CC Avenue $e");
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<CheckoutCartDatasModel>> checkOutCODConfirm(
      String date, String timeSlotId) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.checkoutConfirm}&api_token=${ApiConstants.jwtToken}";
    try {
      var passingBody = {"date": date, "time": timeSlotId};
      var response =
          await http.post(Uri.parse(url), body: json.encode(passingBody));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var res = CheckoutCartDatasModel.fromJson(body);
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
      // await getToken();
      var prefs = await SharedPreferences.getInstance();
      String deviceId = DateTime.now().microsecondsSinceEpoch.toString();
      print("Device Id : $deviceId");
      prefs.setString("device_id", deviceId);
      // var request = http.MultipartRequest('POST', Uri.parse(url));
      var request = http.Request('POST', Uri.parse(url));
      request.bodyFields = {
        'email': email,
        'password': password,
        'device_id': deviceId
      };
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        print("Login Body $body");
        var res = LoginModel.fromJson(body);
        print("User TOken : ${res.userToken}");
        prefs.setString("userToken", res.userToken ?? "");
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
      print("Error in login");
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<SignupModel>> signup(
      firstname, email, telephone, password, confirm, agree) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.signup}&api_token=${ApiConstants.jwtToken}";
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({
        'firstname': firstname,
        'email': email,
        'telephone': telephone,
        'password': password,
        'confirm': confirm,
        'agree': '1'
      });
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        print("only for success state ${body["status"]}");
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
      address_1,
      countryId,
      zoneId,
      telephone,
      city,
      postcode,
      bool logged) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.addAddress}&api_token=${ApiConstants.jwtToken}";
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var request = http.Request('POST', Uri.parse(url));
      request.bodyFields = {
        'firstname': firstname,
        'address_1': address_1,
        'country_id': countryId,
        'zone_id': zoneId,
        'telephone': telephone,
        'city': city,
        'postcode': postcode
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        print(body);
        var res = AddAddressModel.fromJson(body);
        if (!logged) {
          if (res.logged == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              addAddresses(firstname, address_1, countryId, zoneId, telephone,
                  city, postcode, true);
            }
          }
        }

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
    var res = jsonDecode(response.body);
    // if(res["logged"] == null){
    //   var res = await reCreateSession();
    //   if(res.responseCode == 200){
    //     cartCount();
    //   }
    // }
    return res;
  }

  static Future<HTTPResponse<HomeFeaturesModel>> getHomeFeatures() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.homeFeature}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        // print("Response Body $body");
        var res = HomeFeaturesModel.fromJson(body);
        print(res.logged);
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

  static Future<HTTPResponse<OrderHistoryModel>> getOrders(bool logged) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.getOrders}&api_token=${ApiConstants.jwtToken}";
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        print(body);
        var res = OrderHistoryModel.fromJson(body);
        if(!logged){
          if (res.logged == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              getOrders(true);
            }
          }
        }
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

  static Future<HTTPResponse<WishListModel>> getWishList(bool logged) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.wishList}&api_token=${ApiConstants.jwtToken}";
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = json.decode(await response.stream.bytesToString());
        print(body);
        var res = WishListModel.fromJson(body);
        if(!logged){
          if (res.logged == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              getWishList(true);
            }
          }
        }
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

  static Future<HTTPResponse<AddCartModel>> removeWishList(
      productId, optionId, optionValueId,bool logged) async {
    print("Product details");
    var bodys;
    if (optionId == "") {
      bodys = {'product_id': productId};
    } else {
      bodys = {
        "product_id": productId,
        "product_option_id": optionId,
        "prodcut_option_value_id": optionValueId
      };
    }
    print("product");
    String url =
        "${ApiConstants.baseUrl}${EndPoints.wishList}&api_token=${ApiConstants.jwtToken}";
    try {
      print("product");
      var response = await http.post(Uri.parse(url), body: json.encode(bodys));
      // var request = http.MultipartRequest('POST', Uri.parse(url));
      // request.fields.addAll({'remove': "$productId"});
      // http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        print(body);
        var res = AddCartModel.fromJson(body);
        if(!logged){
          if (res.logged == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              removeWishList(productId, optionId, optionValueId,true);
            }
          }
        }
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

  static Future<HTTPResponse<ForgotPasswordModel>> forgotPassword(
      String password, String confirmPassword, String mobileNum) async {
    try {
      print("Upgrade password ${{
        'new_password': password.toString(),
        'confirm_password': confirmPassword.toString(),
        'telephone': mobileNum.toString(),
      }}");
      var body1 = {
        'new_password': password.toString(),
        'confirm_password': confirmPassword.toString(),
        'telephone': mobileNum.toString(),
      };
      final response = await http.post(
        Uri.parse(
            "${ApiConstants.baseUrl}${EndPoints.forgotPassword}&api_token=${ApiConstants.jwtToken}"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: body1,
      );
      print("PASSWORD::::${response.body}");

      var body = jsonDecode(response.body);
      var res = ForgotPasswordModel.fromJson(body);
      // if (res.logged == null) {
      //   var res = await reCreateSession();
      //   if (res.responseCode == 200) {
      //     forgotPassword(password, confirmPassword, mobileNum);
      //   }
      // }
      if (response.statusCode == 200) {
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
      print("Upgrade password1");

      print(e);
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<ChangePasswordModel>> updatePassword(
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
      print("PASSWORD::::${response.body}");

      var body = jsonDecode(response.body);
      var res = ChangePasswordModel.fromJson(body);

      // if (res.logged == null) {
      //   var res = await reCreateSession();
      //   if (res.responseCode == 200) {
      //     updatePassword(password, confirmPassword);
      //   }
      // }
      if (response.statusCode == 200) {
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

  static Future<HTTPResponse<ChangeProfileModel>> accountUpdate(
      firstName, lastName, emailId, telephone,bool logged) async {
    try {
      var response = await http.post(
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
      print("PASSWORD::::${response.body}");

      var body = jsonDecode(response.body);
      var res = ChangeProfileModel.fromJson(body);
      if(!logged){
        if (res.logged == null) {
          var res = await reCreateSession();
          if (res.responseCode == 200) {
            accountUpdate(firstName, lastName, emailId, telephone,true);
          }
        }
      }

      if (response.statusCode == 200) {
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

  static Future<HTTPResponse<PaymentAddressSaveModel>>
      existingPaymentAddressSave(formData,bool logged) async {
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
        if(!logged){
          if(res.logged == null){
            var res =await reCreateSession();
            if(res.responseCode == 200){
              existingPaymentAddressSave(formData,true);
            }
          }
        }
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
        prefs.remove("device_id");
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

  static addWishList(
      String productId, String optionId, String optionValueId) async {
    var body;
    if (optionId == "") {
      body = {'product_id': productId};
    } else {
      body = {
        "product_id": productId,
        "product_option_id": optionId,
        "prodcut_option_value_id": optionValueId
      };
    }
    var req = await http.post(
        Uri.parse(
            "${ApiConstants.baseUrl}${EndPoints.addWishList}&api_token=${ApiConstants.jwtToken}"),
        body: json.encode(body));
    print(body);
    if (req.statusCode == 200) {
      print(req.body);
    } else {
      print("Failure wishlist");
    }
  }

  static Future<HTTPResponse<InformationDetailsModel>>
      informationDetails(bool logged) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.informationDetails}&api_token=${ApiConstants.jwtToken}";
    try {
      var response =
          await http.post(Uri.parse(url), body: {'information_id': '10'});
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var res = InformationDetailsModel.fromJson(body);
        if(!logged){
          if(res.logged == null){
            var res = await reCreateSession();
            if(res.responseCode == 200){
              informationDetails(true);
            }
          }
        }
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

  static Future<HTTPResponse<AccountAddressModel>> accountAddress(bool logged) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.accountAdress}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var res = AccountAddressModel.fromJson(body);
        if(!logged){
          if (res.logged == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              accountAddress(true);
            }
          }
        }
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

  static Future<HTTPResponse<OrderInfoModel>> getOrder(bool logged,{required int orderId}) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.getOrdersEndpoint}&api_token=${ApiConstants.jwtToken}";
    try {
      var response =
          await http.post(Uri.parse(url), body: {'order_id': '$orderId'});
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var res = OrderInfoModel.fromJson(body);
        if(!logged){
          if (res.logged == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              getOrder(true,orderId: orderId);
            }
          }
        }
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
      print("e $e");
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<OrderInfoModel>> getOrderInfo(
      bool logged,{required int orderId}) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.getOrdersEndpoint}&api_token=${ApiConstants.jwtToken}";
    try {
      print(url);
      print(orderId);

      var response =
          await http.post(Uri.parse(url), body: {'order_id': '$orderId'});
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var res = OrderInfoModel.fromJson(body);
        print('sub total: ${res.subTotals?.value}');
        print('total: ${res.totals?.value}');
        print('shipping: ${res.shipping?.value}');
        if(!logged){
          if (res.logged == null) {
            var res = await reCreateSession();
            if(res.responseCode == 200){
              getOrder(true,orderId: orderId);
            }
          }
        }
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
      print("e $e");
      return HTTPResponse(
        false,
        null,
        message: "Something went wrong! Please try again in a minute or two.",
      );
    }
  }

  static Future<HTTPResponse<CouponModel>> getCoupon(couponCode,bool logged) async {
    try {
      final response = await http.post(
        Uri.parse(
            "${ApiConstants.baseUrl}${EndPoints.coupon}&api_token=${ApiConstants.jwtToken}"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"coupon": couponCode},
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var res = CouponModel.fromJson(body);
        if(!logged){
          if (res.logged == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              getCoupon(couponCode,true);
            }
          }
        }

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

  static Future<HTTPResponse<DeleteAddressModel>> deleteAddress(
      String addressId,bool logged) async {
    try {
      final response = await http.post(
        Uri.parse(
            "${ApiConstants.baseUrl}${EndPoints.deleteAddress}&api_token=${ApiConstants.jwtToken}"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {
          'address_id': addressId,
        },
      );
      print("PASSWORD::::${response.body}");

      var body = jsonDecode(response.body);
      var res = DeleteAddressModel.fromJson(body);
      if(!logged){
        if (res.logged == null) {
          var res = await reCreateSession();
          if (res.responseCode == 200) {
            deleteAddress(addressId,true);
          }
        }
      }
      if (response.statusCode == 200) {
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

  static Future<HTTPResponse<EditAddressModel>> editAddress(
      addressId,
      firstname,
      address_1,
      countryId,
      zoneId,
      telephone,
      city,
      postcode,bool logged) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.editAddres}&api_token=${ApiConstants.jwtToken}";
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var request = http.Request('POST', Uri.parse(url));
      request.bodyFields = {
        'address_id': addressId,
        'firstname': firstname,
        'address_1': address_1,
        'country_id': countryId,
        'zone_id': zoneId,
        'telephone': telephone,
        'city': city,
        'postcode': postcode
      };
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        print(body);
        var res = EditAddressModel.fromJson(body);
        if(!logged){
          if (res.logged == 200) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              editAddress(addressId, firstname, address_1, countryId, zoneId,
                  telephone, city, postcode,true);
            }
          }
        }
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

  static addressDetails(addressId) async {
    var url = Uri.parse(
        "${ApiConstants.baseUrl}${EndPoints.addressView}&api_token=${ApiConstants.jwtToken}");
    var response = await http.post(url, body: {'address_id': addressId});
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return json.decode(response.body);
    }
    return null;
  }

  static Future<HTTPResponse<accountOtpModel>> accountOtpSend(mobileNum) async {
    try {
      final response = await http.post(
        Uri.parse(
            "${ApiConstants.baseUrl}${EndPoints.accountOtpSend}&api_token=${ApiConstants.jwtToken}"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"telephone": mobileNum},
      );
      print({"telephone": mobileNum});
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var res = accountOtpModel.fromJson(body);
        // if (res.logged == null) {
        //   var res = await reCreateSession();
        //   if (res.responseCode == 200) {
        //     accountOtpSend(mobileNum);
        //   }
        // }
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

  static Future<HTTPResponse<verifyOtpModel>> verifyOtp(otp, mobileNum) async {
    try {
      final response = await http.post(
        Uri.parse(
            "${ApiConstants.baseUrl}${EndPoints.verifyOtp}&api_token=${ApiConstants.jwtToken}"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"otp": otp, "telephone": mobileNum},
      );
      print({"otp": otp});
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var res = verifyOtpModel.fromJson(body);
        // if (res.logged == null) {
        //   var res = await reCreateSession();
        //   if (res.responseCode == 200) {
        //     verifyOtp(otp, mobileNum);
        //   }
        // }
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

  static Future<HTTPResponse<DeleteAccountModel>> deleteAccount(
      customerId,bool logged) async {
    try {
      final response = await http.post(
        Uri.parse(
            "${ApiConstants.baseUrl}${EndPoints.deleteAccount}&api_token=${ApiConstants.jwtToken}"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"customer_id": customerId},
      );
      print({"customer_id": customerId});
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var res = DeleteAccountModel.fromJson(body);
        if(!logged){
          if (res.logged == null) {
            var res = await reCreateSession();
            if (res.responseCode == 200) {
              deleteAccount(customerId,true);
            }
          }
        }
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

  static Future<HTTPResponse<TimeSlotsModel>> timeSlot(bool logged) async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.timeSlot}&api_token=${ApiConstants.jwtToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        var res = TimeSlotsModel.fromJson(body);
        if(!logged){
          if (res.logged == null) {
            var response = await reCreateSession();
            if (response.responseCode == 200) {
              timeSlot(true);
            }
          }
        }
        print("res.logged ${res.logged}");
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

  static Future<HTTPResponse<ReCreateSessionModel>> reCreateSession() async {
    try {
      print("RecreateSession");
      var prefs = await SharedPreferences.getInstance();
      String deviceId = prefs.getString("device_id")!;
      String userToken = prefs.getString("userToken")!;
      print("Device Id $deviceId");
      print("user token $userToken");
      final response = await http.post(
        Uri.parse(
            "${ApiConstants.baseUrl}${EndPoints.reCreateSession}&api_token=${ApiConstants.jwtToken}"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"device_id": deviceId, "user_token": userToken},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print("Refresh Token Body ${body}");
        var res = ReCreateSessionModel.fromJson(body);
        prefs.setString("user_token", res.userToken!);
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
