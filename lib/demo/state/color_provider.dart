import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class ColorProvider extends ChangeNotifier {
//   List<Color> colors = [Colors.blue, Colors.red, Colors.green, Colors.yellow];
//
//   Color selectedColor = Colors.blue;
//
//   void updateColor(int index) {
//     selectedColor = colors[index];
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  final List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
  ];

  int _selectedIndex = 0;

  List<Color> get colors => _colors;

  Color get selectedColor => _colors[_selectedIndex];

  int get selectedIndex => _selectedIndex;

  void updateColor(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}
