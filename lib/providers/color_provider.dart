import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  String currentColor = 'Blue';

  void setColor(String newColor) {
    currentColor = newColor;
    notifyListeners();
  }

  String getColor() {
    return currentColor;
  }
}
