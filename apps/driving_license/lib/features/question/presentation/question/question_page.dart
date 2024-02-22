import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/question/data/question_repository.dart';
import 'package:driving_license/features/question/presentation/answer/answer_card_list.dart';
import 'package:driving_license/features/question/presentation/question/question_image.dart';
import 'package:driving_license/features/question/presentation/question/question_notes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_page.g.dart';

class QuestionPage extends HookConsumerWidget {
  final int questionIndex;

  const QuestionPage({
    super.key,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    final question =
        ref.watch(questionRepositoryProvider).getQuestion(questionIndex);
    final answerSelected =
        ref.watch(selectedAnswerIndexProvider(questionIndex)) != null;

    updateQuestionPageScrollController(ref, scrollController);

    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.only(
          left: kSize_16,
          right: kSize_16,
          bottom: kSize_48,
        ),
        child: Column(
          children: [
            Text(
              question.title,
              style: context.textTheme.titleMedium,
            ),
            if (question.questionImagePath != null)
              QuestionImage(path: question.questionImagePath!),
            kGap_16,
            AnswerCardList(questionIndex: questionIndex),
            if (answerSelected) QuestionNotes(questionIndex: questionIndex),
            kGap_48,
          ],
        ),
      ),
    );
  }
}

extension QuestionPageX on QuestionPage {
  // Notify QuestionScreen about new scroll controller
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
            .read(questionPageScrollControllerProvider(questionIndex).notifier)
            .value = scrollController;
      }
    });
  }
}

@riverpod
class QuestionPageScrollController extends _$QuestionPageScrollController {
  @override
  Raw<ScrollController?> build(int pageIndex) {
    return null;
  }

  set value(ScrollController newScrollController) {
    state = newScrollController;
  }
}
