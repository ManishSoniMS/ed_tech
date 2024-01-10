import 'package:dartz/dartz.dart';

import '../../../../core/base/type_defs.dart';
import '../entities/course.dart';
import '../entities/teachers.dart';

abstract class HomeRepository {
  FailureOr<List<Course>> fetchAllCourses();

  FailureOr<Tuple2<Course, List<Teachers>>> fetchCourseDetails(String id);
}
