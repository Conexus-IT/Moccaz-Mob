import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/providers/auth/login_provider.dart';
import 'package:mocaz/routes/app_router.dart';
import 'package:mocaz/routes/app_routes.dart';
import 'package:mocaz/routes/navigation_service.dart';
import 'package:mocaz/ui/views/auth/sign_up_scren.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
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
      create: (context) => LoginProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors().bgColor,
          elevation: 0,
          leading: BackButton(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: ListView(
              physics: Platform.isAndroid ? BouncingScrollPhysics() : null,
              children: [
                Center(
                  child: Text(
                    "Se Connecter",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Bienvenue à « M.OCCAZ » Venez Maintenant Pour Continuer Votre Aventure Pour Trouver la Voiture Parfaite",
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
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: outlineInputBorder(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: "Votre adresse Email",
                    hintStyle: hintStyle(),
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
                Consumer<LoginProvider>(
                  builder:
                      (context, value, child) => TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: !value.obscureText,

                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: value.onPasswordVisibilityChanged,
                            icon:
                                value.obscureText
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

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      "Mot de passe oublié ?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {},
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

                    onPressed: () {},
                    child: Text(
                      "Se Connecter",
                      style: TextStyle(
                        color: AppColors().white,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vous n'avez pas de compte ? ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        NavigationService.navigateWithAnimation(SignUpScren());
                      },
                      child: Text(
                        "Inscription",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
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
