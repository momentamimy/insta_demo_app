part of '../screen/login_screen.dart';

class _LoginEmailField extends StatelessWidget {
  const _LoginEmailField();

  @override
  Widget build(BuildContext context) {
    return AuthTextFieldWidget(
      controller: context.read<LoginBloc>().emailController,
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
