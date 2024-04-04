import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/async_value/async_value_scaffold.dart';
import 'package:driving_license/features/exams/application/exams_service.dart';
import 'package:driving_license/features/exams/presentation/exams_list/empty_exams_list.dart';
import 'package:driving_license/features/exams/presentation/exams_list/exams_list.dart';
import 'package:driving_license/features/exams/presentation/exams_list_screen_appbar.dart';
import 'package:driving_license/features/exams/presentation/exams_list_screen_controller.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class ExamsListScreen extends HookConsumerWidget {
  const ExamsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(examsListScreenStateProvider);
    final examsList = ref.watch(examsListStreamProvider);

    ref.listen(examsListStreamProvider, (_, examsList) {
      examsList.whenData((exams) {
        if (exams.isEmpty) {
          ref.read(examsListScreenStateProvider.notifier).value =
              ExamsListState.view;
        }
      });
    });

    return PopScope(
      canPop: state == ExamsListState.view,
      onPopInvoked: (didPop) {
        ref.read(examsListScreenStateProvider.notifier).value =
            ExamsListState.view;
      },
      child: AsyncValueScaffold(
        value: examsList,
        builder: (examsListValue) => Scaffold(
          appBar: const ExamsListScreenAppBar(),
          body: Visibility(
            visible: examsListValue.isNotEmpty,
            replacement: const EmptyExamsList(),
            child: ExamsList(
              examsList: examsListValue,
              onExamCardPressed: (index) async {
                ref
                    .read(questionsServiceControllerProvider.notifier)
                    .setupExamQuestions(examsListValue[index]);

                await context.navigateTo(QuestionRoute());
              },
            ),
          ),
          floatingActionButton: _AnimatedFloatingActionButton(
            show: state == ExamsListState.view && examsListValue.isNotEmpty,
          ),
        ),
      ),
    );
  }
}

class _AnimatedFloatingActionButton extends HookConsumerWidget {
  final bool show;
  const _AnimatedFloatingActionButton({required this.show});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSwitcher(
      duration: Durations.short3,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1.5),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
          ),
          child: child,
        );
      },
      child: show
          ? FloatingActionButton.extended(
              icon: const Icon(Symbols.add),
              label: const Text('Tạo bộ đề mới'),
              onPressed: () async {
                final examsService =
                    await ref.read(examsServiceProvider.future);
                await examsService.createExam();
              },
            )
          : const SizedBox.shrink(),
    );
  }
}
