import 'package:get/get.dart';

import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detail_movie/bindings/detail_movie_binding.dart';
import '../modules/detail_movie/views/detail_movie_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/my_token/bindings/my_token_binding.dart';
import '../modules/my_token/views/my_token_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/search_page/bindings/search_page_binding.dart';
import '../modules/search_page/views/search_page_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/transaction_history/bindings/transaction_history_binding.dart';
import '../modules/transaction_history/views/transaction_history_view.dart';
import '../modules/wishlist/bindings/wishlist_binding.dart';
import '../modules/wishlist/views/wishlist_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;
  static const LOGIN = Routes.LOGIN;
  static const REGISTER = Routes.REGISTER;
  static const HOME = Routes.HOME;
  static const SEARCH = Routes.SEARCH_PAGE;
  static const WISHLIST = Routes.WISHLIST;
  static const TRANSACTION_HISTORY = Routes.TRANSACTION_HISTORY;
  static const DASHBOARD = Routes.DASHBOARD;
  static const CART = Routes.CART;
  static const MY_TOKEN = Routes.MY_TOKEN;
  static const DETAIL_MOVIE = Routes.DETAIL_MOVIE;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => const WishlistView(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION_HISTORY,
      page: () => const TransactionHistoryView(),
      binding: TransactionHistoryBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.MY_TOKEN,
      page: () => const MyTokenView(),
      binding: MyTokenBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MOVIE,
      page: () => const DetailMovieView(),
      binding: DetailMovieBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PAGE,
      page: () => const SearchPageView(),
      binding: SearchPageBinding(),
    ),
  ];
}
