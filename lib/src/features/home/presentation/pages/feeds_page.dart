import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../routes/routes.dart';
import '../blocs/all_courses_cubit/all_courses_cubit.dart';
import '../widgets/course_tile.dart';

class FeedsPage extends StatelessWidget {
  const FeedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AllCoursesCubit>().fetch();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feeds"),
      ),
      body: BlocBuilder<AllCoursesCubit, AllCoursesState>(
        builder: (context, state) {
          return state.map(
            initial: (_) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loaded: (loaded) {
              return ListView.builder(
                itemCount: loaded.courses.length,
                itemBuilder: (context, index) {
                  final course = loaded.courses[index];
                  return CourseTileWidget(
                    img: course.image,
                    title: course.title,
                    onTap: () {
                      context.push(Routes.course(course.id));
                    },
                  );
                },
              );
            },
            error: (error) {
              return Center(
                child: Text(error.failure.message),
              );
            },
          );
        },
      ),
    );
  }
}
