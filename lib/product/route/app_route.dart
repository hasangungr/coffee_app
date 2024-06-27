import 'package:coffee_app/core/extension/string_extension.dart';
import 'package:coffee_app/feature/auth/authentication_view.dart';
import 'package:coffee_app/feature/home/home_view.dart';
import 'package:coffee_app/feature/splash/splash_view.dart';
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
      name: AppRoutes.auth,
      path: AppRoutes.auth.viewName,
      builder: (context, state) => const AuthenticationView(),
    ),
  ],
);

abstract class AppRoutes {
  AppRoutes._();
  static const String splash = '/';
  static const String home = 'home';
  static const String auth = 'auth';
}
