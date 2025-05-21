import 'package:flutter/material.dart';

class BuyVehicleProvider extends ChangeNotifier {
  String _selectedType = 'Bon Deal';
  List<String> carTypes = ['Bon Deal', 'M-check'];

  String get selectedType => _selectedType;

  // on car type chnaged
  onChanged(newCarType) {
    _selectedType = newCarType;
    notifyListeners();
  }
}
