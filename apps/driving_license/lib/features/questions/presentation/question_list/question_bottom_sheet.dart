import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/widget_deadzone.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/application/question/questions_service_mode.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_list.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class QuestionBottomSheet extends HookConsumerWidget {
  final int questionCount;
  final void Function(int index)? onQuestionCardPressed;

  const QuestionBottomSheet({
    super.key,
    required this.questionCount,
    this.onQuestionCardPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _TitleBar(questionCount: questionCount),
        Expanded(
          child: WidgetDeadzone(
            deadzone: EdgeInsets.only(
              bottom: context.systemGestureInsets.bottom,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => QuestionList(
                questionCount: questionCount,
                initialCurrentPageIndex: ref.read(currentPageIndexProvider),
                viewPortHeight: constraints.maxHeight,
                onQuestionCardPressed: onQuestionCardPressed,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TitleBar extends HookConsumerWidget {
  final int questionCount;
  const _TitleBar({required this.questionCount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionsServiceMode = ref.watch(questionsServiceModeProvider);

    return Stack(
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: kSize_8),
              child: _Handle(),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kSize_12,
                  horizontal: kSize_16,
                ),
                child: AsyncValueWidget(
                  value: questionsServiceMode,
                  builder: (questionsServiceModeValue) => _Title(
                    titleText: _getServiceModeName(questionsServiceModeValue),
                    questionCount: questionCount,
                  ),
                ),
              ),
            ),
            const Divider(),
          ],
        ),
        const Positioned(
          top: 12,
          right: 4,
          child: _CloseButton(),
        ),
      ],
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

class _Handle extends StatelessWidget {
  const _Handle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 4,
      decoration: BoxDecoration(
        color: context.materialScheme.outline,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String titleText;
  final int questionCount;

  const _Title({
    required this.titleText,
    required this.questionCount,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaler: context.textScaler,
      text: TextSpan(
        style: context.defaultTextStyle,
        children: [
          TextSpan(
            text: titleText,
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
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Symbols.close,
        color: context.materialScheme.onSurfaceVariant,
      ),
      onPressed: () async => context.maybePop(),
    );
  }
}
