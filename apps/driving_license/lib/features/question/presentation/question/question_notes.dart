import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/question/data/question_repository.dart';
import 'package:driving_license/features/question/presentation/question/explanation_card.dart';
import 'package:driving_license/features/question/presentation/question/remember_tip_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
