import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/widget_sizes.dart';
import 'package:driving_license/features/question/data/question_repository.dart';
import 'package:driving_license/features/question/presentation/bottom_nav_bar/question_bottom_navigation_bar.dart';
import 'package:driving_license/features/question/presentation/question/question_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
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
    final currentPageIndex = ref.watch(currentPageIndexProvider);
    final currentPageScrollController =
        ref.watch(questionPageScrollControllerProvider(currentPageIndex));

    keepAliveNearbyQuestionPageScrollControllerProviders(ref);

    return Scaffold(
      appBar: CommonAppBar(
        title: Text('Câu hỏi ${currentPageIndex + 1}'),
        actions: [
          IconButton(
            icon: const Icon(Symbols.bookmark),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Symbols.restart_alt),
            onPressed: () {},
          ),
        ],
        scaffoldBodyScrollController: currentPageScrollController,
      ),
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
      bottomNavigationBar: BottomAppBar(
        height: kBottomAppBarHeight,
        padding: const EdgeInsets.all(kSize_0),
        child: QuestionBottomNavigationBar(
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
          onShowAllPressed: () {},
        ),
      ),
    );
  }
}

extension QuestionScreenX on QuestionScreen {
  // Because riverpod will auto dispose any provider that is not being listened,
  // QuestionPageScrollControllerProvider of nearby pages will not save their
  // scroll controller, causing them to be null when being accessed.
  //
  // To workaroud this, we need to keep all nearby
  // QuestionPageScrollControllerProvider alive by listening to them.
  //
  // This is a feature of riverpod, not a bug. Otherwise it will cause memory
  // leak if we keep all providers alive.
  void keepAliveNearbyQuestionPageScrollControllerProviders(WidgetRef ref) {
    final currentPageIndex = ref.watch(currentPageIndexProvider);

    ref.listen(
      questionPageScrollControllerProvider(currentPageIndex + 1),
      (_, __) {},
    );
    ref.listen(
      questionPageScrollControllerProvider(currentPageIndex - 1),
      (_, __) {},
    );
  }

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
