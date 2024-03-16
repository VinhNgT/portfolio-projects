import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_card.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_card_list_controller.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_state_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnswerCardList extends HookConsumerWidget {
  final Question question;

  const AnswerCardList({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAnswerIndex =
        ref.watch(userSelectedAnswerIndexProvider(question));
    final controllerState = ref.watch(answerCardListControllerProvider);

    return AsyncValueWidget(
      value: selectedAnswerIndex,
      builder: (selectedAnswerIndexValue) => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (_, __) => kGap_12,
        itemCount: question.answers.length,
        itemBuilder: (_, int answerOptionIndex) => AnswerCard(
          answer: question.answers[answerOptionIndex],
          state: evaluateAnswerCardState(
            answerOptionIndex,
            selectedAnswerIndexValue,
            question.correctAnswerIndex,
          ),
          onTap: controllerState.isLoading
              ? null
              : () => selectAnswer(ref, question, answerOptionIndex),
        ),
      ),
    );
  }
}

extension AnswerCardListX on AnswerCardList {
  AnswerState evaluateAnswerCardState(
    int answerIndex,
    int? selectedAnswerIndex,
    int correctAnswerIndex,
  ) {
    final bool noAnswerSelected = (selectedAnswerIndex == null);
    final bool isSelected = (answerIndex == selectedAnswerIndex);
    final bool isCorrect = (answerIndex == correctAnswerIndex);

    if (noAnswerSelected) {
      return AnswerState.unchecked;
    }

    if (isSelected) {
      return isCorrect ? AnswerState.correct : AnswerState.incorrect;
    }

    return isCorrect ? AnswerState.correct : AnswerState.unchecked;
  }

  void selectAnswer(
    WidgetRef ref,
    Question question,
    int selectedAnswerIndex,
  ) async {
    final answerSelected = await ref.read(
          userSelectedAnswerIndexProvider(question).future,
        ) !=
        null;

    // Only allow selecting an answer if no answer has been selected
    if (!answerSelected) {
      await ref.read(answerCardListControllerProvider.notifier).selectAnswer(
            question,
            selectedAnswerIndex,
          );
    }
  }
}
