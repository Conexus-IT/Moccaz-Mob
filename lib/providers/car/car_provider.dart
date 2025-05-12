import 'package:flutter/material.dart';

class CarProvider extends ChangeNotifier {
  int _slectedImageCounter = 1;

  get slectedImageCounter => _slectedImageCounter;

  // this function when carousle slider chnaged
  void onImageChanged(int value) {
    _slectedImageCounter = value + 1;
    notifyListeners();
  }
}
