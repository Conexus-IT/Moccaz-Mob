import 'package:flutter/material.dart';
import 'package:mocaz/ui/views/tabs/ambassadors_screen.dart';
import 'package:mocaz/ui/views/tabs/buy_screen.dart';
import 'package:mocaz/ui/views/tabs/home_screen.dart';
import 'package:mocaz/ui/views/tabs/sale_screen.dart';
import 'package:mocaz/ui/views/tabs/settings_screen.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
   
    SaleScreen(), BuyScreen(),
    AmbassadorsScreen(),
    SettingsScreen(),
  ];

  List<Widget> get widgetOptions => _widgetOptions;

  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
