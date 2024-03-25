import 'package:flutter/material.dart';
import 'package:insta_demo_app/core/screen_utils/values_manger.dart';

class SpaceHeight extends StatelessWidget {
  final double? height;
  const SpaceHeight({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height??AppRatio.h01);
  }
}
