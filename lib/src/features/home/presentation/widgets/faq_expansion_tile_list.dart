import 'package:flutter/material.dart';

import '../../../../core/constants/constraints/app_constraints.dart';

class FAQExpansionTileList extends StatelessWidget {
  const FAQExpansionTileList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstraints.large),
      child: Column(
        children: List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: AppConstraints.medium),
            child: ExpansionTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              backgroundColor: Colors.grey.shade200,
              collapsedBackgroundColor: Colors.grey.shade200,
              title: const Text('Lorem ipsum dolor sit amet'),
            ),
          ),
        ),
      ),
    );
  }
}
