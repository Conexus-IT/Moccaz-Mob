import 'package:flutter/material.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/routes/app_router.dart';
import 'package:mocaz/ui/views/splash_scren/splash_scren.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: appColors.white,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: appColors.bgColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScren(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
