import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/app_router.dart';
import '../core/config/app_config.dart';
import '../core/theme/default_theme.dart';
import '../features/home/presentation/blocs/all_courses_cubit/all_courses_cubit.dart';
import '../features/home/presentation/blocs/course_detail_cubit/course_detail_cubit.dart';
import '../features/shared/auth/presentation/blocs/auth/auth_bloc.dart';
import 'injection/injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => sl()..add(const AuthEvent.started()),
        ),
        BlocProvider<AllCoursesCubit>(
          create: (_) => sl(),
        ),
        BlocProvider<CourseDetailCubit>(
          create: (_) => sl(),
        ),
      ],
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: AppConfig.appKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      /// Theme
      theme: DefaultTheme.instance.light,
      themeMode: ThemeMode.light,

      /// Routing
      routerConfig: AppRouter.instance.router,
    );
  }
}
