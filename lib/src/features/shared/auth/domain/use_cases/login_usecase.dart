import 'package:injectable/injectable.dart';

import '../../../../../core/base/type_defs.dart';
import '../../../../../core/base/usecase.dart';
import '../dtos/login_dto.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class LoginUsecase extends IUseCase<UserEntity, LoginDTO> {
  const LoginUsecase({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  FailureOr<UserEntity> call(LoginDTO param) async {
    return await _repository.login(param);
  }
}
