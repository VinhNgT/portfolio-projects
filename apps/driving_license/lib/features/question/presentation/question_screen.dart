import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/features/question/data/question_repository.dart';
import 'package:driving_license/features/question/presentation/question_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class QuestionScreen extends HookConsumerWidget {
  final int chapterDatabaseKey;
  const QuestionScreen({super.key, required this.chapterDatabaseKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = useState<int>(0);
    final pageController = usePageController();

    final questionCount =
        ref.watch(questionRepositoryProvider).getQuestionCount();
    final currentPageScrollController =
        ref.watch(questionPageScrollControllerProvider(currentPageIndex.value));

    keepAliveNearbyQuestionPageScrollControllerProviders(
      ref,
      currentPageIndex.value,
    );

    return Scaffold(
      appBar: CommonAppBar(
        title: Text('Câu hỏi ${currentPageIndex.value + 1}'),
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
          currentPageIndex.value = nextPageIndex;
        },
        physics: const FastPageViewScrollPhysics(),
        itemBuilder: (context, index) {
          return QuestionPage(
            questionIndex: index,
          );
        },
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
  void keepAliveNearbyQuestionPageScrollControllerProviders(
    WidgetRef ref,
    int currentPageIndex,
  ) {
    ref.listen(
      questionPageScrollControllerProvider(currentPageIndex + 1),
      (_, __) {},
    );
    ref.listen(
      questionPageScrollControllerProvider(currentPageIndex - 1),
      (_, __) {},
    );
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
