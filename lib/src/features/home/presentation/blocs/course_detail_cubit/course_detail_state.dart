part of 'course_detail_cubit.dart';

@freezed
class CourseDetailState with _$CourseDetailState {
  const factory CourseDetailState.initial() = _Initial;

  const factory CourseDetailState.loaded(
    Course course,
    List<Teachers> teachers,
  ) = _Loaded;

  const factory CourseDetailState.error(Failure failure) = _Error;
}
