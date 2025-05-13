import 'package:flutter/material.dart';
import 'package:mocaz/data/models/car.dart';
import 'package:mocaz/data/models/demo_car_list.dart';

class CarProvider extends ChangeNotifier {
  int _slectedImageCounter = 1;

  List<Car> listOffCars = List.from(carList);

  get slectedImageCounter => _slectedImageCounter;

  // this function when carousle slider chnaged
  void onImageChanged(int value) {
    _slectedImageCounter = value + 1;
    notifyListeners();
  }
}
