import 'package:edtech/src/core/utils/extensions/navigator_extension.dart';
import 'package:flutter/material.dart';

import '../widgets/course_tile.dart';
import 'course_detail_page.dart';

class FeedsPage extends StatelessWidget {
  const FeedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feeds"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => CourseTileWidget(
          id: index.toString(),
          onTap: () {
            context.nav.push(CourseDetailPage.route(index.toString()));
          },
        ),
      ),
    );
  }
}
