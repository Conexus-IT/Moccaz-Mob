import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/ui/widgets/appbar/appbar.dart';
import 'package:mocaz/ui/widgets/search/search_widget.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({super.key});

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren>
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SvgPicture.asset('assets/icons/logo_p.svg'),
        actions: [
          chatAppBarWidget(appColors),
          favoritAppbarWidget(appColors),
          newsAppbarWidget(appColors),
        ],
      ),
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
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                children: [searchWidget(appColors, size)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
