import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/features/exams/data/exams_repository.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/exams/presentation/dialogs/delete_confirm_dialog.dart';
import 'package:driving_license/features/exams/presentation/exams_list/exam_card.dart';
import 'package:driving_license/features/exams/presentation/exams_list/exam_card_controller.dart';
import 'package:driving_license/features/exams/presentation/exams_list_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExamsList extends HookConsumerWidget {
  final List<Exam> examsList;
  final void Function(int index)? onExamCardPressed;

  const ExamsList({
    super.key,
    required this.examsList,
    this.onExamCardPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PrototypeExamCard.buildOffstageOverlay();
    final examCardHeight = ref.watch(examCardPrototypeHeightProvider);

    if (examCardHeight == null) {
      return const SizedBox.shrink();
    }

    return Scrollbar(
      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: examsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: examCardHeight,
          crossAxisSpacing: kSize_12,
          mainAxisSpacing: kSize_12,
        ),
        padding: const EdgeInsets.only(
          top: kSize_16,
          left: kSize_16,
          right: kSize_16,
          bottom: kSize_96,
        ),
        itemBuilder: (context, index) => Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(examsListScreenStateProvider);

            return ExamCard(
              key: ValueKey(examsList[index].examId),
              exam: examsList[index],
              state: state,
              onPressed: () async {
                switch (state) {
                  case ExamsListState.view:
                    onExamCardPressed?.call(index);
                  case ExamsListState.delete:
                    final confirm = await _showDeleteConfirmDialog(
                      context,
                      examsList[index],
                    );

                    if (confirm) {
                      await _deleteExam(ref, examsList[index]);
                    }
                  case _:
                    break;
                }
              },
            );
          },
        ),
      ),
    );
  }
}

extension on ExamsList {
  Future<bool> _showDeleteConfirmDialog(
    BuildContext context,
    Exam exam,
  ) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) => DeleteConfirmDialog(
            examName: exam.name,
          ),
        ) ??
        false;
  }

  Future<void> _deleteExam(WidgetRef ref, Exam exam) async {
    ref.read(examsRepositoryProvider).deleteExam(exam);
  }
}
