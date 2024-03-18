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
    final isBookmarked = useState(false);

    ref.listen(isCurrentQuestionBookmarkedStreamProvider, (previous, next) {
      next.whenData((value) => isBookmarked.value = value);
    });

    return isBookmarked.value
        ? _BookmarkedIconButton(
            onPressed: () => unBookmarkCurrentQuestion(ref),
          )
        : _NotbookmarkedIconButton(
            onPressed: () => bookmarkCurrentQuestion(ref),
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

class _BookmarkedIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const _BookmarkedIconButton({this.onPressed});

  // factory _BookmarkedIconButton.dummy() =>
  //     _BookmarkedIconButton(onPressed: () {});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Symbols.bookmark, fill: 1),
      onPressed: onPressed,
    );
  }
}

class _NotbookmarkedIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const _NotbookmarkedIconButton({this.onPressed});

  // factory _NotbookmarkedIconButton.dummy() =>
  //     _NotbookmarkedIconButton(onPressed: () {});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Symbols.bookmark),
      onPressed: onPressed,
    );
  }
}
