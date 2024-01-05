import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/constants/constraints/app_constraints.dart';
import '../../../../core/constants/constraints/placeholder_images.dart';
import '../../../../core/widgets/custom_image.dart';

class EducatorBasicDetailsTile extends StatelessWidget {
  const EducatorBasicDetailsTile({
    super.key,
    this.index,
    this.length,
  });

  final int? index;
  final int? length;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.0,
              width: 90.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CustomImage(path: PlaceHolderImg.instructor),
              ),
            ),
            Text(
              "Khan Sir",
              style: textTheme.bodyLarge,
            ),
            Text(
              "GK/GS",
              style: textTheme.bodySmall,
            ),
          ],
        ),
        if (index != null && length != null)
          if (index != (length! - 1)) const Gap(AppConstraints.medium),
      ],
    );
  }
}
