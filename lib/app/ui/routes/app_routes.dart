import 'package:flutter/widgets.dart';

import '../pages/home/home_page.dart';
import '../pages/login/login_page.dart';
import '../pages/register/register_page.dart';
import '../pages/reset_password/reset_password_page.dart';
import '../pages/splash/splash_page.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.splash: (_) => const SplashPage(),
      Routes.login: (_) => const LoginPage(),
      Routes.home: (_) => const HomePage(),
      Routes.register: (_) => const RegisterPage(),
      Routes.resetPassword: (_) => const ResetPasswordPage(),
    };
