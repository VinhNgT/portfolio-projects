import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/constants/widget_sizes.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/presentation/appbar_navbar/bookmark_button.dart';
import 'package:driving_license/features/questions/presentation/appbar_navbar/question_app_bar_controller.dart';
import 'package:driving_license/features/questions/presentation/question/question_page_controller.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:driving_license/utils/ref_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vector_graphics/vector_graphics.dart';

class QuestionAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const QuestionAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerState = ref.watch(questionAppBarControllerProvider);
    final currentPageIndex = ref.watch(currentPageIndexProvider);
    final currentPageScrollController =
        ref.watch(questionPageScrollControllerProvider(currentPageIndex));

    return CommonAppBar(
      title: _QuestionTitle(currentPageIndex: currentPageIndex),
      actions: [
        const BookmarkButton(),
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
    final currentQuestion = await ref.read(currentQuestionProvider.future);
    await ref
        .read(questionAppBarControllerProvider.notifier)
        .deleteAnswer(currentQuestion);
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

class _QuestionTitle extends HookConsumerWidget {
  const _QuestionTitle({required this.currentPageIndex});
  final int currentPageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDanger = ref.useWatchAsyncValue(
      questionFutureProvider(currentPageIndex).select((value) {
        return value.map<AsyncValue<bool>>(
          data: (asyncData) => AsyncData(asyncData.value.isDanger),
          error: (asyncError) =>
              AsyncError(asyncError.error, asyncError.stackTrace),
          loading: (asyncLoading) => const AsyncLoading(),
        );
      }),
      initialData: false,
    );

    return Row(
      children: [
        Text('Câu hỏi ${currentPageIndex + 1}'),
        kGap_6,
        Visibility(
          visible: isDanger,
          child: const SvgPicture(
            AssetBytesLoader(
              'assets/icons/home_screen/complied/danger_fire.svg.vec',
            ),
            height: kSize_16,
            width: kSize_16,
          ),
        ),
      ],
    );
  }
}
