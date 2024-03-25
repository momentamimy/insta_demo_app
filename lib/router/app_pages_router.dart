import 'package:go_router/go_router.dart';
import 'package:insta_demo_app/modules/auth/login/presentation/screen/login_screen.dart';
import 'package:insta_demo_app/modules/auth/sign_up/presentation/screen/signup_screen.dart';
import 'package:insta_demo_app/router/app_routes.dart';

final appRouter = GoRouter(initialLocation: AppRoutes.login,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      builder: (context, state) => const SignupScreen(),
    )
  ],
);
