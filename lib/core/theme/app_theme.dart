import 'package:flutter/material.dart';
import 'package:insta_demo_app/core/theme/colors.dart';

final ThemeData appTheme = ThemeData(
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.fromSeed(
        seedColor: C.primaryColor, background: Colors.white),
    useMaterial3: true,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor:
          MaterialStateColor.resolveWith((states) => C.primaryColor),
    )));
