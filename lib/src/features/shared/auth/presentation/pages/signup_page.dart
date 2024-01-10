import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../core/config/app_config.dart';
import '../../../../../core/constants/constraints/app_constraints.dart';
import '../../../../../core/utils/validators/validators.dart';
import '../../domain/dtos/sign_up_dto.dart';
import '../blocs/auth/auth_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late GlobalKey<FormState> _formKey;

  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    super.initState();
  }

  _signup(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final dto = SignUpDTO(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        password: _passwordController.text,
      );
      context.read<AuthBloc>().add(AuthEvent.signUp(dto));
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
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  state.whenOrNull(
                    authenticated: (_) {
                      context.pushReplacement(Routes.home);
                    },
                    unauthenticated: (failure) {
                      if (failure != null) {
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text(failure.message),
                          ),
                        );
                      }
                    },
                  );
                },
                builder: (context, state) {
                  final bool loading = state.maybeWhen(
                    orElse: () => false,
                    authenticated: (_) => false,
                    authenticating: () => true,
                  );
                  return Center(
                    child: Form(
                      key: _formKey,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Padding(
                        padding: const EdgeInsets.all(
                            AppConstraints.extraLarge * 1.5),
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

                            /// mobile number
                            SizedBox(
                              height: AppConstraints.textFieldHeight,
                              child: TextFormField(
                                controller: _phoneController,
                                decoration: const InputDecoration(
                                  hintText: "Mobile Number",
                                ),
                                validator: FormValidator([
                                  RequiredValidator(),
                                  PhoneNumberValidator(),
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
                                      !_hidePassword
                                          ? Icons.key
                                          : Icons.key_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                validator: FormValidator([
                                  RequiredValidator(),
                                  MaximumLengthValidator(maxLength: 16),
                                  MinimumLengthValidator(minLength: 6),
                                ]),
                                obscureText: _hidePassword,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            const Gap(AppConstraints.large),

                            /// Confirm Password
                            SizedBox(
                              height: AppConstraints.textFieldHeight,
                              child: TextFormField(
                                controller: _confirmPasswordController,
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  suffixIcon: IconButton(
                                    onPressed: () => setState(() =>
                                        _hideConfirmPassword =
                                            !_hideConfirmPassword),
                                    icon: Icon(
                                      !_hideConfirmPassword
                                          ? Icons.key
                                          : Icons.key_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                validator: FormValidator([
                                  RequiredValidator(),
                                  ConfirmPasswordValidator(
                                      _passwordController.text),
                                ]),
                                onFieldSubmitted: (_) => _signup(context),
                                obscureText: _hideConfirmPassword,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                            const Gap(AppConstraints.large),

                            /// Sign up button
                            SizedBox(
                              width: double.infinity,
                              height: AppConstraints.textFieldHeight,
                              child: ElevatedButton(
                                onPressed:
                                    loading ? null : () => _signup(context),
                                child: loading
                                    ? const CircularProgressIndicator()
                                    : Text(
                                        "Sign Up",
                                        style: textTheme.bodyLarge?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                              ),
                            ),

                            const Gap(AppConstraints.large),
                            RichText(
                              text: TextSpan(
                                text:
                                    "By creating on sign-up, you agree to Khan Global Studies ",
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.grey,
                                  fontSize: 11.0,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Terms and Condition",
                                    style: textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontSize: 11.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: AppConstraints.extraLarge,
                width: size.width,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account?",
                        style:
                            textTheme.bodySmall?.copyWith(color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(
                            text: " Sign In Now",
                            style: textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
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
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
