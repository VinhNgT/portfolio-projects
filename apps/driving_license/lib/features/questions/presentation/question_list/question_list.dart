import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/application/question/questions_service_mode.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_card.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_card_controller.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/ref_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionList extends HookConsumerWidget {
  final int initialCurrentPageIndex;
  final int questionCount;
  final double viewPortHeight;
  final void Function(int index)? onQuestionCardPressed;

  const QuestionList({
    super.key,
    required this.initialCurrentPageIndex,
    required this.questionCount,
    required this.viewPortHeight,
    this.onQuestionCardPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCardIndex = useState(initialCurrentPageIndex);
    final userInteracted = useState(false);
    final questionCardHeight = ref.watch(questionCardPrototypeHeightProvider);
    final isExamMode = ref.watchConvertAsyncValue(
      questionsServiceModeProvider,
      (valueData) => valueData is ExamOperatingMode,
    );

    if (questionCardHeight == null) {
      return const SizedBox.shrink();
    }

    final scrollController = useScrollController(
      initialScrollOffset: calculateInitialScrollOffset(
        questionCardHeight: questionCardHeight,
        initialTargeItemIndex: selectedCardIndex.value,
        targetItemTopOffsetCount: 2,
      ),
    );

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
      child: NotificationListener(
        onNotification: (notification) {
          // if (notification is ScrollNotification) {
          //   debugPrint('Scrolling');
          // }
          return false;
        },
        child: AsyncValueWidget(
          value: isExamMode,
          builder: (isExamModeValue) => ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            itemExtent: questionCardHeight,
            itemCount: questionCount,
            itemBuilder: (context, index) {
              return AsyncQuestionCard(
                questionPageIndex: index,
                isSelected: index == selectedCardIndex.value,
                showAnswerResult: !isExamModeValue,
                showIsDanger: !isExamModeValue,
                onPressed: () {
                  userInteracted.value = true;
                  selectedCardIndex.value = index;
                  onQuestionCardPressed?.call(index);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

extension QuestionListX on QuestionList {
  double calculateInitialScrollOffset({
    required double questionCardHeight,
    required int initialTargeItemIndex,
    required int targetItemTopOffsetCount,
  }) {
    final scrollContentHeight =
        questionCardHeight * questionCount + useContext().bottomBarHeight;

    if (scrollContentHeight <= viewPortHeight) {
      return 0;
    }

    final scrollOffset =
        questionCardHeight * (initialTargeItemIndex - targetItemTopOffsetCount);

    final maxScrollExtent = scrollContentHeight - viewPortHeight;
    return scrollOffset.clamp(0, maxScrollExtent);
  }
}
