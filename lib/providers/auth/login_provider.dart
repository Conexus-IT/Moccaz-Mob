import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool obscureText = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  // this function for when we change the passoword visiblity
  void onPasswordVisibilityChanged() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
