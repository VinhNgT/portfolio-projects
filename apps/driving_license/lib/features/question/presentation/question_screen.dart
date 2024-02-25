import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:driving_license/features/question/data/question_repository.dart';
import 'package:driving_license/features/question/presentation/appbar_navbar/question_app_bar.dart';
import 'package:driving_license/features/question/presentation/appbar_navbar/question_bottom_navigation_bar.dart';
import 'package:driving_license/features/question/presentation/question/question_page.dart';
import 'package:driving_license/features/question/presentation/question_list/question_list.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_screen.g.dart';

@RoutePage()
class QuestionScreen extends HookConsumerWidget {
  final int chapterDatabaseKey;
  const QuestionScreen({super.key, required this.chapterDatabaseKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();

    final questionCount =
        ref.watch(questionRepositoryProvider).getQuestionCount();

    // Register QuestionScreen as the one keeping all of the
    // QuestionPageScrollControllerProviders alive
    ref.watch(keepQuestionPageScrollControllerAliveProvider);

    return Scaffold(
      appBar: const QuestionAppBar(),
      body: PageView.builder(
        controller: pageController,
        itemCount: questionCount,
        onPageChanged: (nextPageIndex) {
          setNewCurrentPageIndex(ref, nextPageIndex);
        },
        physics: const FastPageViewScrollPhysics(),
        itemBuilder: (context, index) {
          return QuestionPage(questionIndex: index);
        },
      ),
      bottomNavigationBar: QuestionBottomNavigationBar(
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
            isScrollControlled: true,
            context: context,
            constraints: BoxConstraints.tightFor(
              // BottomSheet will be 40% of the screen height
              height: context.height * 0.6,
            ),
            showDragHandle: true,
            builder: (_) => Scrollbar(
              child: QuestionList(
                initialPageIndex: ref.read(currentPageIndexProvider),
                onQuestionCardPressed: (questionIndex) {
                  pageController.animateToPage(
                    questionIndex,
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

// This provider is used to keep track of the index of the page in the
// middle of the screen.
// It should change when the user scrolled halfway through a new page
@riverpod
class CurrentPageIndex extends _$CurrentPageIndex {
  @override
  int build() {
    return 0;
  }

  set value(int newValue) {
    state = newValue;
  }
}
