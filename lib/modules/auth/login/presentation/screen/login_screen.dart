import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:insta_demo_app/core/screen_utils/values_manger.dart';
import 'package:insta_demo_app/modules/auth/login/presentation/components/login_email_field.dart';
import 'package:insta_demo_app/modules/auth/login/presentation/components/login_password_field.dart';
import 'package:insta_demo_app/router/app_routes.dart';
import 'package:insta_demo_app/widgets/app_custom_button.dart';
import 'package:insta_demo_app/widgets/app_text_button.dart';
import 'package:insta_demo_app/widgets/space/space_height.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(flex: 2),
          const Text("insta app"),
          const Spacer(),
          const LoginEmailField(),
          SpaceHeight(height: AppPadding.p10),
          const LoginPasswordField(),
          SpaceHeight(height: AppPadding.p20),
          AppCustomButton(
            title: tr("login"),
            onPressed: () {},
          ),
          SpaceHeight(height: AppPadding.p20),
          AppTextButton(title: tr("register"),
              onPressed: () => context.go(AppRoutes.signup)),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}
