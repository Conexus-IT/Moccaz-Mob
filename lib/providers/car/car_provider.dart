import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:mocaz/data/models/car.dart';
import 'package:mocaz/data/models/demo_car_list.dart';

class CarProvider extends ChangeNotifier {
  int _slectedImageCounter = 1;
  CarouselSliderController carouselSliderController =
      CarouselSliderController();

  List<Car> listOffCars = List.from(carList);

  get slectedImageCounter => _slectedImageCounter;

  void renisilizeSlectedImageCounter() {
    log('here');
    _slectedImageCounter = 1;
    notifyListeners();
  }

  // this function when carousle slider chnaged
  void onImageChanged(int value) {
    _slectedImageCounter = value + 1;
    notifyListeners();
  }

  // carousle slide jump to next image using carousle controller
  void nextImage(imageLenght) {
    if (slectedImageCounter != imageLenght) {
      carouselSliderController.nextPage();
    }
  }

  // carousle slide back to next image using carousle controller
  void previousImage() {
    if (slectedImageCounter != 1) {
      carouselSliderController.previousPage();
    }
  }
}
