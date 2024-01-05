import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/base/type_defs.dart';
import '../../../../../core/error/map_exception_to_error.dart';
import '../../domain/dtos/login_dto.dart';
import '../../domain/dtos/sign_up_dto.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../sources/auth_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required AuthSource source,
  }) : _source = source;

  final AuthSource _source;

  @override
  FailureOr<UserEntity> isUserLoggedIn() async {
    try {
      final result = await _source.isUserLoggedIn();
      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  FailureOr<UserEntity> login(LoginDTO dto) async {
    try {
      final result = await _source.login(dto);
      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  FailureOr<UserEntity> createAccount(SignUpDTO dto) async {
    try {
      final result = await _source.createAccount(dto);
      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  FailureOr<void> signOut() async {
    try {
      final result = await _source.signOut();
      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
