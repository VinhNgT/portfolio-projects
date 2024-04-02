import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/async_value/async_value_scaffold.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/features/exams/application/exams_service.dart';
import 'package:driving_license/features/exams/presentation/empty_exams_list.dart';
import 'package:driving_license/features/exams/presentation/exams_list.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class ExamsListScreen extends HookConsumerWidget {
  const ExamsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examsList = ref.watch(examsListStreamProvider);

    return AsyncValueScaffold(
      value: examsList,
      builder: (examsListValue) => Scaffold(
        appBar: CommonAppBar(
          backgroundColor: context.materialScheme.surfaceContainer,
          title: const Text('Bộ đề thi thử'),
          actions: [
            IconButton(
              icon: const Icon(Symbols.edit),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Symbols.delete),
              onPressed: () {},
            ),
          ],
        ),
        body: examsListValue.isEmpty
            ? const EmptyExamsList()
            : ExamsList(examsList: examsListValue),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Symbols.add),
          label: const Text('Tạo bộ đề mới'),
          onPressed: () async {
            final examsService = await ref.read(examsServiceProvider.future);
            await examsService.createExam();
          },
        ),
      ),
    );
  }
}
