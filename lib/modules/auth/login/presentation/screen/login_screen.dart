import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:insta_demo_app/core/screen_utils/values_manger.dart';
import 'package:insta_demo_app/modules/auth/login/data/data_sourse/login_remote_data_source.dart';
import 'package:insta_demo_app/modules/auth/login/presentation/bloc/login_bloc.dart';
import 'package:insta_demo_app/router/app_routes.dart';
import 'package:insta_demo_app/widgets/app_custom_button.dart';
import 'package:insta_demo_app/widgets/app_text_button.dart';
import 'package:insta_demo_app/widgets/space/space_height.dart';
import 'package:flutter/services.dart';
import 'package:insta_demo_app/core/theme/colors.dart';
import 'package:insta_demo_app/widgets/auth_text_field_widget.dart';

part '../components/login_email_field.dart';

part '../components/login_password_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(loginRepository: LoginRemoteDataSource()),
      child: Scaffold(
        body: Column(
          children: [
            const Spacer(flex: 2),
            const Text("insta app"),
            const Spacer(),
            const _LoginEmailField(),
            SpaceHeight(height: AppPadding.p10),
            const _LoginPasswordField(),
            SpaceHeight(height: AppPadding.p20),
            BlocConsumer<LoginBloc,LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return AppCustomButton(
                    title: tr("login"),
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginWithEmailAndPassword());
                    },
                  );
                }
              },
              listener: (context, state) {
                if (state is LoginFailed) {
                  print("__________${state.errorMessage}");
                }else if (state is LoginSuccess) {
                  context.go(AppRoutes.home);
                }
              },
            ),
            SpaceHeight(height: AppPadding.p20),
            AppTextButton(
                title: tr("register"),
                onPressed: () => context.push(AppRoutes.signup)),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
