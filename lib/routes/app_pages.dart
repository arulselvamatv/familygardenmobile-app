import 'package:family_garden/screens/Home_screen/views/homescreen_view.dart';
import 'package:family_garden/screens/cart_screen/views/cart_view.dart';
import 'package:family_garden/screens/dashboard/views/dashboard_view.dart';
import 'package:family_garden/screens/login_screen/binding/login_binding.dart';
import 'package:family_garden/screens/login_screen/view/login_view.dart';
import 'package:family_garden/screens/manage_address_screen/binding/manage_address_binding.dart';
import 'package:family_garden/screens/manage_address_screen/view/manage_address_view.dart';
import 'package:family_garden/screens/product_listing_screen/bindings/product_listing_binding.dart';
import 'package:family_garden/screens/product_listing_screen/views/product_listing_view.dart';
import 'package:family_garden/screens/register_screen/binding/register_binding.dart';
import 'package:family_garden/screens/register_screen/view/register_view.dart';
import 'package:family_garden/screens/verify_otp_screen/binding/verify_otp_binding.dart';
import 'package:family_garden/screens/verify_otp_screen/view/verify_otp_view.dart';
import 'package:get/get.dart';
import '../screens/Home_screen/bindings/homescreen_binding.dart';
import '../screens/cart_screen/bindings/cart_binding.dart';
import '../screens/dashboard/bindings/dashboard_bindings.dart';
import '../screens/product_details_screen/bindings/product_details_binding.dart';
import '../screens/product_details_screen/views/product_detail_view.dart';
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
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP,
      page: () => VerifyOTPView(),
      binding: VerifyOTPBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
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
      name: _Paths.PRODUCT_LISTING_SCREEN,
      page: () => ProductListingView(),
      binding: ProductListingBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS_SCREEN,
      page: () => ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CART_SCREEN,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
        name: _Paths.MANAGE_ADDRESS_SCREEN,
        page: () => ManageAddressView(),
        binding: ManageAddressBinding())
  ];
}
