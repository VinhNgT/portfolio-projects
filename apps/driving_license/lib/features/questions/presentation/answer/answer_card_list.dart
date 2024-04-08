import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_card.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_card_list_controller.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_card_list_delegate.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnswerCardList extends HookConsumerWidget {
  final Question question;
  final AnswerCardListDelegate delegate;

  const AnswerCardList._({
    required this.question,
    required this.delegate,
  });

  factory AnswerCardList.practiceMode({required Question question}) {
    return AnswerCardList._(
      question: question,
      delegate: const PracticeModeAnswerCardListDelegate(),
    );
  }

  factory AnswerCardList.examMode({required Question question}) {
    return AnswerCardList._(
      question: question,
      delegate: const ExamModeAnswerCardListDelegate(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerState = ref.watch(answerCardListControllerProvider);

    final selectedAnswerIndex =
        ref.watch(userSelectedAnswerIndexProvider(question));

    return AsyncValueWidget(
      value: selectedAnswerIndex,
      builder: (selectedAnswerIndexValue) => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (_, __) => kGap_12,
        itemCount: question.answers.length,
        itemBuilder: (_, int answerOptionIndex) => AnswerCard(
          answer: question.answers[answerOptionIndex],
          state: delegate.evaluateAnswerCardState(
            answerIndex: answerOptionIndex,
            selectedAnswerIndex: selectedAnswerIndexValue,
            correctAnswerIndex: question.correctAnswerIndex,
          ),
          onTap: controllerState.isLoading
              ? null
              : () => delegate.onAnswerSelected(
                    question: question,
                    oldAnswerIndex: selectedAnswerIndexValue,
                    newAnswerIndex: answerOptionIndex,
                    saveAnswerDbCallback: (question, newAnswerIndex) async {
                      return ref
                          .read(answerCardListControllerProvider.notifier)
                          .selectAnswer(
                            question,
                            newAnswerIndex,
                          );
                    },
                  ),
        ),
      ),
    );
  }
}
