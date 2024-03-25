import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo_app/core/theme/colors.dart';
import 'package:insta_demo_app/widgets/auth_text_field_widget.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTextFieldWidget(
      prefix: const Icon(Icons.lock, color: C.secondaryColor),
      hintText: tr("password"),
      textInputAction:
      TextInputAction.next,
      obscureText: true,
      validate: (value) {
        if (value!.isEmpty) {
          return "please".tr(args: [tr("enter_password")]);
        } else {
          return null;
        }
      },
    );
  }
}
