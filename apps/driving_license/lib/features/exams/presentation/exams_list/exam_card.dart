import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/common_widgets/hooks/build_off_stage_overlay.dart';
import 'package:driving_license/common_widgets/hooks/did_change_metric_rebuild.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/exams/presentation/exams_list/exam_card_controller.dart';
import 'package:driving_license/features/exams/presentation/screens/exams_list_screen/exams_list_screen_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/ref_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final ExamsListState state;
  final VoidCallback? onPressed;

  const ExamCard({
    super.key,
    required this.exam,
    this.state = ExamsListState.view,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonCard(
      surfaceColor: context.materialScheme.surfaceContainerHigh,
      onSurfaceColor: context.materialScheme.onSurface,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kSize_16,
          vertical: kSize_12,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ConstrainedBox(
                    // Holy shit this took a while to figure it out
                    constraints:
                        BoxConstraints(minHeight: constraints.minHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          exam.name,
                          style: context.textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            kGap_4,
                            Text(
                              'Bằng ${exam.license.name.toUpperCase()}',
                              style: context.textTheme.bodySmall!.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            kGap_2,
                            Text(
                              'Chưa làm',
                              style: context.textTheme.bodySmall!.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedSwitcher(
                    duration: Durations.short1,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: switch (state) {
                      ExamsListState.view => const SizedBox.shrink(),
                      ExamsListState.edit => const _EditIcon(),
                      ExamsListState.delete => const _DeleteIcon(),
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DeleteIcon extends StatelessWidget {
  const _DeleteIcon();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        kGap_12,
        Icon(
          Symbols.delete,
          color: context.materialScheme.error,
        ),
      ],
    );
  }
}

class _EditIcon extends StatelessWidget {
  const _EditIcon();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        kGap_12,
        Icon(
          Symbols.edit,
          color: context.materialScheme.secondary,
        ),
      ],
    );
  }
}

class PrototypeExamCard extends HookConsumerWidget {
  final bool shouldUpdateProvider;
  const PrototypeExamCard({super.key, this.shouldUpdateProvider = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (shouldUpdateProvider) {
      ref.keepProviderAlive(examCardPrototypeHeightProvider);
      useDidChangeMetricRebuild();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        final widgetHeight = context.size?.height ?? 0;
        ref.read(examCardPrototypeHeightProvider.notifier).value = widgetHeight;
      });
    }

    return ExamCard(exam: Exam.prototype());
  }

  /// Builds an invisible PrototypeExamCard to calculate the height of
  /// ExamCard for ExamCardPrototypeHeightProvider.
  static void buildOffstageOverlay() {
    useBuildOffstageOverlay(
      const PrototypeExamCard(shouldUpdateProvider: true),
    );
  }
}
