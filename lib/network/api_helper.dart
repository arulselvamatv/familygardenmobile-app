import 'dart:convert';
import 'dart:io';
import 'package:family_garden/models/add_cart_model.dart';
import 'package:family_garden/models/cart_list_model.dart';
import 'package:family_garden/models/get_token_model.dart';
import 'package:family_garden/models/home_feature_model.dart';
import 'package:family_garden/models/home_slider_model.dart';
import '../models/categories_model.dart';
import '../models/category_product_model.dart';
import '../models/product_detail_model.dart';
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
      print(response.statusCode);
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

  static Future<HTTPResponse<AddCartModel>> addCart(
      productId, optionId, productValueId) async {
    // String url = "${ApiConstants.baseUrl}${EndPoints.category}";
    try {
      var body = {
        'product_id': productId,
        'qty': '1',
        'option[$optionId]': productValueId
      };
      final response = await http.post(
        Uri.parse(
            "${ApiConstants.baseUrl}${EndPoints.cartAdd}${EndPoints.apiToken}"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {
          'product_id': productId,
          'qty': '1',
          'option[$optionId]': productValueId
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

  static Future<HTTPResponse<CartListModel>> cartList() async {
    String url =
        "${ApiConstants.baseUrl}${EndPoints.cartList}${EndPoints.apiToken}";
    try {
      var response = await http.post(
        Uri.parse(url),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
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
}
