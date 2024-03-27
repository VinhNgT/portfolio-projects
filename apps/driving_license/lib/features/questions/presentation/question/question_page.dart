import 'dart:async';

import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/constants/opacity.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_card_list.dart';
import 'package:driving_license/features/questions/presentation/question/question_notes.dart';
import 'package:driving_license/features/questions/presentation/question/question_page_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionPage extends HookConsumerWidget {
  final int questionPageIndex;

  const QuestionPage({
    super.key,
    required this.questionPageIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final question = ref.watch(questionFutureProvider(questionPageIndex));

    return AsyncValueWidget(
      value: question,
      builder: (questionValue) => Consumer(
        builder: (context, ref, child) {
          updateQuestionPageScrollController(ref, scrollController);

          final selectedAnswerIndex = ref.watch(
            userSelectedAnswerIndexProvider(questionValue),
          );

          final scrollingAnimationPlaying = ref.watch(
            questionPageScrollingAnimationPlayingProvider(questionPageIndex),
          );

          return NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollMetricsNotification) {
                // Content size is changing, notify the listeners about new
                // position
                if (scrollController.hasClients) {
                  scrollController.position.notifyListeners();
                }
              }
              return false;
            },
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: kSize_16,
                  right: kSize_16,
                  bottom: kSize_48,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        questionValue.title,
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    if (questionValue.questionImagePath != null) ...[
                      kGap_12,
                      Image.asset(questionValue.questionImagePath!),
                      kGap_8,
                    ],
                    kGap_16,
                    AnswerCardList(
                      question: questionValue,
                    ),
                    AsyncValueWidget(
                      value: selectedAnswerIndex,
                      builder: (selectedAnswerIndexValue) {
                        final answerSelected = selectedAnswerIndexValue != null;

                        return Visibility(
                          visible:
                              scrollingAnimationPlaying ? true : answerSelected,
                          child: Opacity(
                            opacity:
                                answerSelected ? kOpacityFull : kOpacityZero,
                            child: QuestionNotes(question: questionValue),
                          ),
                        );
                      },
                    ),
                    kGap_48,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

extension QuestionPageX on QuestionPage {
  // Notify AppBar about new scroll controller
  void updateQuestionPageScrollController(
    WidgetRef ref,
    ScrollController scrollController,
  ) {
    Future.microtask(() {
      // The the QuestionPage of which this scroll controller is associated
      // with might be disposed before this microtask is executed. So we need
      // to check if it is still mounted first
      if (ref.context.mounted) {
        ref
            .read(
              questionPageScrollControllerProvider(questionPageIndex).notifier,
            )
            .value = scrollController;
      }
    });
  }
}
