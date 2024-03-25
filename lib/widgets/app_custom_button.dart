import 'package:flutter/material.dart';
import 'package:insta_demo_app/core/theme/colors.dart';

class AppCustomButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  const AppCustomButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(backgroundColor: C.secondaryColor),
      child: Text(title),
    );
  }
}
