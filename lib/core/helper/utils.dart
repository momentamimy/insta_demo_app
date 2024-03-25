import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class Utils {
  static const userNamePattern = "[a-zA-Z0-9\u0621-\u064A\u0660-\u0669 ]+";

  static void printLongLine(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static bool validatePhoneEgyptREGX(String value) {
    String number = _NumberText.replaceAllNumberIntoEnglish(value);
    String pattern = r'^01\d{9}$';
    RegExp regExp = RegExp(pattern);
    bool result = regExp.hasMatch(number);
    return result;
  }

  static bool validateNameREGX(String value) {
    String pattern =
        r'[!@#$%^&*(),.?":/\[/\]/\\/{}|<>;’_+=~٠١٢٣٤٥٦٧٨٩؟0123456789-]';
    RegExp regExp = new RegExp(pattern);
    RegExp regExp2 = new RegExp(r"[']");
    bool result = !regExp.hasMatch(value) && !regExp2.hasMatch(value);
    return result;
  }

  static bool validateEmailREGX(String value) {
    bool result1 = !"!#\$%&'*+-/=?^_`{|"
        .characters
        .toList()
        .any((element) => element == value[0]);
    String pattern = r"^(?!.*[!#$%&'*+-/=?^_`{|]{2}).*$";
    RegExp regExp = new RegExp(pattern);
    bool result2 = regExp.hasMatch(value);
    return result1 && result2 && EmailValidator.validate(value);
  }

  static String getStringDate(DateTime dateTime) {
    return DateFormat(getDateFormat).format(dateTime);
  }

  static DateTime getDateTime(String dateString) {
    return DateFormat(getDateFormat).parse(dateString);
  }

  static String get getDateFormat => "dd-MM-yyyy";

  static Widget reversWidget(Widget child) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: child,
    );
  }
}


class _NumberText extends Object {
  static String replaceAllNumberIntoEnglish(String text) {
    try {
      String x = text
          .replaceAll("۰", "0")
          .replaceAll("۱", "1")
          .replaceAll("۲", "2")
          .replaceAll("٣", "3")
          .replaceAll("٤", "4")
          .replaceAll("٥", "5")
          .replaceAll("٦", "6")
          .replaceAll("٧", "7")
          .replaceAll("٨", "8")
          .replaceAll("۹", "9")
          .replaceAll("٠", "0")
          .replaceAll("١", "1")
          .replaceAll("٢", "2")
          .replaceAll("٣", "3")
          .replaceAll("٤", "4")
          .replaceAll("٥", "5")
          .replaceAll("٦", "6")
          .replaceAll("٧", "7")
          .replaceAll("٨", "8")
          .replaceAll("٩", "9");

      return x;
    } catch (e) {
      return text;
    }
  }
}
