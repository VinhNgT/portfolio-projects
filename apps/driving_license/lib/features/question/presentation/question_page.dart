import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/question/data/question_repository.dart';
import 'package:driving_license/features/question/presentation/answer/answer_card_list.dart';
import 'package:driving_license/features/question/presentation/answer/explanation_card.dart';
import 'package:driving_license/features/question/presentation/answer/remember_tip_card.dart';
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
    final question =
        ref.watch(questionRepositoryProvider).getQuestion(questionIndex);
    final scrollController = useScrollController();
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
            kGap_16,
            AnswerCardList(questionIndex: questionIndex),
            QuestionNotes(questionIndex: questionIndex),
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
      ref
          .read(questionPageScrollControllerProvider(questionIndex).notifier)
          .value = scrollController;
    });
  }
}

class QuestionNotes extends HookConsumerWidget {
  final int questionIndex;
  const QuestionNotes({super.key, required this.questionIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final question =
        ref.watch(questionRepositoryProvider).getQuestion(questionIndex);

    final content = [
      if (question.explanation != null)
        ExplanationCard(content: question.explanation!),
      if (question.rememberTip != null)
        RememberTipCard(content: question.rememberTip!),
    ];

    return Column(
      children: [
        if (content.isNotEmpty) kGap_24,
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => kGap_16,
          itemCount: content.length,
          itemBuilder: (BuildContext _, int index) => content[index],
        ),
      ],
    );
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
