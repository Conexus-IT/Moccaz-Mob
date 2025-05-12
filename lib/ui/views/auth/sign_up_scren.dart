import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mocaz/core/constants/cities.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/core/utils/form_validator.dart';
import 'package:mocaz/providers/auth/signup_provider.dart';
import 'package:provider/provider.dart';

class SignUpScren extends StatefulWidget {
  const SignUpScren({super.key});

  @override
  State<SignUpScren> createState() => _SignUpScrenState();
}

class _SignUpScrenState extends State<SignUpScren>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: BackButton(),
          backgroundColor: AppColors().bgColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: ListView(
              physics: Platform.isAndroid ? BouncingScrollPhysics() : null,
              children: [
                Center(
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Créez votre compte personnel pour accéder à tous les avantages exclusifs que nous offrons",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Votre nom et prénom ',
                        style: labelStyle(),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: AppColors().red),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 5),
                Consumer<SignupProvider>(
                  builder:
                      (context, value, child) => TextFormField(
                        validator: FormValidators.validateName,
                        controller: value.nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          enabledBorder: outlineInputBorder(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "Votre nom et prénom",
                          hintStyle: hintStyle(),
                        ),
                      ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Votre adresse Email ',
                        style: labelStyle(),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: AppColors().red),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Consumer<SignupProvider>(
                  builder:
                      (context, value, child) => TextFormField(
                        validator: FormValidators.validateEmail,
                        keyboardType: TextInputType.text,
                        controller: value.emailController,
                        decoration: InputDecoration(
                          enabledBorder: outlineInputBorder(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "Votre adresse Email",
                          hintStyle: hintStyle(),
                        ),
                      ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Téléphone ', style: labelStyle()),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: AppColors().red),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Consumer<SignupProvider>(
                  builder:
                      (context, value, child) => TextFormField(
                        validator: FormValidators.validatePhone,
                        controller: value.phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          enabledBorder: outlineInputBorder(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "Téléphone",
                          hintStyle: hintStyle(),
                        ),
                      ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Mot de passe ', style: labelStyle()),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: AppColors().red),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Consumer<SignupProvider>(
                  builder:
                      (context, value, child) => TextFormField(
                        validator: FormValidators.validatePassword,
                        keyboardType: TextInputType.text,
                        controller: value.passwordController,
                        obscureText: !value.obscureTextPassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: value.onPasswordVisibilityChanged,
                            icon:
                                value.obscureTextPassword
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                          ),
                          enabledBorder: outlineInputBorder(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "Mot de passe",
                          hintStyle: hintStyle(),
                        ),
                      ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Confirmer le mot de passe ',
                        style: labelStyle(),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: AppColors().red),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Consumer<SignupProvider>(
                  builder:
                      (context, value, child) => TextFormField(
                        validator:
                            (data) => FormValidators.validateConfirmPassword(
                              value.passwordController.text,
                              data,
                            ),
                        keyboardType: TextInputType.text,
                        obscureText: !value.obscureTextConfPassword,
                        controller: value.confPasswordController,

                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: value.onConfPasswordVisibilityChanged,
                            icon:
                                value.obscureTextConfPassword
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                          ),
                          enabledBorder: outlineInputBorder(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "Confirmer Mot de passe",
                          hintStyle: hintStyle(),
                        ),
                      ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Ville ', style: labelStyle()),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: AppColors().red),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Consumer<SignupProvider>(
                  builder:
                      (context, value, child) =>
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              enabledBorder: outlineInputBorder(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            value: value.selectedCity,

                            hint: Text('Ville'),
                            onChanged: (city) {
                              value.onCityChanged(city!);
                            },
                            items:
                                cities.map<DropdownMenuItem<String>>((
                                  String value,
                                ) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                          ),
                ),
                SizedBox(height: 5),

                Consumer<SignupProvider>(
                  builder:
                      (context, value, child) => CheckboxListTile(
                        contentPadding: EdgeInsets.all(0),
                        // <-- Moves checkbox to the left
                        controlAffinity: ListTileControlAffinity.leading,
                        subtitle: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'En continuant, vous acceptez ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  color: AppColors().black,
                                ),
                              ),
                              TextSpan(
                                text: 'les conditions générales ',
                                style: labelStyle(),
                              ),
                              TextSpan(
                                text: 'et ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  color: AppColors().black,
                                ),
                              ),
                              TextSpan(
                                text: 'la politique de confidentialité ',
                                style: labelStyle(),
                              ),
                              TextSpan(
                                text: 'de M.OCCAZ .',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  color: AppColors().black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        value: value.condition,
                        onChanged: (data) {
                          value.onConditionChecked(data!);
                        },
                      ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                    color: AppColors().purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 7,
                    height: 54,

                    onPressed: () {
                      FormValidators.validateForm(context, _formKey);
                    },
                    child: Text(
                      "Créer Un Compte",
                      style: TextStyle(
                        color: AppColors().white,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle hintStyle() =>
      TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w300);

  TextStyle labelStyle() => TextStyle(
    color: AppColors().black,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 183, 183, 183)),
  );
}
