import 'dart:async';

import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/application/user_answer/user_answers_service.dart';
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
  final AnswerState answerState;
  final bool isSelected;
  final VoidCallback? onPressed;

  const QuestionCard({
    super.key,
    required this.questionPageIndex,
    required this.question,
    required this.answerState,
    required this.isSelected,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final questionImage = question.questionImagePath != null
        ? _buildQuestionImage(context)
        : null;

    // Force the image to load when the question card is built.
    // This is a workaround for the issue where the image is not loaded when
    // user scrolls the QuestionList too fast. Causing the image loading process
    // to be cancelled.
    if (questionImage != null) {
      unawaited(precacheImage(questionImage.image, context));
    }

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
                      _QCAnswerStateCheckbox(answerState: answerState),
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
            if (questionImage != null) ...[
              kGap_12,
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: questionImage,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Image _buildQuestionImage(BuildContext context) {
    return Image.asset(
      question.questionImagePath!,
      cacheHeight: (_kQuestionCardImageSize * context.devicePixelRatio).floor(),
      height: _kQuestionCardImageSize,
      width: _kQuestionCardImageSize,
      fit: BoxFit.fitHeight,
    );
  }
}

// QC stands for QuestionCard
class _QCAnswerStateCheckbox extends StatelessWidget {
  final AnswerState answerState;

  const _QCAnswerStateCheckbox({
    required this.answerState,
  });

  @override
  Widget build(BuildContext context) {
    return answerState != AnswerState.unchecked
        ? AnswerStateCheckbox(state: answerState, iconSize: 20)
        : const SizedBox();
  }
}

class AsyncValueQuestionCard extends HookConsumerWidget {
  final int questionPageIndex;
  final bool isSelected;
  final VoidCallback? onPressed;

  const AsyncValueQuestionCard({
    super.key,
    required this.questionPageIndex,
    required this.isSelected,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final question =
        ref.watch(questionPreloadPagesFutureProvider(questionPageIndex));

    return AsyncValueWidget(
      value: question,
      builder: (questionValue) => Consumer(
        builder: (context, ref, child) {
          final selectedAnswerIndex =
              ref.watch(userSelectedAnswerIndexProvider(questionValue)).value;

          final answerState =
              evaluateAnswerState(questionValue, selectedAnswerIndex);

          return QuestionCard(
            questionPageIndex: questionPageIndex,
            question: questionValue,
            answerState: answerState,
            isSelected: isSelected,
            onPressed: onPressed,
          );
        },
      ),
    );
  }
}

extension _AsyncValueQuestionCardX on AsyncValueQuestionCard {
  AnswerState evaluateAnswerState(Question question, int? selectedAnswerIndex) {
    final bool noAnswerSelected = (selectedAnswerIndex == null);
    final bool isCorrect = (selectedAnswerIndex == question.correctAnswerIndex);

    if (noAnswerSelected) {
      return AnswerState.unchecked;
    }

    return isCorrect ? AnswerState.correct : AnswerState.incorrect;
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
        questionDbIndex: -1,
        chapterDbIndex: -1,
        title: 'Prototype\nPrototype',
        isDanger: false,
        correctAnswerIndex: 0,
        answers: ['0'],
      ),
      answerState: AnswerState.checked,
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
