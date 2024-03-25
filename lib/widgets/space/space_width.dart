import 'package:flutter/material.dart';
import 'package:insta_demo_app/core/screen_utils/values_manger.dart';

class SpaceWidth extends StatelessWidget {
  final double? width;
  const SpaceWidth({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width??AppRatio.w02);
  }
}
