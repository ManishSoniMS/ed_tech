import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/constants/constraints/app_constraints.dart';
import '../../domain/entities/about_course.dart';

class CourseDescriptionWidget extends StatefulWidget {
  const CourseDescriptionWidget({
    super.key,
    required this.aboutCourse,
  });
  final List<AboutCourse> aboutCourse;
  @override
  State<CourseDescriptionWidget> createState() =>
      _CourseDescriptionWidgetState();
}

class _CourseDescriptionWidgetState extends State<CourseDescriptionWidget> {
  bool readMore = false;
  @override
  Widget build(BuildContext context) {
    final about = widget.aboutCourse;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstraints.large),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(AppConstraints.large),
          Row(
            children: [
              Text(
                "About Course",
                style: textTheme.titleSmall,
              ),
              const Spacer(),
              if (readMore)
                InkWell(
                  onTap: () => setState(() => readMore = false),
                  child: Text(
                    "Read less",
                    style: textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
            ],
          ),
          const Gap(AppConstraints.medium),
          Stack(
            children: [
              Visibility(
                visible: readMore,
                // maintainState: true,
                replacement: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          about.first.title,
                          style: textTheme.bodyLarge,
                        ),
                        Text(
                          about.first.description.length < 130
                              ? about.first.description
                              : "${about.first.description.substring(0, 130)}...",
                          style: textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey),
                        ),
                        const Gap(AppConstraints.medium),
                      ],
                    ),
                    Positioned(
                      bottom: AppConstraints.medium,
                      right: 0.0,
                      child: InkWell(
                        onTap: () => setState(() => readMore = true),
                        child: Text(
                          "Read more",
                          style: textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: about
                      .map(
                        (e) => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title,
                              style: textTheme.bodyLarge,
                            ),
                            Text(
                              e.description,
                              style: textTheme.bodyMedium
                                  ?.copyWith(color: Colors.grey),
                            ),
                            const Gap(AppConstraints.medium),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
