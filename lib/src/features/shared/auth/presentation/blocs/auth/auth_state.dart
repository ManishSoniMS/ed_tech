part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.authenticating() = _Authenticating;

  const factory AuthState.authenticated(UserEntity user) = _Authenticated;

  const factory AuthState.unauthenticated([Failure? failure]) = _Unauthenticated;
}
