import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/routes/navigation_service.dart';
import 'package:mocaz/ui/views/auth/login_scren.dart';
import 'package:mocaz/ui/views/auth/sign_up_scren.dart';

class SelectAuthScren extends StatelessWidget {
  const SelectAuthScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              // Logo
              Column(
                children: [
                  SvgPicture.asset('assets/icons/logo_p.svg', height: 60),
                  const SizedBox(height: 8),
                ],
              ),

              const SizedBox(height: 30),

              // Welcome Text
              Text(
                "Bienvenue à M.OCCAZ 👋",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Nous sélectionnons les meilleurs véhicules d’occasion pour vous",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xFF24005E),
                ),
              ),

              const SizedBox(height: 40),

              // Social Buttons
              // _buildSocialButton(
              //   icon: FontAwesomeIcons.facebookF,
              //   text: "Inscrivez-Vous Avec Facebook",
              //   color: Colors.blue,
              //   onTap: () {},
              // ),
              // const SizedBox(height: 12),
              // _buildSocialButton(
              //   icon: FontAwesomeIcons.google,
              //   text: "Inscrivez-Vous Avec Google",
              //   color: Colors.red,
              //   onTap: () {},
              // ),
              const SizedBox(height: 12),
              _buildSocialButton(
                icon: Icons.email,
                text: "Inscrivez-Vous Avec Email",
                color: Colors.deepPurple,
                onTap:
                    () => NavigationService.navigateWithAnimation(
                      SignUpScren(),
                   
                    ),
              ),

              // const SizedBox(height: 24),
              // Row(
              //   children: [
              //     Expanded(child: Divider(thickness: 1.2)),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 12),
              //       child: Text(
              //         'OU',
              //         style: TextStyle(
              //           fontWeight: FontWeight.w500,
              //           fontFamily: 'Poppins',
              //         ),
              //       ),
              //     ),
              //     Expanded(child: Divider(thickness: 1.2)),
              //   ],
              // ),
              const SizedBox(height: 20),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed:
                      () => NavigationService.navigateWithAnimation(
                        LoginScreen(),
                      
                      ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF24005E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 6,
                  ),
                  child: Text(
                    "Connectez-vous à Votre Compte",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColors().white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Terms and Privacy
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "En continuant, vous acceptez ",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      TextSpan(
                        text: "les conditions générales",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      TextSpan(
                        text: " et ",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      TextSpan(
                        text: "la politique de confidentialité",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      TextSpan(
                        text: " de M.OCCAZ.",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: color, size: 20),
        label: Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade400),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
