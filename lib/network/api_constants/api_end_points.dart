import 'package:family_garden/network/api_constants/api_constants.dart';

class EndPoints {
  static const getToken = "/index.php?route=mobileapi/login/getToken";

  static const apiRoutes = "?route=mobileapi/homefeature";

  static final apiToken = "&api_token=${ApiConstants.jwtToken}";

  static const homeCarousel = "/index.php?route=mobileapi/homeslider";

  static const category = "/index.php?route=mobileapi/menu";

  static const productCategory = "/index.php?route=mobileapi/product/category";

  static const productCategoryList = "/index.php?route=mobileapi/product/view";

  static const homeFeature = "/index.php";

  static const cartAdd = "/index.php?route=mobileapi/cart/add";

  static const cartList = "/index.php?route=mobileapi/cart/list";
}
