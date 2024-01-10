import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/base/usecase.dart';
import '../../../../../../core/error/failure.dart';
import '../../../domain/dtos/login_dto.dart';
import '../../../domain/dtos/sign_up_dto.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/use_cases/create_account_usecase.dart';
import '../../../domain/use_cases/is_user_logged_in_usecase.dart';
import '../../../domain/use_cases/login_usecase.dart';
import '../../../domain/use_cases/sign_out_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._isUserLoggedIn,
    this._createAccount,
    this._login,
    this._signOut,
  ) : super(const AuthState.initial()) {
    on<_Started>(_onStart);
    on<_LogIn>(_onLogIn);
    on<_SignUp>(_onSignUp);
    on<_LogOut>(_onLogOut);
  }

  final IsUserLoggedInUsecase _isUserLoggedIn;
  final LoginUsecase _login;
  final CreateAccountUsecase _createAccount;
  final SignOutUsecase _signOut;

  Future<void> _onStart(_Started event, Emitter<AuthState> emit) async {
    emit(const AuthState.initial());
    final result = await _isUserLoggedIn.call(const NoParams());

    result.fold(
      (l) => emit(AuthState.unauthenticated(l)),
      (r) => emit(AuthState.authenticated(r)),
    );
  }

  Future<void> _onLogIn(_LogIn event, Emitter<AuthState> emit) async {
    emit(const AuthState.authenticating());
    final result = await _login.call(event.dto);
    result.fold(
      (l) => emit(AuthState.unauthenticated(l)),
      (r) => emit(AuthState.authenticated(r)),
    );
  }

  Future<void> _onSignUp(_SignUp event, Emitter<AuthState> emit) async {
    emit(const AuthState.authenticating());
    final result = await _createAccount.call(event.dto);
    result.fold(
      (l) => emit(AuthState.unauthenticated(l)),
      (r) => emit(AuthState.authenticated(r)),
    );
  }

  Future<void> _onLogOut(_LogOut event, Emitter<AuthState> emit) async {
    final result = await _signOut.call(const NoParams());
    result.fold(
      (l) => null,
      (r) => emit(const AuthState.unauthenticated()),
    );
  }
}
