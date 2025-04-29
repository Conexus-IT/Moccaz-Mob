import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget chatAppBarWidget(appColors) => InkWell(
  child: Container(
    height: 40,
    width: 40,
    margin: EdgeInsets.symmetric(horizontal: 6),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: appColors.primaryCyan,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Image.asset('assets/icons/chat.png', fit: BoxFit.contain),
  ),
);
Widget favoritAppbarWidget(appColors) => InkWell(
  child: Container(
    height: 40,
    width: 40,
    margin: EdgeInsets.symmetric(horizontal: 6),
    padding: EdgeInsets.all(6),
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8),

      border: Border.all(
        color: appColors.purple, // Your purple
        width: 2,
      ),
    ),
    child: Icon(Icons.favorite, color: appColors.purple, size: 25),
  ),
);

Widget newsAppbarWidget(appColors) => InkWell(
  child: Container(
    height: 40,
    width: 40,
    margin: EdgeInsets.symmetric(horizontal: 6),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: appColors.purple,

      borderRadius: BorderRadius.circular(8),
    ),
    child: Image.asset('assets/icons/news.png', fit: BoxFit.contain),
  ),
);
