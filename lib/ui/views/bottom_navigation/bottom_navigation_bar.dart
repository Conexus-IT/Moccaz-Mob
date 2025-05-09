import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/providers/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:mocaz/ui/widgets/appbar/appbar.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScrenState();
}

class _BottomNavigationBarScrenState extends State<BottomNavigationBarScreen>
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
    return ChangeNotifierProvider(
      create: (context) => BottomNavigationBarProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,

          title: SvgPicture.asset('assets/icons/logo_p.svg'),
          actions: [
            chatAppBarWidget(appColors),
            favoritAppbarWidget(appColors),
            newsAppbarWidget(appColors),
          ],
        ),
        body: Consumer<BottomNavigationBarProvider>(
          builder: (context, value, child) {
            int index = value.selectedIndex;
            return value.widgetOptions.elementAt(index);
          },
        ),
        bottomNavigationBar: Consumer<BottomNavigationBarProvider>(
          builder:
              (context, value, child) => BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Accueil',
                    backgroundColor: appColors.purple,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.attach_money),
                    label: 'Achat',
                    backgroundColor: appColors.purple,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.store_outlined),
                    label: 'Vente',
                    backgroundColor: appColors.purple,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.groups_rounded),
                    label: 'Ambassadeurs',
                    backgroundColor: appColors.purple,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Paramètres',
                    backgroundColor: appColors.purple,
                  ),
                ],
                // backgroundColor: appColors.purple,
                currentIndex: value.selectedIndex,
                unselectedItemColor: appColors.purpleLight,
                showUnselectedLabels: true,
                selectedItemColor: appColors.white,
                onTap: value.onItemTapped,
              ),
        ),
      ),
    );
  }
}
