part of 'all_courses_cubit.dart';

@freezed
class AllCoursesState with _$AllCoursesState {
  const factory AllCoursesState.initial() = _Initial;

  const factory AllCoursesState.loaded(List<Course> courses) = _Loaded;

  const factory AllCoursesState.error(Failure failure) = _Error;
}
