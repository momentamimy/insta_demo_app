part of '../screen/signup_screen.dart';


class _SignupEmailField extends StatelessWidget {
  const _SignupEmailField();

  @override
  Widget build(BuildContext context) {
    return AuthTextFieldWidget(
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(" "))
      ],
      controller: context.read<SignupBloc>().emailController,
      prefix: const Icon(Icons.mail_rounded, color: C.secondaryColor),
      textInputAction: TextInputAction.next,
      hintText: tr("email"),
      validate: (value) {
        if (value!.isEmpty) {
          return "please"
              .tr(args: [tr("enter_mail")]);
        } else if (!Utils.validateEmailREGX(value.trim())) {
          return "please"
              .tr(args: [tr("valid_mail")]);
        } else {
          return null;
        }
      },
    );
  }
}
