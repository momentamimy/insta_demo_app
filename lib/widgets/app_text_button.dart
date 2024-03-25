import 'package:flutter/material.dart';
import 'package:insta_demo_app/core/theme/colors.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const AppTextButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPressed(),
        child: Text(
          title,
          style: const TextStyle(color: C.primaryColor),
        ));
  }
}
