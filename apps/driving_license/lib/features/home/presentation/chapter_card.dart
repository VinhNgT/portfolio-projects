import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          horizontal: kSize_16,
          vertical: kSize_12,
        ),
        child: Row(
          children: [
            SvgPicture(AssetBytesLoader(iconAssetPath)),
            kGap_16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.titleMedium,
                  ),
                  kGap_2,
                  Text(
                    subhead,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            kGap_16,
            Icon(
              Symbols.arrow_forward_ios,
              size: kSize_20,
              color: context.colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
