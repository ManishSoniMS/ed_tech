import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/base/usecase.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/entities/course.dart';
import '../../../domain/use_cases/fetch_all_courses_usecase.dart';

part 'all_courses_state.dart';
part 'all_courses_cubit.freezed.dart';

@injectable
class AllCoursesCubit extends Cubit<AllCoursesState> {
  AllCoursesCubit(
    this._fetchAllCourse,
  ) : super(const AllCoursesState.initial());

  final FetchAllCourseUsecase _fetchAllCourse;

  Future<void> fetch() async {
    emit(const AllCoursesState.initial());
    final result = await _fetchAllCourse.call(const NoParams());
    result.fold(
      (l) => emit(AllCoursesState.error(l)),
      (r) => emit(AllCoursesState.loaded(r)),
    );
  }
}
