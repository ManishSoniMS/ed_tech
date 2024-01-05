import 'package:injectable/injectable.dart';

import '../../../../core/base/type_defs.dart';
import '../../../../core/base/usecase.dart';
import '../entities/course.dart';
import '../repositories/home_repository.dart';

@lazySingleton
class FetchAllCourseUsecase extends IUseCase<List<Course>, NoParams> {
  const FetchAllCourseUsecase({
    required HomeRepository repository,
  }) : _repository = repository;

  final HomeRepository _repository;

  @override
  FailureOr<List<Course>> call(NoParams param) async {
    return await _repository.fetchAllCourses();
  }
}
