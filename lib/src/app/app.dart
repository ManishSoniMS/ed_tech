import 'package:flutter/material.dart';

import '../../routes/app_router.dart';
import '../../routes/routes.dart';
import '../core/config/app_config.dart';
import '../core/theme/default_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: AppConfig.appKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: DefaultTheme.instance.light,
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: Routes.splash,
    );
  }
}
