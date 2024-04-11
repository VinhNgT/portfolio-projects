import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/common_bottom_sheet.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/application/question/questions_service_mode.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_list.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionListBottomSheet extends CommonBottomSheet {
  final int questionCount;
  final int initialCurrentPageIndex;

  final void Function(int index)? onQuestionCardPressed;

  QuestionListBottomSheet({
    super.key,
    required this.questionCount,
    required this.initialCurrentPageIndex,
    this.onQuestionCardPressed,
  }) : super(
          title: _Title(questionCount: questionCount),
          child: LayoutBuilder(
            builder: (context, constraints) => QuestionList(
              questionCount: questionCount,
              initialCurrentPageIndex: initialCurrentPageIndex,
              viewPortHeight: constraints.maxHeight,
              onQuestionCardPressed: onQuestionCardPressed,
            ),
          ),
        );
}

class _Title extends HookConsumerWidget {
  final int questionCount;
  const _Title({required this.questionCount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionsServiceMode = ref.watch(questionsServiceModeProvider);

    return AsyncValueWidget(
      value: questionsServiceMode,
      builder: (questionsServiceModeValue) => RichText(
        textScaler: context.textScaler,
        text: TextSpan(
          style: context.defaultTextStyle,
          children: [
            TextSpan(
              text: _getServiceModeName(questionsServiceModeValue),
              style: context.textTheme.titleMedium,
            ),
            const WidgetSpan(
              child: SizedBox(width: kSize_8),
            ),
            TextSpan(
              text: questionCount.toString(),
              style: context.textTheme.bodyLarge!.copyWith(
                color: context.materialScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getServiceModeName(QuestionsServiceMode mode) {
    return switch (mode) {
      ChapterOperatingMode(chapter: final chapter) => chapter.chapterName,
      DangerOperatingMode() => 'Các câu điểm liệt',
      DifficultOperatingMode() => 'Các câu khó',
      WrongAnswersOperatingMode() => 'Các câu đã làm sai',
      BookmarkOperatingMode() => 'Các câu đã lưu',
      FullOperatingMode() || _ => 'Tất cả câu hỏi',
    };
  }
}
