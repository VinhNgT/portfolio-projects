import 'dart:async';

import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/bookmark/data/providers/bookmark_providers.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_state_checkbox.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_card_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vector_graphics/vector_graphics.dart';

const double _kQuestionCardImageSize = 66.0;

class QuestionCard extends HookConsumerWidget {
  final int questionPageIndex;
  final Question question;
  final bool isSelected;
  final VoidCallback? onPressed;

  final bool loadAnswerState;
  final bool loadIsBookmarked;

  const QuestionCard({
    super.key,
    required this.questionPageIndex,
    required this.question,
    required this.isSelected,
    this.onPressed,
    this.loadAnswerState = true,
    this.loadIsBookmarked = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        child: IntrinsicHeight(
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
                        if (question.isDanger) ...[
                          const SvgPicture(
                            AssetBytesLoader(
                              'assets/icons/home_screen/compiled/danger_fire.svg.vec',
                            ),
                            height: kSize_16,
                            width: kSize_16,
                          ),
                          kGap_4,
                        ],
                        Text(
                          'Câu ${questionPageIndex + 1}',
                          style: context.textTheme.titleMedium,
                        ),
                        if (loadAnswerState) ...[
                          kGap_4,
                          _QCAnswerStateCheckbox(question: question),
                        ],
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
              if (loadIsBookmarked) ...[
                kGap_12,
                Align(
                  alignment: Alignment.topCenter,
                  child: _QCIsBookmarkedIcon(question: question),
                ),
              ],
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
class _QCAnswerStateCheckbox extends HookConsumerWidget {
  final Question question;
  const _QCAnswerStateCheckbox({
    required this.question,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAnswerIndex =
        ref.watch(userSelectedAnswerIndexProvider(question)).value;
    final answerState = evaluateAnswerState(question, selectedAnswerIndex);

    return answerState != AnswerState.unchecked
        ? AnswerStateCheckbox(state: answerState, iconSize: 20)
        : const SizedBox.shrink();
  }

  AnswerState evaluateAnswerState(Question question, int? selectedAnswerIndex) {
    final bool noAnswerSelected = (selectedAnswerIndex == null);
    final bool isCorrect = (selectedAnswerIndex == question.correctAnswerIndex);

    if (noAnswerSelected) {
      return AnswerState.unchecked;
    }

    return isCorrect ? AnswerState.correct : AnswerState.incorrect;
  }
}

class _QCIsBookmarkedIcon extends HookConsumerWidget {
  final Question question;
  const _QCIsBookmarkedIcon({required this.question});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBookmarked = ref.watch(isBookmarkedStreamProvider(question));

    return AsyncValueWidget(
      value: isBookmarked,
      builder: (isBookmarkedValue) {
        return isBookmarkedValue
            ? Icon(
                Symbols.bookmark,
                fill: 1,
                size: kSize_20,
                color: context.materialScheme.onSurfaceVariant,
              )
            : const SizedBox.shrink();
      },
    );
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
          return QuestionCard(
            questionPageIndex: questionPageIndex,
            question: questionValue,
            isSelected: isSelected,
            onPressed: onPressed,
          );
        },
      ),
    );
  }
}

/// PrototypeQuestionCard serves no other purpose than to calculate the height
/// of QuestionCard for QuestionCardPrototypeHeightProvider. You should not use
/// it unless you know what you are doing.
class PrototypeQuestionCard extends HookConsumerWidget {
  final bool shouldUpdateProvider;
  const PrototypeQuestionCard({super.key, this.shouldUpdateProvider = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(questionCardPrototypeHeightProvider, (_, __) {});

    if (shouldUpdateProvider) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final widgetHeight = context.size?.height ?? 0;
        ref.read(questionCardPrototypeHeightProvider.notifier).value =
            widgetHeight;
      });
    }

    return QuestionCard(
      questionPageIndex: -1,
      question: Question.prototype(),
      isSelected: false,
      onPressed: null,
      loadAnswerState: false,
      loadIsBookmarked: false,
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
              child: Offstage(
                child: PrototypeQuestionCard(shouldUpdateProvider: true),
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
