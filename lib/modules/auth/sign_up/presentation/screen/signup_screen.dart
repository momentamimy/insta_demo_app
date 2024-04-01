import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:insta_demo_app/core/screen_utils/values_manger.dart';
import 'package:insta_demo_app/router/app_routes.dart';
import 'package:insta_demo_app/widgets/app_custom_button.dart';
import 'package:insta_demo_app/widgets/app_text_button.dart';
import 'package:insta_demo_app/widgets/space/space_height.dart';
import 'package:flutter/services.dart';
import 'package:insta_demo_app/core/helper/utils.dart';
import 'package:insta_demo_app/core/theme/colors.dart';
import 'package:insta_demo_app/widgets/auth_text_field_widget.dart';

part '../components/signup_email_field.dart';
part '../components/signup_image_picker.dart';
part '../components/signup_password_field.dart';
part '../components/signup_username_field.dart';

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
          const _SignupImagePicker(),
          const Spacer(),
          const _SignupUsernameField(),
          SpaceHeight(height: AppPadding.p10),
          const _SignupEmailField(),
          SpaceHeight(height: AppPadding.p10),
          const _SignupPasswordField(),
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
