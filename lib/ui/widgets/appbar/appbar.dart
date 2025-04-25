import 'package:flutter/material.dart';

Widget chatAppBarWidget(appColors) => Container(
  margin: EdgeInsets.symmetric(horizontal: 6),
  padding: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: appColors.primaryCyan,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(8),
  ),
  child: InkWell(
    onTap: () {},
    child: Icon(Icons.message, color: appColors.purple, size: 24),
  ),
);
Widget favoritAppbarWidget(appColors) => Container(
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
  child: InkWell(
    onTap: () {},
    child: Icon(Icons.favorite, color: appColors.purple, size: 25),
  ),
);

Widget newsAppbarWidget(appColors) => Container(
  margin: EdgeInsets.symmetric(horizontal: 6),
  padding: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: appColors.purple,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(8),
  ),
  child: InkWell(
    onTap: () {},
    child: Icon(Icons.campaign, color: appColors.white, size: 24),
  ),
);
