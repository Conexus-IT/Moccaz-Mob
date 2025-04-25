import 'package:flutter/material.dart';

Widget searchWidget(appColors, size) => SizedBox(
  height: size.height * 0.17,
  child: Card(
    color: appColors.white,
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Nous sélectionnons les meilleurs véhicules d’occasion pour vous',

            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,

              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          MaterialButton(
            onPressed: () {},
            color: appColors.purple,

            // minWidth: size.width / 1.3,
            height: size.height * 0.06,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, color: appColors.white, size: 30),
                SizedBox(width: 5),
                Text(
                  'Trouver mon véhicule',
                  style: TextStyle(
                    color: appColors.white,
                    fontFamily: 'Poppins',
                    fontSize: 18,
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
