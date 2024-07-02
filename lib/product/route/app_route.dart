import 'package:coffee_app/core/extension/string_extension.dart';
import 'package:coffee_app/view/auth/login_view.dart';
import 'package:coffee_app/view/auth/register_view.dart';
import 'package:coffee_app/view/home/home_view.dart';
import 'package:coffee_app/view/product_add/product_add_view.dart';
import 'package:coffee_app/view/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      name: AppRoutes.home,
      path: AppRoutes.home.viewName,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      name: AppRoutes.login,
      path: AppRoutes.login.viewName,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      name: AppRoutes.register,
      path: AppRoutes.register.viewName,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      name: AppRoutes.homeAdd,
      path: AppRoutes.homeAdd.viewName,
      builder: (context, state) => const ProductAddView(),
    ),
  ],
);

abstract class AppRoutes {
  AppRoutes._();
  static const String splash = '/';
  static const String home = 'home';
  static const String login = 'login';
  static const String register = 'register';
  static const String homeAdd = 'homeAdd';
}
