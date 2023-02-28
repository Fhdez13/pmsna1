import 'package:flutter/material.dart';

class StylesSettings {
  
  static ThemeData lightTheme(){
    final theme = ThemeData.light();
    return theme.copyWith(
      //colorScheme: Colors.green
    );
  }

  static ThemeData darkTheme(){
    final theme = ThemeData.dark();
    return theme.copyWith(
      primaryColorDark: Colors.blueGrey
    );
  }
}