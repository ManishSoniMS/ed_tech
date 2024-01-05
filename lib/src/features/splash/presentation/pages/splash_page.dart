import 'package:edtech/src/core/utils/extensions/navigator_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../routes/routes.dart';
import '../../../shared/auth/presentation/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: Routes.splash),
      builder: (context) => const SplashPage(),
    );
  }

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => context.nav.push(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Splash Page"),
            Gap(20.0),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
