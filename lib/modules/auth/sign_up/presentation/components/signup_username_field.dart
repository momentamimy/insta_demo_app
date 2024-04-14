part of '../screen/signup_screen.dart';

class _SignupUsernameField extends StatelessWidget {
  const _SignupUsernameField();

  @override
  Widget build(BuildContext context) {
    return AuthTextFieldWidget(
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(Utils.userNamePattern))
      ],
      prefix: const Icon(Icons.person, color: C.secondaryColor),
      controller: context.read<SignupBloc>().nameController,
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
