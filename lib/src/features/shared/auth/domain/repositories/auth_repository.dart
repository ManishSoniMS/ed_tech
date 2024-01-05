import '../../../../../core/base/type_defs.dart';
import '../dtos/sign_up_dto.dart';
import '../entities/user.dart';
import '../dtos/login_dto.dart';

abstract class AuthRepository {
  FailureOr<UserEntity> isUserLoggedIn();

  FailureOr<UserEntity> login(LoginDTO dto);

  FailureOr<UserEntity> createAccount(SignUpDTO dto);

  FailureOr<void> signOut();
}
