

import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: const Color(0xFF2c1111),
  secondaryHeaderColor: const Color(0xFF2c1111),
  disabledColor: const Color(0xFFBABFC4),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xFF2c1111))), colorScheme: const ColorScheme.light(
      primary: Color(0xFFEF7822), secondary: Color(0xFF2c1111)).copyWith(background: const Color(0xFFF3F3F3)).copyWith(error: const Color(0xFFE84D4F)),
);