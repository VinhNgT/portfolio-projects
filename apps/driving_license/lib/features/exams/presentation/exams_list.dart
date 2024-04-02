import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/exams/presentation/exam_card.dart';
import 'package:driving_license/features/exams/presentation/exam_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExamsList extends HookConsumerWidget {
  final List<Exam> examsList;
  const ExamsList({super.key, required this.examsList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PrototypeExamCard.buildOffstageOverlay();
    final examCardHeight = ref.watch(examCardPrototypeHeightProvider);

    if (examCardHeight == null) {
      return const SizedBox.shrink();
    }

    return GridView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: examsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: kSize_12,
        mainAxisExtent: examCardHeight,
        mainAxisSpacing: kSize_12,
      ),
      padding: const EdgeInsets.only(
        top: kSize_16,
        left: kSize_16,
        right: kSize_16,
        bottom: kSize_96,
      ),
      itemBuilder: (context, index) => ExamCard(
        exam: examsList[index],
        onPressed: () {},
      ),
    );
  }
}
