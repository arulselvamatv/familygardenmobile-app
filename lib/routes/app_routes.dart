part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const HOME_SCREEN = _Paths.HOME_SCREEN;
  static const CATEGORIES_SCREEN = _Paths.CATEGORIES_SCREEN;
  static const PRODUCT_LISTING_SCREEN = _Paths.PRODUCT_LISTING_SCREEN;
  static const PRODUCT_DETAILS_SCREEN = _Paths.PRODUCT_DETAILS_SCREEN;
  static const CART_SCREEN = _Paths.CART_SCREEN;
  static const MANAGE_ADDRESS_SCREEN = _Paths.MANAGE_ADDRESS_SCREEN;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const DASHBOARD = '/dashboard';
  static const HOME_SCREEN = '/home_screen';
  static const CATEGORIES_SCREEN = '/categories_screen';
  static const PRODUCT_LISTING_SCREEN = '/product_listing_screen';
  static const PRODUCT_DETAILS_SCREEN = '/product_details_screen';
  static const CART_SCREEN = '/cart_screen';
  static const MANAGE_ADDRESS_SCREEN = '/manage-address';
}
