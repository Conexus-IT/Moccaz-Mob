import 'package:flutter/material.dart';

Widget searchWidget(appColors, Size size) => SizedBox(
  height: size.height * 0.21,
  child: Card(
    color: appColors.white,
    elevation: 4,
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.height * 0.01,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Nous sélectionnons les meilleurs véhicules d’occasion pour vous',

            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,

              fontSize: size.width * 0.05,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.01),
          MaterialButton(
            onPressed: () {},
            color: appColors.purple,

            // minWidth: size.width / 1.3,
            height: size.height * 0.08,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: appColors.white,
                  size: size.width * 0.07,
                ),
                SizedBox(width: 5),
                Text(
                  'Trouver mon véhicule',
                  style: TextStyle(
                    color: appColors.white,
                    fontFamily: 'Poppins',
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);
