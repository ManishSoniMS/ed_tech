import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../routes/routes.dart';
import '../../../shared/auth/presentation/blocs/auth/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            unauthenticated: (_) {
              context.pushReplacement(Routes.login);
            },
            authenticated: (_) {
              context.pushReplacement(Routes.home);
            },
          );
        },
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Splash Page"),
              Gap(20.0),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
