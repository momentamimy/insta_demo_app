part of '../screen/signup_screen.dart';

class _SignupImagePicker extends StatelessWidget {
  const _SignupImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppSize.s25,
      child: const Center(child: Icon(Icons.add)),
    );
  }
}
