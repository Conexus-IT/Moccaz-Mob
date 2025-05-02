import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/data/models/car.dart';
import 'package:mocaz/data/models/demo_car_list.dart';
import 'package:mocaz/ui/widgets/car/car_widget.dart';
import 'package:mocaz/ui/widgets/home_scren_widgets/carousel_slider.dart';
import 'package:mocaz/ui/widgets/search/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  AppColors appColors = AppColors();

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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10,
            child: SvgPicture.asset('assets/icons/c_logo_p.svg'),
          ),
          Positioned.fill(
            child: Container(
              // ignore: deprecated_member_use
              color: appColors.bgColor.withOpacity(0.8),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                children: [
                  searchWidget(appColors, size),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'NOS VÉHICULES D\'OCCASION',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  // car list
                  SizedBox(
                    height: 340,
                    child: ListView.builder(
                      physics:
                          Platform.isAndroid ? BouncingScrollPhysics() : null,
                      scrollDirection: Axis.horizontal,
                      itemCount: carList.length,
                      itemBuilder: (context, index) {
                        Car car = carList[index];
                        return CarCard(car: car);
                      },
                    ),
                  ),

                  SizedBox(height: 12),
                  // padding from left on fr lang and right in ar lng
                  Padding(
                    padding: EdgeInsets.only(left: 7),
                    // offere serveices  list
                    child: CarouselSliderWidget(),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'CES VÉHICULES À VOIR',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  // car list
                  SizedBox(
                    height: 340,
                    child: ListView.builder(
                      physics:
                          Platform.isAndroid ? BouncingScrollPhysics() : null,
                      scrollDirection: Axis.horizontal,
                      itemCount: carList.length,
                      itemBuilder: (context, index) {
                        Car car = carList[index];
                        return CarCard(car: car);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
