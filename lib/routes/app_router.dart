import 'package:go_router/go_router.dart';

import '../src/features/home/presentation/pages/course_detail_page.dart';
import '../src/features/home/presentation/pages/home_page.dart';
import '../src/features/shared/auth/presentation/pages/login_page.dart';
import '../src/features/shared/auth/presentation/pages/signup_page.dart';
import '../src/features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._();

  static AppRouter get instance => _instance;

  late GoRouter _router;

  GoRouter get router => _router;

  AppRouter._() {
    _router = GoRouter(
      routes: [
        GoRoute(
          path: "/",
          name: "Splash Page",
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: "/login",
          name: "LogIn Page",
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: "/signup",
          name: "SignUp Page",
          builder: (context, state) => const SignUpPage(),
        ),
        GoRoute(
          path: "/home",
          name: "Home Page",
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: "/home/course/:id",
          name: "Course Detail Page",
          builder: (context, state) =>
              CourseDetailPage(id: state.pathParameters["id"]!),
        ),
      ],
    );
  }
}
