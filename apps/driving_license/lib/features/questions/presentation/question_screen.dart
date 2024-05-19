import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/aware_route_state.dart';
import 'package:driving_license/common_widgets/widget_deadzone.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/application/question/questions_service_mode.dart';
import 'package:driving_license/features/questions/presentation/appbar_navbar/question_app_bar.dart';
import 'package:driving_license/features/questions/presentation/appbar_navbar/question_bottom_navigation_bar.dart';
import 'package:driving_license/features/questions/presentation/question/question_page_controller.dart';
import 'package:driving_license/features/questions/presentation/question/question_page_view.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_card.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_list_bottom_sheet.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/ref_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class QuestionScreen extends HookConsumerWidget {

  const QuestionScreen({
    super.key,
    this.initialPageIndex = 0,
    this.onclose,
  });
  final int initialPageIndex;
  final void Function(int currentPageIndex)? onclose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController(initialPage: initialPageIndex);
    final questionCount = ref.watch(questionCountFutureProvider);
    final isExamMode = ref.watchConvertAsyncValue(
      questionsServiceModeProvider,
      (valueData) => valueData is ExamOperatingMode,
    );

    ref.keepProviderAlive(currentPageIndexProvider);
    ref.keepProviderAlive(keepQuestionPageScrollControllerAliveProvider);

    // Set the initial page index for currentPageIndexProvider
    useSetInitialValueCurrentPageIndexProvider(ref, initialPageIndex);

    // Save the current page index when the app goes to the background
    useOnAppLifecycleStateChange((_, current) {
      if (current == AppLifecycleState.inactive) {
        onclose?.call(ref.read(currentPageIndexProvider));
      }
    });

    // We must call this so QuestionList in QuestionBottomSheet can layout its
    // QuestionCards correctly
    PrototypeQuestionCard.buildOffstageOverlay();

    return AwareRouteState(
      didPop: () => onclose?.call(ref.read(currentPageIndexProvider)),
      child: Async2ValuesWidget<int, bool>(
        values: (questionCount, isExamMode),
        builder: (questionCountValue, isExamModeValue) => Scaffold(
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
          bottomNavigationBar:
              QuestionBottomNavigationBar.createBasedOnExamMode(
            isExamMode: isExamModeValue,
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
                useSafeArea: true,
                isScrollControlled: true,
                constraints: BoxConstraints.tightFor(
                  // BottomSheet will be 75% of the screen height
                  height: context.height * 0.75,
                ),
                builder: (_) => QuestionListBottomSheet(
                  questionCount: questionCountValue,
                  initialCurrentPageIndex: ref.read(currentPageIndexProvider),
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
      ),
    );
  }
}

extension QuestionScreenX on QuestionScreen {
  void useSetInitialValueCurrentPageIndexProvider(
    WidgetRef ref,
    int initialPageIndex,
  ) {
    useEffect(
      () {
        Future.microtask(
          () => ref.read(currentPageIndexProvider.notifier).value =
              initialPageIndex,
        );
        return null;
      },
      [initialPageIndex],
    );
  }
}
