import 'package:family_garden/screens/Home_screen/views/homescreen_view.dart';
import 'package:family_garden/screens/categories_screen/bindings/categories_bindings.dart';
import 'package:family_garden/screens/categories_screen/views/categories_view.dart';
import 'package:family_garden/screens/dashboard/views/dashboard_view.dart';
import 'package:get/get.dart';

import '../screens/Home_screen/bindings/homescreen_binding.dart';
import '../screens/dashboard/bindings/dashboard_bindings.dart';
import '../screens/splash_screen/bindings/splash_bindings.dart';
import '../screens/splash_screen/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;


  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES_SCREEN,
      page: () => CategoriesView(),
      binding: CategoriesBinding(),
    ),

  ];
}
