import 'package:flutter/material.dart';
import 'package:insta_demo_app/core/screen_utils/values_manger.dart';

class SignupImagePicker extends StatelessWidget {
  const SignupImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppSize.s25,
      child: const Center(child: Icon(Icons.add)),
    );
  }
}
