import 'package:coffee_app/core/extension/string_extension.dart';
import 'package:coffee_app/feature/home/home_view.dart';
import 'package:coffee_app/feature/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: RoutesConstants.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      name: RoutesConstants.home,
      path: RoutesConstants.home.viewName,
      builder: (context, state) => HomeView(),
    ),
  ],
);

class RoutesConstants {
  RoutesConstants._();
  static const String splash = '/';
  static const String home = 'home';
}
