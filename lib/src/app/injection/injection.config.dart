// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../external/register_modules.dart' as _i13;
import '../../features/shared/auth/data/repositories/auth_repository_impl.dart'
    as _i7;
import '../../features/shared/auth/data/sources/auth_source.dart' as _i5;
import '../../features/shared/auth/domain/repositories/auth_repository.dart'
    as _i6;
import '../../features/shared/auth/domain/use_cases/create_account_usecase.dart'
    as _i8;
import '../../features/shared/auth/domain/use_cases/is_user_logged_in_usecase.dart'
    as _i9;
import '../../features/shared/auth/domain/use_cases/login_usecase.dart' as _i10;
import '../../features/shared/auth/domain/use_cases/sign_out_usecase.dart'
    as _i11;
import '../../features/shared/auth/presentation/blocs/auth/auth_bloc.dart'
    as _i12;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initSL(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.FirebaseAuth>(registerModule.firebaseAuth);
  gh.singleton<_i4.FirebaseFirestore>(registerModule.firestore);
  gh.lazySingleton<_i5.AuthSource>(() => _i5.AuthSourceImpl(
        gh<_i3.FirebaseAuth>(),
        gh<_i4.FirebaseFirestore>(),
      ));
  gh.lazySingleton<_i6.AuthRepository>(
      () => _i7.AuthRepositoryImpl(source: gh<_i5.AuthSource>()));
  gh.lazySingleton<_i8.CreateAccountUsecase>(
      () => _i8.CreateAccountUsecase(repository: gh<_i6.AuthRepository>()));
  gh.lazySingleton<_i9.IsUserLoggedInUsecase>(
      () => _i9.IsUserLoggedInUsecase(repository: gh<_i6.AuthRepository>()));
  gh.lazySingleton<_i10.LoginUsecase>(
      () => _i10.LoginUsecase(repository: gh<_i6.AuthRepository>()));
  gh.lazySingleton<_i11.SignOutUsecase>(
      () => _i11.SignOutUsecase(repository: gh<_i6.AuthRepository>()));
  gh.factory<_i12.AuthBloc>(() => _i12.AuthBloc(
        gh<_i9.IsUserLoggedInUsecase>(),
        gh<_i8.CreateAccountUsecase>(),
        gh<_i10.LoginUsecase>(),
        gh<_i11.SignOutUsecase>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i13.RegisterModule {}
