part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const HOME_SCREEN = _Paths.HOME_SCREEN;
  static const CATEGORIES_SCREEN = _Paths.CATEGORIES_SCREEN;

}

abstract class _Paths {

  static const SPLASH = '/splash';
  static const DASHBOARD = '/dashboard';
  static const HOME_SCREEN = '/home_screen';
  static const CATEGORIES_SCREEN = '/categories_screen';

}