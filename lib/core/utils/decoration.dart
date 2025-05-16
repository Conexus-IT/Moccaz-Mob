import 'package:flutter/material.dart';
import 'package:mocaz/core/constants/colors.dart';

TextStyle hintStyle() =>
    TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w300);

TextStyle labelStyle() => TextStyle(
  color: AppColors().black,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);
InputDecoration inputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: Colors.grey[100],
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
  );
}
