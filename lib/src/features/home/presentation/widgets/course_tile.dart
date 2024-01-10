import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/constants/constraints/app_constraints.dart';
import '../../../../core/widgets/custom_image.dart';

class CourseTileWidget extends StatelessWidget {
  const CourseTileWidget({
    super.key,
    required this.img,
    required this.title,
    this.onTap,
  });

  final String img;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(AppConstraints.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 19 / 9,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: CustomImage(path: img),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppConstraints.large),
              child: Text(
                title,
                style: textTheme.titleLarge,
              ),
            ),
            const Gap(AppConstraints.medium),
          ],
        ),
      ),
    );
  }
}
