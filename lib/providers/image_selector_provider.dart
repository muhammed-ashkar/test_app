import 'package:flutter/material.dart';

class ImageSelectorProvider extends ChangeNotifier {
  String _imagePath = '';
  String get imagePath => _imagePath;

  void setImagePath(String imagePath){
    _imagePath = imagePath;
    notifyListeners();
  }
}