import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/type_defs.dart';
import '../../../../core/base/usecase.dart';
import '../entities/course.dart';
import '../entities/teachers.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class FetchCourseDetailUsecase
    extends IUseCase<Tuple2<Course, List<Teachers>>, String> {
  const FetchCourseDetailUsecase({
    required HomeRepository repository,
  }) : _repository = repository;

  final HomeRepository _repository;

  @override
  FailureOr<Tuple2<Course, List<Teachers>>> call(String param) async {
    return await _repository.fetchCourseDetails(param);
  }
}
