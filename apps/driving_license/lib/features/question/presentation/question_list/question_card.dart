import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/question/domain/question.dart';
import 'package:driving_license/features/question/presentation/answer/answer_card_list.dart';
import 'package:driving_license/features/question/presentation/answer/answer_state_checkbox.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final int questionPageIndex;
  final bool isSelected;
  final VoidCallback? onPressed;

  const QuestionCard({
    super.key,
    required this.question,
    required this.questionPageIndex,
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
                  cacheWidth: (66 * context.devicePixelRatio).floor(),
                  height: 66,
                  width: 66,
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
        ref.watch(selectedAnswerIndexProvider(questionPageIndex));

    final state = evaluateAnswerState(question, selectedAnswerIndex);

    return state != AnswerState.unchecked
        ? AnswerStateCheckbox(state: state, iconSize: 20)
        : const SizedBox();
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
