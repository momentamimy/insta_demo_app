import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:insta_demo_app/core/screen_utils/values_manger.dart';
import 'package:insta_demo_app/modules/auth/sign_up/presentation/components/signup_email_field.dart';
import 'package:insta_demo_app/modules/auth/sign_up/presentation/components/signup_image_picker.dart';
import 'package:insta_demo_app/modules/auth/sign_up/presentation/components/signup_password_field.dart';
import 'package:insta_demo_app/modules/auth/sign_up/presentation/components/signup_username_field.dart';
import 'package:insta_demo_app/router/app_routes.dart';
import 'package:insta_demo_app/widgets/app_custom_button.dart';
import 'package:insta_demo_app/widgets/app_text_button.dart';
import 'package:insta_demo_app/widgets/space/space_height.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(flex: 2),
          const Text("insta app"),
          const Spacer(),
          const SignupImagePicker(),
          const Spacer(),
          const SignupUsernameField(),
          SpaceHeight(height: AppPadding.p10),
          const SignupEmailField(),
          SpaceHeight(height: AppPadding.p10),
          const SignupPasswordField(),
          SpaceHeight(height: AppPadding.p20),
          AppCustomButton(
            title: tr("sign_up"),
            onPressed: () {},
          ),
          SpaceHeight(height: AppPadding.p20),
          AppTextButton(title: tr("login"),
              onPressed: () => context.go(AppRoutes.login)),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}
