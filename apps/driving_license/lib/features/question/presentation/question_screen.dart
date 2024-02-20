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
    final questionCount =
        ref.watch(questionRepositoryProvider).getQuestionCount();
    final pageController = usePageController();
    final currentPageIndex = useState<int>(0);
    final currentPageScrollController = useState<ScrollController?>(null);

    ref.listen(
      questionPageScrollControllerProvider(currentPageIndex.value),
      (_, next) {
        currentPageScrollController.value = next;
      },
    );
    ref.listen(
      questionPageScrollControllerProvider(currentPageIndex.value + 1),
      (_, __) {},
    );
    ref.listen(
      questionPageScrollControllerProvider(currentPageIndex.value - 1),
      (_, __) {},
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
        scaffoldBodyScrollController: currentPageScrollController.value,
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: questionCount,
        onPageChanged: (nextPageIndex) {
          currentPageIndex.value = nextPageIndex;
          currentPageScrollController.value = ref.read(
            questionPageScrollControllerProvider(nextPageIndex),
          );
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
