import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/questions/application/question_service.dart';
import 'package:driving_license/features/questions/data/user_answer_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_state_checkbox.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_card_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const double _kQuestionCardImageSize = 66.0;

class QuestionCard extends StatelessWidget {
  final int questionPageIndex;
  final Question question;
  final bool isSelected;
  final VoidCallback? onPressed;

  const QuestionCard({
    super.key,
    required this.questionPageIndex,
    required this.question,
    required this.isSelected,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonCard(
      surfaceColor: isSelected
          ? context.materialScheme.surfaceVariant
          : Colors.transparent,
      onSurfaceColor: isSelected
          ? context.materialScheme.onSurfaceVariant
          : context.materialScheme.onSurface,
      borderRadius: 0,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kSize_16,
          vertical: kSize_12,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'Câu ${questionPageIndex + 1}',
                        style: context.textTheme.titleMedium,
                      ),
                      kGap_4,
                      _QCAnswerStateCheckbox(
                        question: question,
                        questionPageIndex: questionPageIndex,
                      ),
                    ],
                  ),
                  kGap_2,
                  Text(
                    question.title,
                    style: context.textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (question.questionImagePath != null) ...[
              kGap_12,
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  question.questionImagePath!,
                  cacheHeight:
                      (_kQuestionCardImageSize * context.devicePixelRatio)
                          .floor(),
                  height: _kQuestionCardImageSize,
                  width: _kQuestionCardImageSize,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// QC stands for QuestionCard
class _QCAnswerStateCheckbox extends HookConsumerWidget {
  final Question question;
  final int questionPageIndex;

  const _QCAnswerStateCheckbox({
    required this.question,
    required this.questionPageIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAnswerIndex =
        ref.watch(userSelectedAnswerIndexProvider(question.questionIndex));

    return AsyncValueWidget(
      value: selectedAnswerIndex,
      builder: (selectedAnswerIndexValue) {
        final state = evaluateAnswerState(question, selectedAnswerIndexValue);

        return state != AnswerState.unchecked
            ? AnswerStateCheckbox(state: state, iconSize: 20)
            : const SizedBox();
      },
    );
  }
}

extension _QCAnswerStateCheckboxX on _QCAnswerStateCheckbox {
  AnswerState evaluateAnswerState(Question question, int? selectedAnswerIndex) {
    final bool noAnswerSelected = (selectedAnswerIndex == null);
    final bool isCorrect = (selectedAnswerIndex == question.correctAnswerIndex);

    if (noAnswerSelected) {
      return AnswerState.unchecked;
    }

    return isCorrect ? AnswerState.correct : AnswerState.incorrect;
  }
}

class AsyncValueQuestionCard extends HookConsumerWidget {
  final int questionPageIndex;
  final bool isSelected;
  final VoidCallback? onPressed;
  final bool isPrototype;

  const AsyncValueQuestionCard({
    super.key,
    required this.questionPageIndex,
    required this.isSelected,
    this.onPressed,
    this.isPrototype = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final question =
        ref.watch(questionPreloadPagesFutureProvider(questionPageIndex));

    return AsyncValueWidget(
      value: question,
      builder: (questionValue) => QuestionCard(
        questionPageIndex: questionPageIndex,
        question: questionValue,
        isSelected: isSelected,
        onPressed: onPressed,
      ),
    );
  }
}

/// PrototypeQuestionCard serves no other purpose than to calculate the height
/// of QuestionCard for QuestionCardPrototypeHeightProvider. You should not use
/// it unless you know what you are doing.
class PrototypeQuestionCard extends HookConsumerWidget {
  const PrototypeQuestionCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(questionCardPrototypeHeightProvider, (_, __) {});

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final widgetHeight = context.size?.height ?? 0;
      ref.read(questionCardPrototypeHeightProvider.notifier).value =
          widgetHeight;
    });

    return const QuestionCard(
      questionPageIndex: -1,
      question: Question(
        questionIndex: -1,
        chapterIndex: -1,
        title: 'Prototype\nPrototype',
        isDanger: false,
        correctAnswerIndex: 0,
        answers: ['0'],
      ),
      isSelected: false,
      onPressed: null,
    );
  }

  /// Builds an invisible PrototypeQuestionCard to calculate the height of
  /// QuestionCard for QuestionCardPrototypeHeightProvider.
  static void buildOffstageOverlay() {
    final context = useContext();

    useEffect(
      () {
        final overlaysEntry = OverlayEntry(
          builder: (_) {
            return const Align(
              child: Offstage(child: PrototypeQuestionCard()),
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
