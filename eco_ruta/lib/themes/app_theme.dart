import 'package:flutter/material.dart';

class AppTheme {
  //Colores
  static const Color seedColor = Color.fromARGB(255, 237, 120, 11);
  static const Color primaryColor = Colors.yellow;
  static const Color accentColor = Colors.orange;

  //Tamanos por defecto
  static const double defaultFontSize = 16;
  static const double titleFontSize = 24;

  static ThemeData lightTheme = ThemeData(
    colorSchemeSeed: seedColor,
  );
}
