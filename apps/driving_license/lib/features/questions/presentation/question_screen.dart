import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/async_value/async_value_scaffold.dart';
import 'package:driving_license/features/questions/data/question_repository.dart';
import 'package:driving_license/features/questions/presentation/appbar_navbar/question_app_bar.dart';
import 'package:driving_license/features/questions/presentation/appbar_navbar/question_bottom_navigation_bar.dart';
import 'package:driving_license/features/questions/presentation/question/question_page.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_bottom_sheet.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class QuestionScreen extends HookConsumerWidget {
  final int chapterDatabaseKey;
  const QuestionScreen({super.key, required this.chapterDatabaseKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final questionCount = ref.watch(questionCountFutureProvider);

    // Register QuestionScreen as the one keeping all of the
    // QuestionPageScrollControllerProviders alive
    ref.watch(keepQuestionPageScrollControllerAliveProvider);

    return AsyncValueScaffold(
      value: questionCount,
      builder: (questionCountValue) => Scaffold(
        appBar: const QuestionAppBar(),
        body: PageView.builder(
          controller: pageController,
          itemCount: questionCountValue,
          onPageChanged: (nextPageIndex) {
            setNewCurrentPageIndex(ref, nextPageIndex);
          },
          physics: const FastPageViewScrollPhysics(),
          itemBuilder: (context, index) {
            return QuestionPage(questionPageIndex: index);
          },
        ),
        bottomNavigationBar: QuestionBottomNavigationBar(
          questionCount: questionCountValue,
          onNextPressed: () => unawaited(
            pageController.nextPage(
              duration: Durations.short4,
              curve: Curves.easeOut,
            ),
          ),
          onPreviousPressed: () => unawaited(
            pageController.previousPage(
              duration: Durations.short4,
              curve: Curves.easeOut,
            ),
          ),
          onShowAllPressed: () => unawaited(
            showModalBottomSheet(
              context: context,
              elevation: 0,
              constraints: BoxConstraints.tightFor(
                // BottomSheet will be 60% of the screen height
                height: context.height * 0.6,
              ),
              builder: (_) => QuestionBottomSheet(
                questionCount: questionCountValue,
                onQuestionCardPressed: (questionPageIndex) {
                  pageController.animateToPage(
                    questionPageIndex,
                    duration: Durations.short4,
                    curve: Curves.easeOut,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension QuestionScreenX on QuestionScreen {
  void setNewCurrentPageIndex(WidgetRef ref, int newPageIndex) {
    ref.read(currentPageIndexProvider.notifier).value = newPageIndex;
  }
}

class FastPageViewScrollPhysics extends ScrollPhysics {
  const FastPageViewScrollPhysics({super.parent});

  @override
  FastPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return FastPageViewScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 80,
        stiffness: 100,
        damping: 1,
      );
}
