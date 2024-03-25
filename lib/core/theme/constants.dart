import 'package:flutter/material.dart';

class Q {

  static const String APP_NAME = "insta demo app";

  static const LOCALE_AR = Locale('ar', 'EG');
  static const LOCALE_EN = Locale('en', 'US');

  static Locale selectedLocale = LOCALE_AR;
  static var supportedLanguages = [
    LOCALE_AR,
    LOCALE_EN,
  ];

  static bool get isArabic => selectedLocale == LOCALE_AR;

}
