part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const SIGNUP = _Paths.SIGNUP;
  static const LOGIN = _Paths.LOGIN;
  static const VERIFY_OTP = _Paths.VERIFY_OTP;
  static const REGISTER = _Paths.REGISTER;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const ADDADDRESS = _Paths.ADDADDRESS;
  static const ADDRESS = _Paths.ADDRESS;
  static const HOME_SCREEN = _Paths.HOME_SCREEN;
  static const PAYMENT = _Paths.PAYMENT;
  static const INITIATEPAYMENT = _Paths.INITIATEPAYMENT;
  static const CATEGORIES_SCREEN = _Paths.CATEGORIES_SCREEN;
  static const PRODUCT_LISTING_SCREEN = _Paths.PRODUCT_LISTING_SCREEN;
  static const PRODUCT_DETAILS_SCREEN = _Paths.PRODUCT_DETAILS_SCREEN;
  static const CART_SCREEN = _Paths.CART_SCREEN;
  static const MANAGE_ADDRESS_SCREEN = _Paths.MANAGE_ADDRESS_SCREEN;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const ORDER_SUCCESS_SCREEN = _Paths.ORDER_SUCCESS_SCREEN;
  static const WISH_LIST_SCREEN = _Paths.WISH_LIST_SCREEN;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const SIGNUP = '/signup';
  static const LOGIN = '/login';
  static const VERIFY_OTP = '/verify-otp';
  static const REGISTER = '/register';
  static const DASHBOARD = '/dashboard';
  static const ADDADDRESS = '/add-address';
  static const PAYMENT = '/payment';
  static const INITIATEPAYMENT = '/initiate-payment';
  static const ADDRESS = '/address';
  static const HOME_SCREEN = '/home_screen';
  static const CATEGORIES_SCREEN = '/categories_screen';
  static const PRODUCT_LISTING_SCREEN = '/product_listing_screen';
  static const PRODUCT_DETAILS_SCREEN = '/product_details_screen';
  static const CART_SCREEN = '/cart_screen';
  static const MANAGE_ADDRESS_SCREEN = '/manage-address';
  static const EDIT_PROFILE = '/edit-profile';
  static const ORDER_SUCCESS_SCREEN = '/order-success-screen';
  static const WISH_LIST_SCREEN = '/wishlist-screen';
}
