import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_demo_app/core/helper/utils.dart';
import 'package:insta_demo_app/core/theme/colors.dart';
import 'package:insta_demo_app/widgets/auth_text_field_widget.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTextFieldWidget(
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(" "))
      ],
      prefix: const Icon(Icons.mail_rounded, color: C.secondaryColor),
      textInputAction: TextInputAction.next,
      hintText: tr("email"),
      validate: (value) {
        if (value!.isEmpty) {
          return "please"
              .tr(args: [tr("enter_mail")]);
        } else {
          return null;
        }
      },
    );
  }
}
