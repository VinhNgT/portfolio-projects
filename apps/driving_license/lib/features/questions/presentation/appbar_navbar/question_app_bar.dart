import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/constants/widget_sizes.dart';
import 'package:driving_license/features/questions/application/question_service.dart';
import 'package:driving_license/features/questions/presentation/appbar_navbar/question_app_bar_controller.dart';
import 'package:driving_license/features/questions/presentation/question/question_page_controller.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class QuestionAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const QuestionAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerState = ref.watch(questionAppBarControllerProvider);
    final currentPageIndex = ref.watch(currentPageIndexProvider);
    final currentPageScrollController =
        ref.watch(questionPageScrollControllerProvider(currentPageIndex));

    return CommonAppBar(
      title: Text('Câu hỏi ${currentPageIndex + 1}'),
      actions: [
        IconButton(
          icon: const Icon(Symbols.bookmark),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Symbols.restart_alt),
          onPressed: controllerState.isLoading
              ? null
              : () async {
                  resetSelectedAnswer(ref);
                  await resetQuestionPageScrollPosition(ref);
                },
        ),
      ],
      scaffoldBodyScrollController: currentPageScrollController,
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kAppBarHeight);
}

extension QuestionAppBarX on QuestionAppBar {
  void resetSelectedAnswer(WidgetRef ref) async {
    final currentPageIndex = ref.read(currentPageIndexProvider);
    final currentQuestion =
        await ref.read(questionFutureProvider(currentPageIndex).future);

    await ref.read(questionAppBarControllerProvider.notifier).deleteAnswer(
          currentQuestion.questionDbIndex,
        );
  }

  Future<void> resetQuestionPageScrollPosition(WidgetRef ref) async {
    final currentPageIndex = ref.read(currentPageIndexProvider);
    final scrollController =
        ref.read(questionPageScrollControllerProvider(currentPageIndex));
    final animationNotifier = ref.read(
      questionPageScrollingAnimationPlayingProvider(currentPageIndex).notifier,
    );

    animationNotifier.begin();

    await scrollController?.animateTo(
      0,
      duration: Durations.short3,
      curve: Curves.easeOut,
    );

    animationNotifier.end();
  }
}
