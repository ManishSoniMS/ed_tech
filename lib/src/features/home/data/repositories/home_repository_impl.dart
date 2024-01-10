import 'package:dartz/dartz.dart';
import 'package:edtech/src/features/home/domain/entities/teachers.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/type_defs.dart';
import '../../../../core/error/map_exception_to_error.dart';
import '../../domain/entities/course.dart';
import '../../domain/repositories/home_repository.dart';
import '../sources/home_source.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({
    required HomeSource source,
  }) : _source = source;

  final HomeSource _source;

  @override
  FailureOr<List<Course>> fetchAllCourses() async {
    try {
      final result = await _source.fetchAllCourses();
      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  FailureOr<Tuple2<Course, List<Teachers>>> fetchCourseDetails(
      String id) async {
    try {
      final result = await _source.fetchCourseDetails(id);
      return Right(result);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
