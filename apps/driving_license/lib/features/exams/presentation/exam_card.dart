import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/common_widgets/hooks/did_change_metric_rebuild.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/exams/presentation/exam_card_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/ref_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback? onPressed;

  const ExamCard({
    super.key,
    required this.exam,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(exam.name, style: context.textTheme.titleMedium),
            Text(
              'Chưa làm',
              style: context.textTheme.bodySmall!.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
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
    final context = useContext();

    useEffect(
      () {
        final overlaysEntry = OverlayEntry(
          builder: (_) {
            return const Align(
              child: Offstage(
                offstage: true,
                child: PrototypeExamCard(shouldUpdateProvider: true),
              ),
            );
          },
        );

        Future.microtask(() {
          Overlay.of(context).insert(overlaysEntry);
        });

        return overlaysEntry.remove;
      },
      [],
    );
  }
}
