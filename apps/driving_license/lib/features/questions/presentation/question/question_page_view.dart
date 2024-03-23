import 'package:driving_license/common_widgets/misc/fast_scroll_physics.dart';
import 'package:driving_license/features/questions/presentation/question/question_page.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
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
    return PageView.builder(
      controller: pageController,
      itemCount: questionCount,
      onPageChanged: (nextPageIndex) {
        setNewCurrentPageIndex(ref, nextPageIndex);
      },
      physics: const FastPageViewScrollPhysics(),
      itemBuilder: (context, index) {
        return QuestionPage(questionPageIndex: index);
      },
    );
  }

  void setNewCurrentPageIndex(WidgetRef ref, int newPageIndex) {
    ref.read(currentPageIndexProvider.notifier).value = newPageIndex;
  }
}
