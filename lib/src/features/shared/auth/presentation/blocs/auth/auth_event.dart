part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;

  const factory AuthEvent.logIn(LoginDTO dto) = _LogIn;

  const factory AuthEvent.signUp(SignUpDTO dto) = _SignUp;

  const factory AuthEvent.logOut() = _LogOut;
}
