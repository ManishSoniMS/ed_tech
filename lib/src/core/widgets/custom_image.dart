import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading_shimmer.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
      fit: BoxFit.cover,
      errorWidget: (_, __, ___) => const Icon(Icons.error),
      placeholder: (_, __) => const LoadingShimmer(),
    );
  }
}
