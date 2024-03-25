import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo_app/core/theme/colors.dart';
import 'package:insta_demo_app/widgets/auth_text_field_widget.dart';

class SignupPasswordField extends StatelessWidget {
  const SignupPasswordField({super.key});

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
        } else if (value.length < 8) {
          return tr("msg_pass_short");
        } else {
          return null;
        }
      },
    );
  }
}
