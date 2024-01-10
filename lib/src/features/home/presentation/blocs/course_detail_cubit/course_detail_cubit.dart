import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entities/course.dart';
import '../../../domain/entities/teachers.dart';
import '../../../domain/use_cases/fetch_course_details_usecase.dart';

part 'course_detail_state.dart';
part 'course_detail_cubit.freezed.dart';

@injectable
class CourseDetailCubit extends Cubit<CourseDetailState> {
  CourseDetailCubit(this._fetchCourseDetail)
      : super(const CourseDetailState.initial());

  final FetchCourseDetailUsecase _fetchCourseDetail;

  Future<void> fetch(String id) async {
    emit(const CourseDetailState.initial());
    final result = await _fetchCourseDetail.call(id);
    result.fold(
      (l) => emit(CourseDetailState.error(l)),
      (r) => emit(CourseDetailState.loaded(r.value1, r.value2)),
    );
  }
}
