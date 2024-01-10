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

import '../../external/register_modules.dart' as _i20;
import '../../features/home/data/repositories/home_repository_impl.dart' as _i8;
import '../../features/home/data/sources/home_source.dart' as _i5;
import '../../features/home/domain/repositories/home_repository.dart' as _i7;
import '../../features/home/domain/use_cases/fetch_all_courses_usecase.dart'
    as _i12;
import '../../features/home/domain/use_cases/fetch_course_details_usecase.dart'
    as _i13;
import '../../features/home/presentation/blocs/all_courses_cubit/all_courses_cubit.dart'
    as _i17;
import '../../features/home/presentation/blocs/course_detail_cubit/course_detail_cubit.dart'
    as _i19;
import '../../features/shared/auth/data/repositories/auth_repository_impl.dart'
    as _i10;
import '../../features/shared/auth/data/sources/auth_source.dart' as _i6;
import '../../features/shared/auth/domain/repositories/auth_repository.dart'
    as _i9;
import '../../features/shared/auth/domain/use_cases/create_account_usecase.dart'
    as _i11;
import '../../features/shared/auth/domain/use_cases/is_user_logged_in_usecase.dart'
    as _i14;
import '../../features/shared/auth/domain/use_cases/login_usecase.dart' as _i15;
import '../../features/shared/auth/domain/use_cases/sign_out_usecase.dart'
    as _i16;
import '../../features/shared/auth/presentation/blocs/auth/auth_bloc.dart'
    as _i18;

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
  gh.lazySingleton<_i5.HomeSource>(
      () => _i5.HomeSourceImpl(gh<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i6.AuthSource>(() => _i6.AuthSourceImpl(
        gh<_i3.FirebaseAuth>(),
        gh<_i4.FirebaseFirestore>(),
      ));
  gh.lazySingleton<_i7.HomeRepository>(
      () => _i8.HomeRepositoryImpl(source: gh<_i5.HomeSource>()));
  gh.lazySingleton<_i9.AuthRepository>(
      () => _i10.AuthRepositoryImpl(source: gh<_i6.AuthSource>()));
  gh.lazySingleton<_i11.CreateAccountUsecase>(
      () => _i11.CreateAccountUsecase(repository: gh<_i9.AuthRepository>()));
  gh.lazySingleton<_i12.FetchAllCourseUsecase>(
      () => _i12.FetchAllCourseUsecase(repository: gh<_i7.HomeRepository>()));
  gh.lazySingleton<_i13.FetchCourseDetailUsecase>(() =>
      _i13.FetchCourseDetailUsecase(repository: gh<_i7.HomeRepository>()));
  gh.lazySingleton<_i14.IsUserLoggedInUsecase>(
      () => _i14.IsUserLoggedInUsecase(repository: gh<_i9.AuthRepository>()));
  gh.lazySingleton<_i15.LoginUsecase>(
      () => _i15.LoginUsecase(repository: gh<_i9.AuthRepository>()));
  gh.lazySingleton<_i16.SignOutUsecase>(
      () => _i16.SignOutUsecase(repository: gh<_i9.AuthRepository>()));
  gh.factory<_i17.AllCoursesCubit>(
      () => _i17.AllCoursesCubit(gh<_i12.FetchAllCourseUsecase>()));
  gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(
        gh<_i14.IsUserLoggedInUsecase>(),
        gh<_i11.CreateAccountUsecase>(),
        gh<_i15.LoginUsecase>(),
        gh<_i16.SignOutUsecase>(),
      ));
  gh.factory<_i19.CourseDetailCubit>(
      () => _i19.CourseDetailCubit(gh<_i13.FetchCourseDetailUsecase>()));
  return getIt;
}

class _$RegisterModule extends _i20.RegisterModule {}
