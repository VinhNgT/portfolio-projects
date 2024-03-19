import 'package:driving_license/features/questions/presentation/appbar_navbar/bookmark_button_controller.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class BookmarkButton extends HookConsumerWidget {
  const BookmarkButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    keepControllerAlive(ref);

    final currentIsBookmarkedState = useRef(false);
    final isBookmarked = ref.watch(
      isCurrentQuestionBookmarkedStreamProvider.select((value) {
        return value.map(
          data: (asyncData) {
            currentIsBookmarkedState.value = asyncData.value;
            return asyncData;
          },
          error: (asyncError) => asyncError,
          loading: (asyncLoading) => AsyncData(currentIsBookmarkedState.value),
        );
      }),
    ).requireValue;

    return IconButton(
      onPressed: isBookmarked
          ? () => unBookmarkCurrentQuestion(ref)
          : () => bookmarkCurrentQuestion(ref),
      icon: isBookmarked
          ? const Icon(Symbols.bookmark, fill: 1)
          : const Icon(Symbols.bookmark),
    );
  }
}

extension BookmarkButtonX on BookmarkButton {
  void keepControllerAlive(WidgetRef ref) {
    ref.listen(bookmarkButtonControllerProvider, (previous, next) {});
  }

  void unBookmarkCurrentQuestion(WidgetRef ref) async {
    final currentQuestion = await ref.read(currentQuestionProvider.future);

    await ref
        .read(bookmarkButtonControllerProvider.notifier)
        .unbookmarkQuestion(currentQuestion);
  }

  void bookmarkCurrentQuestion(WidgetRef ref) async {
    final currentQuestion = await ref.read(currentQuestionProvider.future);

    await ref
        .read(bookmarkButtonControllerProvider.notifier)
        .bookmarkQuestion(currentQuestion);
  }
}
