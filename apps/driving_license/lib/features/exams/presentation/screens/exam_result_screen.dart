import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/common_widgets/widget_deadzone.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_exam_providers.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_card.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class ExamResultScreen extends HookConsumerWidget {
  const ExamResultScreen({super.key});

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
          ),
        ),
      ),
    );
  }
}

class AnswersResultList extends HookConsumerWidget {
  final ScrollController scrollController;

  const AnswersResultList({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionsCount = ref.watch(questionCountFutureProvider);

    return AsyncValueWidget(
      value: questionsCount,
      builder: (questionsCountValue) => CustomScrollView(
        controller: scrollController,
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.only(
              bottom: kSize_16,
              left: kSize_16,
              right: kSize_16,
            ),
            sliver: SliverToBoxAdapter(
              child: _ExamResultSummary(),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(),
          ),
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
          SliverGap(context.bottomBarHeight),
        ],
      ),
    );
  }
}

class _ExamResultSummary extends HookConsumerWidget {
  const _ExamResultSummary();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentExam = ref.watch(currentExamProvider);

    return AsyncValueWidget(
      value: currentExam,
      builder: (currentExamValue) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentExamValue.name,
            style: TextStyle(color: context.materialScheme.onSurfaceVariant),
          ),
          kGap_2,
          Text(
            _getStatusTitle(currentExamValue.answersStatus),
            style: context.textTheme.titleLarge,
          ),
          kGap_12,
          _SummaryCounts(exam: currentExamValue),
        ],
      ),
    );
  }

  String _getStatusTitle(ExamAnswersStatus answersStatus) {
    return switch (answersStatus) {
      ExamAnswersStatus.pass => 'Đạt',
      ExamAnswersStatus.passPerfect => 'Đạt - Đúng toàn bộ',
      ExamAnswersStatus.fail => 'Không đạt - Không đủ điểm',
      ExamAnswersStatus.failDanger => 'Không đạt - Sai câu điểm liệt',
    };
  }
}

class _SummaryCounts extends StatelessWidget {
  final Exam exam;
  const _SummaryCounts({required this.exam});

  @override
  Widget build(BuildContext context) {
    final userAnswersSummary = exam.userAnswers.summary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(
              Symbols.check_circle,
              color: context.materialScheme.tertiary,
            ),
            kGap_8,
            Text(
              'Đúng: ${userAnswersSummary.correctAnswers} / ${exam.questionsCount}',
            ),
          ],
        ),
        kGap_8,
        Row(
          children: [
            Icon(
              Symbols.cancel,
              color: context.materialScheme.error,
            ),
            kGap_8,
            Text('Sai: ${userAnswersSummary.wrongAnswers}'),
          ],
        ),
        kGap_8,
        Row(
          children: [
            Icon(
              Symbols.error,
              color: context.materialScheme.secondary,
            ),
            kGap_8,
            Text(
              'Sai câu điểm liệt: ${userAnswersSummary.wrongAnswersIsDanger}',
            ),
          ],
        ),
      ],
    );
  }
}
