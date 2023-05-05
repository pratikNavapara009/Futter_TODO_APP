import 'package:flutter/material.dart';
import '../globals/globals.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel theme = ThemeModel(isDark: false);

  void changeTheme() {
    theme.isDark = !theme.isDark;
    notifyListeners();
  }
}
