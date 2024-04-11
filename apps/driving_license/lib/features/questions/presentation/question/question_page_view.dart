import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/misc/fast_scroll_physics.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/application/question/questions_service_mode.dart';
import 'package:driving_license/features/questions/presentation/question/question_page.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:driving_license/utils/ref_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionPageView extends HookConsumerWidget {
  final int questionCount;
  final PageController pageController;

  const QuestionPageView({
    super.key,
    required this.questionCount,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExamMode = ref.watchConvertAsyncValue(
      questionsServiceModeProvider,
      (valueData) => valueData is ExamOperatingMode,
    );

    return AsyncValueWidget(
      value: isExamMode,
      builder: (isExamModeValue) => PageView.builder(
        controller: pageController,
        itemCount: questionCount,
        onPageChanged: (nextPageIndex) {
          setNewCurrentPageIndex(ref, nextPageIndex);
        },
        physics: const FastPageViewScrollPhysics(),
        itemBuilder: (context, index) {
          return QuestionPage(
            questionPageIndex: index,
            showRightWrong: !isExamModeValue,
            showNotes: !isExamModeValue,
            padding: const EdgeInsets.only(
              left: kSize_16,
              right: kSize_16,
              bottom: kSize_48,
            ),
          );
        },
      ),
    );
  }

  void setNewCurrentPageIndex(WidgetRef ref, int newPageIndex) {
    ref.read(currentPageIndexProvider.notifier).value = newPageIndex;
  }
}
