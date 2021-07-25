import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    print(isOn);
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    print(themeMode);
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
  );
}
