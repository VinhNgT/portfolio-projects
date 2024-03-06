import 'package:driving_license/features/questions/presentation/question_list/question_card.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionList extends HookConsumerWidget {
  final int initialCurrentPageIndex;
  final int questionCount;
  final void Function(int index)? onQuestionCardPressed;

  const QuestionList({
    super.key,
    required this.initialCurrentPageIndex,
    required this.questionCount,
    this.onQuestionCardPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCardIndex = useState(initialCurrentPageIndex);
    final userInteracted = useState(false);

    // If current page index is changed before user interacted with the list,
    // update the list accordingly
    // This is to keep the list in sync with the current page index during
    // animations
    ref.listen(currentPageIndexProvider, (_, currentPageIndex) {
      if (!userInteracted.value) {
        selectedCardIndex.value = currentPageIndex;
      }
    });

    return Scrollbar(
      child: ListView.builder(
        prototypeItem: const PrototypeQuestionCard(),
        itemCount: questionCount,
        itemBuilder: (context, index) {
          return AsyncValueQuestionCard(
            questionPageIndex: index,
            isSelected: index == selectedCardIndex.value,
            onPressed: () {
              userInteracted.value = true;
              selectedCardIndex.value = index;
              onQuestionCardPressed?.call(index);
            },
          );
        },
      ),
    );
  }
}
