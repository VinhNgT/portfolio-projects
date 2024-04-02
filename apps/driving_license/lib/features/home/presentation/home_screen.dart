import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/async_value/async_value_scaffold.dart';
import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/common_widgets/notify_scroll_size_changes.dart';
import 'package:driving_license/common_widgets/widget_deadzone.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/chapters/application/providers/chapter_info_providers.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/home/presentation/chapter_card.dart';
import 'package:driving_license/features/home/presentation/donate_card.dart';
import 'package:driving_license/features/home/presentation/empty_dialogs/bookmarks_empty_dialog.dart';
import 'package:driving_license/features/home/presentation/empty_dialogs/no_wrong_answers_dialog.dart';
import 'package:driving_license/features/home/presentation/feature_card.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/routing/app_router.dart';
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
    final licenseName = ref.watch(userSelectedLicenseProvider);
    final scrollController = useScrollController();

    return AsyncValueScaffold(
      value: licenseName,
      builder: (licenseNameValue) => Scaffold(
        appBar: CommonAppBar(
          leading: IconButton(
            icon: const Icon(Symbols.rule_settings),
            onPressed: () async {
              await context.navigateTo(LicenseSelectionRoute());
            },
          ),
          title: Text(_getLicenseName(licenseNameValue)),
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
          child: NotifyScrollSizeChanges(
            scrollController: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: kSize_16,
                  right: kSize_16,
                  top: kSize_4,
                  bottom: kSize_48,
                ),
                child: NotifyScrollSizeChanges(
                  scrollController: scrollController,
                  child: const Column(
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
          ),
        ),
      ),
    );
  }

  String _getLicenseName(License license) {
    final StringBuffer buffer = StringBuffer('Giấy phép lái xe' ' ');
    final licenseCode = license.name.toUpperCase();
    buffer.write(licenseCode);
    return buffer.toString();
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
            onPressed: () async {
              await context.navigateTo(const ExamsListRoute());
            },
          ),
        ),
        SizedBox.expand(
          child: FeatureCard(
            title: 'Các câu khó',
            subhead: 'Các câu hỏi dễ bị nhầm lẫn',
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
              ref
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
              ref
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
    final notEmptyChapters = ref.watch(notEmptyChaptersProvider);

    return AsyncValueWidget(
      value: notEmptyChapters,
      builder: (chaptersHasQuestionValue) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ôn tập câu hỏi', style: context.textTheme.titleLarge),
          kGap_16,
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) => kGap_12,
            itemCount: chaptersHasQuestionValue.length,
            itemBuilder: (BuildContext _, int index) {
              final chapter = chaptersHasQuestionValue[index];
              return ChapterCard(
                chapter: chapter,
                onTap: (chapter) async {
                  await setupAndNavigateToQuestionRoute(ref, chapter);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

extension ChapterSelectionX on ChapterSelection {
  Future<void> setupAndNavigateToQuestionRoute(
    WidgetRef ref,
    Chapter chapter,
  ) async {
    final context = ref.context;

    final chapterFirstUnansweredQuestionIndex = await ref
        .read(chapterFirstUnansweredQuestionIndexProvider(chapter).future);

    ref
        .read(questionsServiceControllerProvider.notifier)
        .setupChapterQuestions(chapter);

    if (context.mounted) {
      await context.navigateTo(
        QuestionRoute(
          initialPageIndex: chapterFirstUnansweredQuestionIndex ?? 0,
        ),
      );
    }
  }
}

class HomeRouteGuard extends AutoRouteGuard {
  AppRouterRef ref;

  /// Only allow user to access HomeRoute if they have selected a license
  HomeRouteGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final userSelectedLicense =
        await ref.read(userSelectedLicenseProvider.future);

    if (userSelectedLicense != License.all) {
      resolver.next(true);
      return;
    }

    await resolver.redirect(
      LicenseSelectionRoute(
        afterLicenseSelected: () => resolver.next(true),
        navigateToHomeAfterLicenseSelected: false,
      ),
    );
  }
}
