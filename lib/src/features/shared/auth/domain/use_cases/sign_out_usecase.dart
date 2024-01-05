import 'package:injectable/injectable.dart';

import '../../../../../core/base/type_defs.dart';
import '../../../../../core/base/usecase.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class SignOutUsecase extends IUseCase<void, NoParams> {
  const SignOutUsecase({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  FailureOr<void> call(NoParams param) async {
    return await _repository.signOut();
  }
}
