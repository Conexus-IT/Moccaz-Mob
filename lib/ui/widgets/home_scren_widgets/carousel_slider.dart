import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mocaz/core/constants/colors.dart';

class CarouselSliderWidget extends StatelessWidget {
  AppColors appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [guaranteiWidget(), choiceWidget(), satisfiedWidget(appColors)],
      options: CarouselOptions(
        height: 100,
        viewportFraction: 1,

        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }
}

Widget guaranteiWidget() => Container(
  height: 100,
  padding: const EdgeInsets.symmetric(horizontal: 4),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),

    gradient: LinearGradient(
      colors: [Color(0xFF290054), Color(0xFF7308E2)],
      begin: Alignment.topLeft,
    ),
  ),
  child: Row(
    children: [
      SizedBox(width: 10),
      SizedBox(
        height: 60,
        width: 60,
        child: SvgPicture.asset(
          'assets/icons/guarantee.svg',
          fit: BoxFit.contain,
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Garantie jusqu \'à ',
                    style: TextStyle(
                      color: Color(0xff73CAE8),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: ' 10 ans *',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'GARANTIE JUSQU\'À 10 ANS * ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: 'sur une large sélection de véhicules d\'occasion',
                    style: TextStyle(
                      color: Color(0xff73CAE8),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget choiceWidget() => Container(
  height: 100,
  padding: const EdgeInsets.symmetric(horizontal: 4),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),

    gradient: LinearGradient(
      colors: [Color(0xFF290054), Color(0xFF7308E2)],
      begin: Alignment.topLeft,
    ),
  ),
  child: Row(
    children: [
      SizedBox(width: 10),
      SizedBox(
        height: 60,
        width: 60,
        child: SvgPicture.asset('assets/icons/car.svg', fit: BoxFit.contain),
      ),
      SizedBox(width: 10),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Large choix de véhicules',
                    style: TextStyle(
                      color: Color(0xff73CAE8),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Une sélection de plus de 1 000 véhicules d\'occasion',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget satisfiedWidget(AppColors appColors) => Container(
  height: 100,
  padding: const EdgeInsets.symmetric(horizontal: 4),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),

    gradient: LinearGradient(
      colors: [Color(0xFF290054), Color(0xFF7308E2)],
      begin: Alignment.topLeft,
    ),
  ),
  child: Row(
    children: [
      SizedBox(width: 10),
      SizedBox(
        height: 60,
        width: 60,
        child: SvgPicture.asset(
          'assets/icons/satisfied.svg',
          fit: BoxFit.contain,
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Meilleure offre du marché',
                    style: TextStyle(
                      color: appColors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Trouvez moins cher ailleurs, nous vous remboursons la différence',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Color(0xff73CAE8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);
