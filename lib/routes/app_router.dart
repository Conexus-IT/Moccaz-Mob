import 'package:flutter/material.dart';
import 'package:mocaz/routes/app_routes.dart';
import 'package:mocaz/ui/views/home_scren/home_scren.dart';
import 'package:mocaz/ui/views/splash_scren/splash_scren.dart';

class AppRouter {
   AppRoutes appRoutes = AppRoutes();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScren());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScren());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScren());
    }
  }
}
