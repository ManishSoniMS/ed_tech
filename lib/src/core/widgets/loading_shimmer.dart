import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../config/app_config.dart';
import '../constants/constraints/app_constraints.dart';


/// {@template loading_shimmer}
/// A shimmering widget that displays a loading indicator.
/// {@endtemplate}
class LoadingShimmer extends StatelessWidget {
  /// {@macro loading_shimmer}
  const LoadingShimmer({
    Key? key,
    this.hasRoundedCorners = false,
  }) : super(key: key);

  /// if this is true, the shimmering widget will have a
  /// rounded corners.
  final bool hasRoundedCorners;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.primary,
      highlightColor: theme.colorScheme.primary.withOpacity(0.7),
      period: const Duration(milliseconds: 1500),
      child: !hasRoundedCorners
          ? const Material()
          : const Material(
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstraints.medium),
        ),
      ),
    );
  }
}
