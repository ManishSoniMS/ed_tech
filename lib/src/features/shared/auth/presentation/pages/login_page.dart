import 'package:edtech/src/core/utils/extensions/navigator_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../core/config/app_config.dart';
import '../../../../../core/constants/constraints/app_constraints.dart';
import '../../../../../core/utils/validators/validators.dart';
import '../../../../home/presentation/pages/home_page.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: Routes.login),
      builder: (context) => const LoginPage(),
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState> _formKey;

  bool _hidePassword = true;

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();

    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.nav.pushReplacement(HomePage.route());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Image.asset(Assets.images.authArc.path),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.all(AppConstraints.extraLarge * 1.5),
                  child: Form(
                    key: _formKey,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// Name

                        SizedBox(
                          height: AppConstraints.textFieldHeight,
                          child: TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              hintText: "Name",
                            ),
                            validator: FormValidator([
                              RequiredValidator(),
                            ]),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const Gap(AppConstraints.large),

                        /// email

                        SizedBox(
                          height: AppConstraints.textFieldHeight,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: "Enter Your E-Mail",
                            ),
                            validator: FormValidator([
                              RequiredValidator(),
                              EmailValidator(),
                            ]),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const Gap(AppConstraints.large),

                        /// Password
                        SizedBox(
                          height: AppConstraints.textFieldHeight,
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: IconButton(
                                onPressed: () => setState(
                                    () => _hidePassword = !_hidePassword),
                                icon: Icon(
                                  _hidePassword ? Icons.key_off : Icons.key,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            validator: FormValidator([
                              RequiredValidator(),
                            ]),
                            obscureText: _hidePassword,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => _login(context),
                          ),
                        ),
                        const Gap(AppConstraints.large),

                        /// login button
                        SizedBox(
                          width: double.infinity,
                          height: AppConstraints.textFieldHeight,
                          child: ElevatedButton(
                            onPressed: () => _login(context),
                            child: Text(
                              "Login",
                              style: textTheme.bodyLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),

                        const Gap(AppConstraints.large * 2),
                        GestureDetector(
                          onTap: () {
                            context.nav.push(SignUpPage.route());
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have account?",
                              style: textTheme.bodySmall
                                  ?.copyWith(color: Colors.grey),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " SignUp Now",
                                  style: textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
