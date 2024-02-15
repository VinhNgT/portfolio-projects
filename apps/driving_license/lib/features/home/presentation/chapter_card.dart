import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vector_graphics/vector_graphics.dart';

class ChapterCard extends StatelessWidget {
  final String iconAssetPath;
  final String title;
  final String subhead;
  final VoidCallback? onTap;

  const ChapterCard({
    super.key,
    required this.iconAssetPath,
    required this.title,
    required this.subhead,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonCard(
      surfaceColor: context.materialScheme.surfaceContainerHigh,
      onSurfaceColor: context.materialScheme.onSurface,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SizeConstant.p16,
          vertical: SizeConstant.p12,
        ),
        child: Row(
          children: [
            SvgPicture(AssetBytesLoader(iconAssetPath)),
            const Gap(SizeConstant.p16),
            Expanded(
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
            const Gap(SizeConstant.p16),
            Icon(
              Symbols.arrow_forward_ios,
              size: SizeConstant.p20,
              color: context.colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
