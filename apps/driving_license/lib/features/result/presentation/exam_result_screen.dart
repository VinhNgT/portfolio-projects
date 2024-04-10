import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/common_widgets/widget_deadzone.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/domain/user_answers_map.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_card.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ExamResultScreen extends HookConsumerWidget {
  final UserAnswersMap userAnswersMap;

  const ExamResultScreen({
    super.key,
    required this.userAnswersMap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        await Future.microtask(
          () => context.router.popUntilRouteWithName(ExamsListRoute.name),
        );
      },
      child: Scaffold(
        appBar: CommonAppBar(
          scaffoldBodyScrollController: scrollController,
          title: const Text('Kết quả bài thi'),
        ),
        body: WidgetDeadzone(
          deadzone: EdgeInsets.only(
            bottom: context.systemGestureInsets.bottom,
          ),
          child: AnswersResultList(
            scrollController: scrollController,
            userAnswersMap: userAnswersMap,
          ),
        ),
      ),
    );
  }
}

class AnswersResultList extends HookConsumerWidget {
  final ScrollController scrollController;
  final UserAnswersMap userAnswersMap;

  const AnswersResultList({
    super.key,
    required this.scrollController,
    required this.userAnswersMap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final questionsCount = ref.watch(questionCountFutureProvider);

    return AsyncValueWidget(
      value: questionsCount,
      builder: (questionsCountValue) => CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPrototypeExtentList(
            prototypeItem: const PrototypeQuestionCard(),
            delegate: SliverChildBuilderDelegate(
              childCount: questionsCountValue,
              (context, index) {
                return AsyncQuestionCard(
                  questionPageIndex: index,
                  isSelected: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
