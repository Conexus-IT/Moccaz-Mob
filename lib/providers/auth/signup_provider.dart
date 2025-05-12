import 'package:flutter/material.dart';
import 'package:mocaz/core/constants/cities.dart';

class SignupProvider extends ChangeNotifier {
  bool obscureTextPassword = false;
  bool obscureTextConfPassword = false;
  bool condition = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();
  String? _selectedCity;

  String? get selectedCity => _selectedCity;

  // this function for when we chnage the passoword visiblity changed
  void onPasswordVisibilityChanged() {
    obscureTextPassword = !obscureTextPassword;
    notifyListeners();
  }

  // this function for when we chnage the confirmation passoword visiblity chnaged
  void onConfPasswordVisibilityChanged() {
    obscureTextConfPassword = !obscureTextConfPassword;
    notifyListeners();
  }

  // on dropdown chnaged

  void onCityChanged(String city) {
    _selectedCity = city;
    notifyListeners();
  }

  // oncheckbox checked for term & conditions

  void onConditionChecked(bool data) {
    condition = data;
    notifyListeners();
  }
}
