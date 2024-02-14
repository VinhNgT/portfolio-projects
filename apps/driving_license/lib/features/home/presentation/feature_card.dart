import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String subhead;

  const FeatureCard({
    super.key,
    required this.title,
    required this.subhead,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonCard(
      surfaceColor: context.materialScheme.surfaceContainerHigh,
      onSurfaceColor: context.materialScheme.onSurface,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SizeConstant.p16,
          vertical: SizeConstant.p12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.titleMedium,
            ),
            const Gap(SizeConstant.p2),
            Text(
              subhead,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
