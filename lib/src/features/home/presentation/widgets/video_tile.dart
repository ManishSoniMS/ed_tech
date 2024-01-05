import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/constants/constraints/app_constraints.dart';
import '../../../../core/constants/constraints/placeholder_images.dart';
import '../../../../core/widgets/custom_image.dart';

class VideoTile extends StatelessWidget {
  const VideoTile({
    super.key,
    required this.onTap,
    this.thumbnail,
    required this.title,
    this.date,
    this.duration = 0,
  });

  final VoidCallback onTap;
  final String? thumbnail;
  final String title;
  final DateTime? date;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppConstraints.medium, vertical: 0.0),
        leading: Stack(children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CustomImage(path: PlaceHolderImg.video),
            ),
          ),
          Positioned.fill(
            child: IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.play_circle,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
        ]),
        title: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodyLarge,
        ),
        subtitle: Row(
          children: [
            if (date != null)
              Text(
                DateFormat("dd MMMM yyyy").format(date!),
                style: textTheme.bodySmall,
              ),
            if (date != null) const Gap(AppConstraints.medium),
            if (date != null)
              const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: AppConstraints.small / 2),
            if (date != null) const Gap(AppConstraints.medium),
            Text(
              timeText(),
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  String timeText() {
    if (duration > 60) {
      final min = (duration % 60).toInt();
      final hr = (duration - min) ~/ 60;

      return "$hr hr $min min";
    }
    return "$duration min";
  }
}
