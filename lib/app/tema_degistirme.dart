import 'package:flutter/material.dart';

class TemaDegistirme extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;



  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();  // Değişikliği dinleyen widget'lara bildir
  }
}
