part of '../screen/signup_screen.dart';

class _SignupPasswordField extends StatelessWidget {
  const _SignupPasswordField({super.key});

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
