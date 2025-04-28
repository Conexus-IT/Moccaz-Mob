import 'package:flutter/material.dart';
import 'package:mocaz/routes/app_routes.dart';
import 'package:mocaz/ui/views/bottom_navigation/bottom_navigation_bar.dart';
import 'package:mocaz/ui/views/splash_scren/splash_screen.dart';

class AppRouter {
   AppRoutes appRoutes = AppRoutes();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const BottomNavigationBarScren());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
