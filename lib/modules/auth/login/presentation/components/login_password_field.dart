part of '../screen/login_screen.dart';

class _LoginPasswordField extends StatelessWidget {
  const _LoginPasswordField();

  @override
  Widget build(BuildContext context) {
    return AuthTextFieldWidget(
      controller: context.read<LoginBloc>().passwordController,
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
