import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../src/features/home/presentation/pages/course_detail_page.dart';
import '../src/features/home/presentation/pages/home_page.dart';
import '../src/features/shared/auth/presentation/pages/login_page.dart';
import '../src/features/shared/auth/presentation/pages/signup_page.dart';
import '../src/features/shared/error/presentation/pages/not_found_page.dart';
import '../src/features/splash/presentation/pages/splash_page.dart';
import 'routes.dart';

class AppRouter {
  AppRouter._();

  static Route onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    log("\n\n on generate route arg == $arg \n\n");
    switch (settings.name) {
      case Routes.splash:
        return SplashPage.route();

      case Routes.login:
        return LoginPage.route();

      case Routes.signup:
        return SignUpPage.route();

      case Routes.home:
        return HomePage.route();

      case Routes.course:
        return CourseDetailPage.route("dcd");

      default:
        return NotFoundPage.route();
    }
  }
}
