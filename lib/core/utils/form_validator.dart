import 'package:flutter/material.dart';

class FormValidators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Veuillez entrer votre nom';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Veuillez entrer une adresse email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Adresse email invalide';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Veuillez entrer votre numéro de téléphone';
    }
    if (value.length < 9) {
      return 'Numéro de téléphone invalide';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Veuillez entrer un mot de passe';
    }
    if (value.length < 6) {
      return 'Le mot de passe doit contenir au moins 6 caractères';
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirm) {
    if (confirm == null || confirm.trim().isEmpty) {
      return 'Veuillez confirmer le mot de passe';
    }
    if (password != confirm) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }

  // check the form is validate or not
 static bool validateForm(BuildContext context, GlobalKey<FormState> formKey) {
    final isValid = formKey.currentState?.validate() ?? false;

    return isValid;
  }
}
