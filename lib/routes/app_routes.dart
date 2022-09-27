part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const HOME_SCREEN = _Paths.HOME_SCREEN;

}

abstract class _Paths {

  static const SPLASH = '/splash';
  static const HOME_SCREEN = '/home_screen';

}