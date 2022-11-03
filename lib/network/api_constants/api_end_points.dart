import 'package:family_garden/network/api_constants/api_constants.dart';

class EndPoints {
  static const getToken = "/index.php?route=mobileapi/login/getToken";

  static const login = "/index.php?route=mobileapi/login";

  static const signup = "/index.php?route=mobileapi/signup";

  static const addAddress = "/index.php?route=mobileapi/account/address/add";

  static const apiRoutes = "?route=mobileapi/homefeature";

  static const homeCarousel = "/index.php?route=mobileapi/homeslider";

  static const category = "/index.php?route=mobileapi/menu";

  static const productCategory = "/index.php?route=mobileapi/product/category";

  static const productCategoryList = "/index.php?route=mobileapi/product/view";

  static const homeFeature = "/index.php";

  static const cartAdd = "/index.php?route=mobileapi/cart/add";

  static const cartList = "/index.php?route=mobileapi/cart/list";

  static const checkOut = "/index.php?route=mobileapi/checkout/checkout";

  static const paymentMethod =
      "/index.php?route=mobileapi/checkout/payment_method";

  static const shippingMethod =
      "/index.php?route=mobileapi/checkout/shipping_method";

  static const paymentAddressSave =
      "/index.php?route=mobileapi/checkout/payment_address/save";

  static const shippingMethodSave =
      "/index.php?route=mobileapi/checkout/shipping_method/save";

  static const paymentMethodSave =
      "/index.php?route=mobileapi/checkout/payment_method/save";
  static const checkoutConfirm = "/index.php?route=mobileapi/checkout/confirm";

  static const cartCount = "/index.php?route=mobileapi/cart/count";

  static const orderSuccess =
      "/index.php?route=mobileapi/checkout/ordersuccess";

  static const codConfirm = "/index.php?route=mobileapi/payment/cod/confirm";

  static const addWishList = "/index.php?route=mobileapi/account/wishlist/add";

  static const wishList = "index.php?route=mobileapi/account/wishlist";

  static const getOrdersEndpoint = "/index.php?route=mobileapi/account/order";

  static const getOrderInfoEndpoint =
      "index.php?route=mobileapi/account/order/info";

  static const updatePassword = "index.php?route=mobileapi/account/password";

  static const loguout = "/index.php?route=mobileapi/logout";

  static const paymentExistingAddressSave =
      "/index.php?route=mobileapi/checkout/payment_address/save";

  static const editAccount = "/index.php?route=mobileapi/account/edit/update";

  static const search = "/index.php?route=mobileapi/product/search";

  static const informationDetails = "/index.php?route=mobileapi/information";

  // static const addWishList = "/index.php?route=mobileapi/account/wishlist/add";
}
