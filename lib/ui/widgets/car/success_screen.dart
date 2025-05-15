import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/routes/app_router.dart';
import 'package:mocaz/routes/app_routes.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Spacer(),
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColors().purple,
                  radius: 70,
                  child: SvgPicture.asset('assets/icons/check.svg'),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Félicitations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 8),
              Text(
                '''Votre demande de cotation est bien enregistrée.  Notre conseiller prendra contact 
          avec vous très rapidement.''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 8),
              Text(
                '''N.B : Pour toute réclamation ou assistance,  merci de contacter notre service clientèle 
        au 05 20 48 20 00''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors().purple,

                  minimumSize: Size(MediaQuery.of(context).size.width / 2, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed:
                    () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.home,
                      (value) => true,
                    ),
                child: Text(
                  "Fermer",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: AppColors().white,
                    fontSize: 15,
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
