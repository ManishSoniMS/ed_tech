import 'package:flutter/material.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/constants/constraints/app_constraints.dart';
import '../../../../core/constants/enum/enum.dart';

class KeyDetailsWidget extends StatelessWidget {
  const KeyDetailsWidget({
    super.key,
    required this.type,
    required this.text,
  });

  final KeyDetailType type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading() != null
          ? CircleAvatar(
              radius: AppConstraints.large,
              backgroundColor: const Color(0xFFEBFCFF),
              child: Icon(
                leading(),
                size: AppConstraints.extraLarge,
                color: const Color(0xFF61ABAB),
              ),
            )
          : null,
      title: Text(
        title(),
        style: textTheme.bodyMedium,
      ),
      subtitle: Text(
        text,
        style: textTheme.bodyLarge,
      ),
    );
  }

  IconData? leading() {
    switch (type) {
      case KeyDetailType.duration:
        return Icons.watch_later_outlined;
      case KeyDetailType.type:
        return Icons.tv_rounded;
      case KeyDetailType.language:
        return Icons.language_rounded;
      case KeyDetailType.validity:
        return Icons.verified;
      default:
        return null;
    }
  }

  String title() {
    switch (type) {
      case KeyDetailType.duration:
        return "Duration";
      case KeyDetailType.type:
        return "Type";
      case KeyDetailType.language:
        return "Language";
      case KeyDetailType.validity:
        return "Validity";
      default:
        return "";
    }
  }
}
