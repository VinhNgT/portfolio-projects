import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/question/data/question_repository.dart';
import 'package:driving_license/features/question/presentation/answer/answer_card.dart';
import 'package:driving_license/features/question/presentation/answer/answer_state_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'answer_card_list.g.dart';

class AnswerCardList extends HookConsumerWidget {
  const AnswerCardList({
    super.key,
    required this.questionIndex,
  });

  final int questionIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final question =
        ref.watch(questionRepositoryProvider).getQuestion(questionIndex);
    final selectedAnswerIndex =
        ref.watch(selectedAnswerIndexProvider(questionIndex));

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (_, __) => kGap_12,
      itemCount: question.answers.length,
      itemBuilder: (_, int answerOptionIndex) => AnswerCard(
        answer: question.answers[answerOptionIndex],
        state: evaluateAnswerCardState(
          answerOptionIndex,
          selectedAnswerIndex,
          question.correctAnswerIndex,
        ),
        onTap: () => selectAnswer(ref, questionIndex, answerOptionIndex),
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

  void selectAnswer(WidgetRef ref, int questionIndex, int selectedAnswerIndex) {
    final answerSelected =
        ref.read(selectedAnswerIndexProvider(questionIndex)) != null;

    // Only allow selecting an answer if no answer has been selected
    if (!answerSelected) {
      ref.read(selectedAnswerIndexProvider(questionIndex).notifier).value =
          selectedAnswerIndex;
    }
  }
}

@riverpod
class SelectedAnswerIndex extends _$SelectedAnswerIndex {
  @override
  int? build(int questionIndex) {
    return null;
  }

  set value(int? newValue) {
    state = newValue;
  }
}
