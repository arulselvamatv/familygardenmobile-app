import 'dart:convert';
import 'dart:io';
import 'package:family_garden/models/home_slider_model.dart';
import 'api_constants/api_constants.dart';
import 'api_constants/api_end_points.dart';
import 'http_response_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<HTTPResponse<HomeSliderModel>> getHomeSliderDetails() async {
    String url = "${ApiConstants.baseUrl}${EndPoints.homeCarousel}${ApiConstants.jwtToken}";
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
        print("THIS IS THE CREATE ORDER API ${response.statusCode}");
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