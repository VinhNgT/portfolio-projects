import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/chapters/application/providers/chapters_info_providers.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/result/domain/test_result.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vector_graphics/vector_graphics.dart';

class ChapterCard extends HookConsumerWidget {
  final Chapter chapter;
  final void Function(Chapter chapter)? onTap;

  const ChapterCard({
    super.key,
    required this.chapter,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapterCompletionStatus =
        ref.watch(chapterCompletionStatusProvider(chapter));

    return AsyncValueWidget(
      value: chapterCompletionStatus,
      builder: (chapterCompletionStatusValue) => Visibility(
        visible: chapterCompletionStatusValue.totalQuestions > 0,
        child: ButtonCard(
          surfaceColor: context.materialScheme.surfaceContainerHigh,
          onSurfaceColor: context.materialScheme.onSurface,
          onPressed: onTap != null ? () => onTap!(chapter) : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kSize_16,
              vertical: kSize_12,
            ),
            child: Row(
              children: [
                SvgPicture(AssetBytesLoader(chapter.iconAssetPath)),
                kGap_16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chapter.chapterName,
                        style: context.textTheme.titleMedium,
                      ),
                      kGap_2,
                      Text(
                        _buildCompletionStatusText(
                          chapterCompletionStatusValue,
                        ),
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
        ),
      ),
    );
  }

  String _buildCompletionStatusText(TestResult status) {
    final StringBuffer buffer = StringBuffer(
      'Đã hoàn thành ${status.answeredQuestions} / ${status.totalQuestions}',
    );

    if (status.wrongAnswers > 0) {
      buffer.write(' - Sai ${status.wrongAnswers} câu');
    }

    return buffer.toString();
  }
}
