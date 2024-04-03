import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/async_value/async_value_scaffold.dart';
import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/constants/widget_sizes.dart';
import 'package:driving_license/features/exams/application/exams_service.dart';
import 'package:driving_license/features/exams/presentation/empty_exams_list.dart';
import 'package:driving_license/features/exams/presentation/exams_list.dart';
import 'package:driving_license/features/exams/presentation/exams_list_screen_controller.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/ref_ext.dart';
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
          appBar: const _AnimatedAppBar(),
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
          floatingActionButton: AnimatedSwitcher(
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
            child: (state == ExamsListState.view && examsListValue.isNotEmpty)
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
          ),
        ),
      ),
    );
  }
}

class _AnimatedAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const _AnimatedAppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(examsListScreenStateProvider);
    final isExamListEmpty = ref.watchConvertAsyncValue(
      examsListStreamProvider,
      (exams) => exams.isEmpty,
    );

    return AsyncValueWidget(
      value: isExamListEmpty,
      builder: (isExamListEmptyValue) => Container(
        color: context.materialScheme.surfaceContainer,
        child: AnimatedSwitcher(
          duration: Durations.short3,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: switch (state) {
            ExamsListState.view =>
              _ViewAppBar(showActionIcons: !isExamListEmptyValue),
            ExamsListState.edit => const _EditAppBar(),
            ExamsListState.delete => const _DeleteAppBar(),
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);
}

class _ViewAppBar extends HookConsumerWidget {
  final bool showActionIcons;
  const _ViewAppBar({this.showActionIcons = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonAppBar(
      backgroundColor: context.materialScheme.surfaceContainer,
      title: const Text('Bộ đề thi thử'),
      actions: showActionIcons
          ? [
              IconButton(
                icon: const Icon(Symbols.edit),
                onPressed: () {
                  ref.read(examsListScreenStateProvider.notifier).value =
                      ExamsListState.edit;
                },
              ),
              IconButton(
                icon: const Icon(Symbols.delete),
                onPressed: () {
                  ref.read(examsListScreenStateProvider.notifier).value =
                      ExamsListState.delete;
                },
              ),
            ]
          : List.empty(),
    );
  }
}

class _EditAppBar extends HookConsumerWidget {
  const _EditAppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonAppBar(
      backgroundColor: context.materialScheme.surfaceContainer,
      title: const Text('Chọn bộ đề để đổi tên'),
      leading: IconButton(
        icon: const Icon(Symbols.close),
        onPressed: () {
          ref.read(examsListScreenStateProvider.notifier).value =
              ExamsListState.view;
        },
      ),
    );
  }
}

class _DeleteAppBar extends HookConsumerWidget {
  const _DeleteAppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonAppBar(
      backgroundColor: context.materialScheme.surfaceContainer,
      title: const Text('Chọn bộ đề để xoá'),
      leading: IconButton(
        icon: const Icon(Symbols.close),
        onPressed: () {
          ref.read(examsListScreenStateProvider.notifier).value =
              ExamsListState.view;
        },
      ),
    );
  }
}
