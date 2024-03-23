import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/async_value/async_value_scaffold.dart';
import 'package:driving_license/common_widgets/widget_deadzone.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/presentation/appbar_navbar/question_app_bar.dart';
import 'package:driving_license/features/questions/presentation/appbar_navbar/question_bottom_navigation_bar.dart';
import 'package:driving_license/features/questions/presentation/question/question_page_controller.dart';
import 'package:driving_license/features/questions/presentation/question/question_page_view.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_bottom_sheet.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_card.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/ref_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class QuestionScreen extends HookConsumerWidget {
  final int initialPageIndex;
  const QuestionScreen({super.key, this.initialPageIndex = 0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController(initialPage: initialPageIndex);
    final questionCount = ref.watch(questionCountFutureProvider);

    // Register QuestionScreen as the one keeping all of the
    // QuestionPageScrollControllerProviders alive
    ref.keepProviderAlive(keepQuestionPageScrollControllerAliveProvider);

    // We must call this so QuestionList in QuestionBottomSheet can layout its
    // QuestionCards correctly
    PrototypeQuestionCard.buildOffstageOverlay();

    return AsyncValueScaffold(
      value: questionCount,
      builder: (questionCountValue) => Scaffold(
        appBar: const QuestionAppBar(),
        body: WidgetDeadzone(
          deadzone: EdgeInsets.only(
            left: context.systemGestureInsets.left,
            right: context.systemGestureInsets.right,
          ),
          child: QuestionPageView(
            questionCount: questionCountValue,
            pageController: pageController,
          ),
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
              isScrollControlled: true,
              useSafeArea: true,
              constraints: BoxConstraints.tightFor(
                // BottomSheet will be 80% of the screen height
                height: context.height * 0.8,
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
