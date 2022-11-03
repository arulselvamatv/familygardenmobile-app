import 'package:family_garden/screens/Home_screen/views/homescreen_view.dart';
import 'package:family_garden/screens/account_screen/bindings/account_binding.dart';
import 'package:family_garden/screens/add_address_screen/binding/add_address_binding.dart';
import 'package:family_garden/screens/add_address_screen/view/add_address_view.dart';
import 'package:family_garden/screens/cart_screen/views/cart_view.dart';
import 'package:family_garden/screens/dashboard/views/dashboard_view.dart';
import 'package:family_garden/screens/initiate_payment_screen/binding/initiate_payment_binding.dart';
import 'package:family_garden/screens/initiate_payment_screen/view/initiate_payment_view.dart';
import 'package:family_garden/screens/manage_address_screen/binding/manage_address_binding.dart';
import 'package:family_garden/screens/manage_address_screen/view/manage_address_view.dart';
import 'package:family_garden/screens/order_success_screen/binding/order_success_binding.dart';
import 'package:family_garden/screens/order_success_screen/view/order_success_view.dart';
import 'package:family_garden/screens/payments_screen/binding/payment_binding.dart';
import 'package:family_garden/screens/payments_screen/view/payment_view.dart';
import 'package:family_garden/screens/product_listing_screen/bindings/product_listing_binding.dart';
import 'package:family_garden/screens/product_listing_screen/views/product_listing_view.dart';
import 'package:family_garden/screens/register_screen/binding/register_binding.dart';
import 'package:family_garden/screens/register_screen/view/register_view.dart';
import 'package:family_garden/screens/verify_otp_screen/binding/verify_otp_binding.dart';
import 'package:family_garden/screens/verify_otp_screen/view/verify_otp_view.dart';
import 'package:get/get.dart';
import '../screens/Home_screen/bindings/homescreen_binding.dart';
import '../screens/account_login/view/account_login_view.dart';
import '../screens/address_screen/binding/address_binding.dart';
import '../screens/address_screen/view/address_view.dart';
import '../screens/cart_screen/bindings/cart_binding.dart';
import '../screens/dashboard/bindings/dashboard_bindings.dart';
import '../screens/faq/bindings/faq_binding.dart';
import '../screens/faq/views/faq_view.dart';
import '../screens/help-center/bindings/help_center_binding.dart';
import '../screens/help-center/views/help_center_view.dart';
import '../screens/order-detail/bindings/order_detail_binding.dart';
import '../screens/order-detail/views/order_detail_view.dart';
import '../screens/order_history_screen/bindings/order_history_screen_binding.dart';
import '../screens/order_history_screen/views/order_history_screen_view.dart';
import '../screens/privacy-policy/bindings/privacy_policy_binding.dart';
import '../screens/privacy-policy/views/privacy_policy_view.dart';
import '../screens/product_details_screen/bindings/product_details_binding.dart';
import '../screens/product_details_screen/views/product_detail_view.dart';
import '../screens/profile_screen/bindings/profile_binding.dart';
import '../screens/profile_screen/views/profile_view.dart';
import '../screens/search_screen/binding/search_binding.dart';
import '../screens/search_screen/view/search_view.dart';
import '../screens/signup/binding/signup_binding.dart';
import '../screens/signup/view/signup_view.dart';
import '../screens/splash_screen/bindings/splash_bindings.dart';
import '../screens/splash_screen/views/splash_view.dart';
import '../screens/terms-and-conditions/bindings/terms_and_conditions_binding.dart';
import '../screens/terms-and-conditions/views/terms_and_conditions_view.dart';
import '../screens/wishlist_screen/bindings/wishlist_screen_binding.dart';
import '../screens/wishlist_screen/views/wishlist_screen_view.dart';

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
      page: () => AccountLoginView(),
      binding: AccountBinding(),
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
      name: _Paths.ADDADDRESS,
      page: () => AddAddressView(),
      binding: AddAddressBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.INITIATEPAYMENT,
      page: () => InitiatePaymentView(),
      binding: InitiatePaymentBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS,
      page: () => AddressView(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.WISH_LIST_SCREEN,
      page: () => WishListScreenView(),
      binding: WishListScreenBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_HISTORY_SCREEN,
      page: () => OrderHistoryView(),
      binding: OrderHistoryScreenBinding(),
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
        binding: ManageAddressBinding()),
    GetPage(
        name: _Paths.ORDER_SUCCESS_SCREEN,
        page: () => OrderSuccessView(),
        binding: OrdersuccessBinding()),
    GetPage(
      name: _Paths.ORDER_DETAIL,
      page: () => const OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_AND_CONDITIONS,
      page: () => const TermsAndConditionsView(),
      binding: TermsAndConditionsBinding(),
    ),
    GetPage(
      name: _Paths.FAQ,
      page: () => const FaqView(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.HELP_CENTER,
      page: () => const HelpCenterView(),
      binding: HelpCenterBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
