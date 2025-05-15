import 'package:flutter/material.dart';

class SellVehicleProvider extends ChangeNotifier {
  int _selectedIndex = 1;
  String? selectedYear;
  String? selectedPower;
  String? selectedTransmission;
  String? selectedFuel;
  String? selectedMileage;
  String? selectedBrand;
  String? selectedModel;

  final List<String> years = ['2024', '2023', '2022', '2021'];
  final List<String> powers = ['90 ch', '110 ch', '130 ch'];
  final List<String> transmissions = ['Manuelle', 'Automatique'];
  final List<String> fuels = ['Essence', 'Diesel', 'Hybride', 'Électrique'];
  final List<String> mileages = [
    '< 20,000 km',
    '20,000 - 50,000 km',
    '50,000 - 100,000 km',
    '> 100,000 km',
  ];
  final List<String> brands = ['Peugeot', 'Renault', 'Volkswagen', 'Toyota'];
  final List<String> models = ['208', 'Clio', 'Golf', 'Yaris'];

  int get selectedIndex => _selectedIndex;
  final List<String> options = [
    'Reprise avec un véhicule neuf',
    'Reprise avec un véhicule occasion',
    'Vendre ma Voiture',
  ];

  // on new option selected
  void onOptionChnaged(index) {
    _selectedIndex = index;
    notifyListeners();
  }

  // on new year affected
  void onYearChnaged(String value) {
    selectedYear = value;
    notifyListeners();
  }

  // on new year affected
  void onPawerChnaged(String value) {
    selectedPower = value;
    notifyListeners();
  }

  // on new transmision affected
  void onTransmitionChnaged(String value) {
    selectedTransmission = value;
    notifyListeners();
  }

  // on new Fuel affected
  void onFuelChnaged(String value) {
    selectedFuel = value;
    notifyListeners();
  }

  // on new Mileage affected
  void onMileageChnaged(String value) {
    selectedMileage = value;
    notifyListeners();
  }

  // on new Mileage affected
  void onBrandChnaged(String value) {
    selectedBrand = value;
    notifyListeners();
  }

  // on new Model affected
  void onModelChnaged(String value) {
    selectedModel = value;
    notifyListeners();
  }
}
