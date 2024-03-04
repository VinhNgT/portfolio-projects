import 'package:driving_license/features/questions/data/question_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_card.dart';
import 'package:driving_license/features/questions/presentation/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class QuestionList extends HookConsumerWidget {
  final int questionCount;
  final int initialCurrentPageIndex;
  final void Function(int index)? onQuestionCardPressed;

  const QuestionList({
    super.key,
    required this.questionCount,
    required this.initialCurrentPageIndex,
    this.onQuestionCardPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCardIndex = useState(initialCurrentPageIndex);
    final userInteracted = useState(false);
    final pagingController = usePagingController(ref);

    // If current page index is changed before user interacted with the list,
    // update the list accordingly
    // This is to keep the list in sync with the current page index during
    // animations
    ref.listen(currentPageIndexProvider, (_, currentPageIndex) {
      if (!userInteracted.value) {
        selectedCardIndex.value = currentPageIndex;
      }
    });

    return PagedListView<int, Question>(
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<Question>(
        itemBuilder: (context, item, index) => QuestionCard(
          questionPageIndex: index,
          question: item,
          isSelected: index == selectedCardIndex.value,
          onPressed: () {
            userInteracted.value = true;
            selectedCardIndex.value = index;
            onQuestionCardPressed?.call(index);
          },
        ),
      ),
    );
  }
}

extension QuestionListX on QuestionList {
  PagingController<int, Question> usePagingController(WidgetRef ref) {
    final pagingController = useState(
      PagingController<int, Question>(firstPageKey: 0),
    );

    useEffect(
      () {
        pagingController.value.addPageRequestListener((pageKey) async {
          await fetchPage(ref, pageKey, pagingController.value);
        });
        return pagingController.value.dispose;
      },
      const [],
    );

    return pagingController.value;
  }

  Future<void> fetchPage(
    WidgetRef ref,
    int pageKey,
    PagingController<int, Question> pagingController,
  ) async {
    try {
      //* Reminder: pageNumber is 'Page Number', while pageKey is 'Item Index',
      //* stupid, isn't it?
      final pageNumber = pageKey ~/ QuestionRepository.pageSize;
      final newItems = await ref
          .read(questionRepositoryProvider)
          .getQuestionsPage(pageNumber);

      final isLastPage = newItems.length < QuestionRepository.pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
