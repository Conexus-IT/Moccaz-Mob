import 'package:flutter/material.dart';

void startSplashTimer(BuildContext context) {
  Future.delayed(const Duration(milliseconds: 1700), () {
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home');
  });
}