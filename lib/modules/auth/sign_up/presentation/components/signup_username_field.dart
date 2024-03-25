import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_demo_app/core/helper/utils.dart';
import 'package:insta_demo_app/core/theme/colors.dart';
import 'package:insta_demo_app/widgets/auth_text_field_widget.dart';

class SignupUsernameField extends StatelessWidget {
  const SignupUsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTextFieldWidget(
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(Utils.userNamePattern))
      ],
      prefix: const Icon(Icons.person, color: C.secondaryColor),
      hintText: tr("name"),
      validate: (value) {
        if (value!.isNotEmpty) {
          if (value.characters.every((element) => element == " ")) {
            return tr("msg_name_should_not_spaces_only");
          } else if (value.characters.first == " ") {
            return tr("msg_name_should_not_start_space");
          } else if (!Utils.validateNameREGX(value)) {
            return tr("msg_name_validation");
          } else {
            return null;
          }
        } else {
          return tr("please", args: [tr("enter_name")]);
        }
      },
    );
  }
}
