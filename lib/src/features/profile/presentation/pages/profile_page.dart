import 'package:edtech/src/core/config/app_config.dart';
import 'package:edtech/src/features/shared/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            context.pushReplacement(Routes.login);
            messenger.showSnackBar(
                const SnackBar(content: Text("Session logged out.")));
          },
          builder: (context, state) {
            return ElevatedButton.icon(
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.logOut());
              },
              icon: const Icon(Icons.exit_to_app_rounded),
              label: const Text("LogOut"),
            );
          },
        ),
      ),
    );
  }
}
