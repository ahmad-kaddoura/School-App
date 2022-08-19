import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      // HippieBlue
      primaryColor: const Color.fromRGBO(78, 125, 150, 1),
      //FrenchPass
      primaryColorLight: const Color.fromRGBO(159, 201, 221, 1),
      //BlackCurrant
      primaryColorDark: const Color.fromRGBO(10, 13, 37, 1),
      //OysterBay
      backgroundColor: const Color.fromRGBO(227, 237, 242, 1),
      scaffoldBackgroundColor: const Color.fromRGBO(227, 237, 242, 1),
      //Coral
      splashColor: const Color.fromRGBO(237, 137, 89, 1),

      textTheme: const TextTheme(
        headline1: TextStyle(),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData();
  }
}
