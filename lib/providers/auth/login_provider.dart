import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool obscureText = false;


  // this function for when we change the passoword visiblity
  void onPasswordVisibilityChanged() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
