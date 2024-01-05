import 'package:injectable/injectable.dart';

import '../../../../../core/base/type_defs.dart';
import '../../../../../core/base/usecase.dart';
import '../dtos/sign_up_dto.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class CreateAccountUsecase extends IUseCase<UserEntity, SignUpDTO> {
  const CreateAccountUsecase({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;
  @override
  FailureOr<UserEntity> call(SignUpDTO param) async {
    return await _repository.createAccount(param);
  }
}
