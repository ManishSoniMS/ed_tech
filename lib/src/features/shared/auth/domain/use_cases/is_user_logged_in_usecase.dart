import 'package:injectable/injectable.dart';

import '../../../../../core/base/type_defs.dart';
import '../../../../../core/base/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class IsUserLoggedInUsecase extends IUseCase<UserEntity, NoParams> {
  const IsUserLoggedInUsecase({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  FailureOr<UserEntity> call(NoParams param) async {
    return await _repository.isUserLoggedIn();
  }
}
