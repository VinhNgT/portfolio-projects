import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/common_widgets/widget_deadzone.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/chapters/application/chapter_progress_service.dart';
import 'package:driving_license/features/chapters/application/providers/chapter_progress_providers.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/home/presentation/chapter_card.dart';
import 'package:driving_license/features/home/presentation/donate_card.dart';
import 'package:driving_license/features/home/presentation/empty_dialogs/bookmarks_empty_dialog.dart';
import 'package:driving_license/features/home/presentation/empty_dialogs/no_wrong_answers_dialog.dart';
import 'package:driving_license/features/home/presentation/feature_card.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const licenseName = 'Giấy phép lái xe A1';
    final scrollController = useScrollController();

    return Scaffold(
      appBar: CommonAppBar(
        leading: IconButton(
          icon: const Icon(Symbols.menu),
          onPressed: () {},
        ),
        title: const Text(licenseName),
        actions: [
          TextButton(onPressed: () {}, child: const Text('Báo lỗi')),
        ],
        rightPadding: AppBarRightPadding.normalButton,
        scaffoldBodyScrollController: scrollController,
      ),
      body: WidgetDeadzone(
        deadzone: EdgeInsets.only(
          bottom: context.systemGestureInsets.bottom,
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: const Padding(
            padding: EdgeInsets.only(
              left: kSize_16,
              right: kSize_16,
              top: kSize_4,
              bottom: kSize_48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DonateCard(),
                kGap_20,
                FeatureSelection(),
                kGap_32,
                ChapterSelection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeatureSelection extends HookConsumerWidget {
  const FeatureSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutGrid(
      columnSizes: [1.fr, 1.fr],
      rowSizes: const [auto, auto],
      rowGap: kSize_12,
      // This weird looking columnGap value is for fixing a random LayoutGrid
      // bug happens during app launches while screen is off
      columnGap: context.width > kSize_12 ? kSize_12 : 0,
      children: [
        SizedBox.expand(
          child: FeatureCard(
            title: 'Thi thử',
            subhead: 'Bộ đề được tạo ra ngẫu nhiên',
            onPressed: () {},
          ),
        ),
        SizedBox.expand(
          child: FeatureCard(
            title: 'Các câu khó',
            subhead: '50 câu hỏi dễ bị nhầm lẫn',
            onPressed: () async {
              ref
                  .read(questionsServiceControllerProvider.notifier)
                  .setupDifficultQuestions();

              await context.navigateTo(QuestionRoute());
            },
          ),
        ),
        SizedBox.expand(
          child: FeatureCard(
            title: 'Đã lưu',
            subhead: 'Những câu hỏi được đánh dấu lưu',
            onPressed: () async {
              await ref
                  .read(questionsServiceControllerProvider.notifier)
                  .setupBookmarkedQuestions();

              final questionCount =
                  await ref.read(questionCountFutureProvider.future);

              if (context.mounted) {
                if (questionCount == 0) {
                  await showDialog(
                    context: context,
                    builder: (context) => const BookmarksEmptyDialog(),
                  );
                  return;
                }

                await context.navigateTo(QuestionRoute());
              }
            },
          ),
        ),
        SizedBox.expand(
          child: FeatureCard(
            title: 'Đã làm sai',
            subhead: 'Những câu hỏi bạn đã làm sai',
            onPressed: () async {
              await ref
                  .read(questionsServiceControllerProvider.notifier)
                  .setupWrongAnswerQuestions();

              final questionCount =
                  await ref.read(questionCountFutureProvider.future);

              if (context.mounted) {
                if (questionCount == 0) {
                  await showDialog(
                    context: context,
                    builder: (context) => const NoWrongAnswersDialog(),
                  );
                  return;
                }

                await context.navigateTo(QuestionRoute());
              }
            },
          ),
        ),
      ],
    );
  }
}

class ChapterSelection extends HookConsumerWidget {
  const ChapterSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ôn tập câu hỏi', style: context.textTheme.titleLarge),
        kGap_16,
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => kGap_12,
          itemCount: 7,
          itemBuilder: (BuildContext _, int index) => [
            ChapterCard(
              iconAssetPath: 'assets/icons/home_screen/complied/books.svg.vec',
              chapter: Chapter.khaiNiemVaQuyTac,
              onTap: (chapter) async {
                await setupAndNavigateToQuestionRoute(ref, chapter);
              },
            ),
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/danger_fire.svg.vec',
              chapter: Chapter.nghiepVuVanTai,
              onTap: (chapter) async {
                await setupAndNavigateToQuestionRoute(ref, chapter);
              },
            ),
            ChapterCard(
              iconAssetPath: 'assets/icons/home_screen/complied/person.svg.vec',
              chapter: Chapter.vanHoaVaDaoDuc,
              onTap: (chapter) async {
                await setupAndNavigateToQuestionRoute(ref, chapter);
              },
            ),
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/steering_wheel.svg.vec',
              chapter: Chapter.kyThuatLaiXe,
              onTap: (chapter) async {
                await setupAndNavigateToQuestionRoute(ref, chapter);
              },
            ),
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/danger_fire.svg.vec',
              chapter: Chapter.cauTaoVaSuaChua,
              onTap: (chapter) async {
                await setupAndNavigateToQuestionRoute(ref, chapter);
              },
            ),
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/turn_right_sign.svg.vec',
              chapter: Chapter.bienBaoDuongBo,
              onTap: (chapter) async {
                await setupAndNavigateToQuestionRoute(ref, chapter);
              },
            ),
            ChapterCard(
              iconAssetPath:
                  'assets/icons/home_screen/complied/traffic_light.svg.vec',
              chapter: Chapter.saHinhVaTinhHuong,
              onTap: (chapter) async {
                await setupAndNavigateToQuestionRoute(ref, chapter);
              },
            ),
          ][index],
        ),
      ],
    );
  }
}

extension ChapterSelectionX on ChapterSelection {
  Future<void> setupAndNavigateToQuestionRoute(
    WidgetRef ref,
    Chapter chapter,
  ) async {
    final context = ref.context;
    ref
        .read(questionsServiceControllerProvider.notifier)
        .setupChapterQuestions(chapter);

    final lastVisitedPageIndex =
        await ref.read(lastQuestionPageIndexVisitedProvider(chapter).future);

    if (context.mounted) {
      await context.navigateTo(
        QuestionRoute(
          initialPageIndex: lastVisitedPageIndex,
          onclose: (currentPageIndex) async {
            final chapterProgressService =
                await ref.read(chapterProgressServiceProvider(chapter).future);

            await chapterProgressService
                .saveLastQuestionPageIndexVisited(currentPageIndex);
          },
        ),
      );
    }
  }
}
