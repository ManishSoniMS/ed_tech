import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/constants/constraints/app_constraints.dart';

class ClassRoomTile extends StatelessWidget {
  const ClassRoomTile({
    super.key,
    required this.onTap,
    required this.title,
    this.videos = 0,
    this.notes = 0,
  });

  final VoidCallback onTap;
  final String title;
  final int videos;
  final int notes;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: textTheme.titleSmall,
        ),
        subtitle: Row(
          children: [
            const Icon(
              Icons.play_circle_outline_outlined,
              size: AppConstraints.extraLarge,
              color: Colors.grey,
            ),
            const Gap(AppConstraints.small),
            Text(
              "$videos videos",
              style: textTheme.bodyMedium,
            ),
            const Gap(AppConstraints.extraLarge),
            const Icon(
              Icons.file_copy_outlined,
              size: AppConstraints.extraLarge,
              color: Colors.grey,
            ),
            const Gap(AppConstraints.small),
            Text(
              "$notes Notes",
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
