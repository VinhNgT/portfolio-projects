import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/features/bookmark/data/bookmarks_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/presentation/appbar_navbar/bookmark_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class BookmarkButton extends HookConsumerWidget {
  const BookmarkButton({super.key, required this.question});
  final Question question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBookmarked = ref.watch(isBookmarkedStreamProvider(question));

    return AsyncValueWidget(
      value: isBookmarked,
      builder: (isBookmarkedValue) {
        return isBookmarkedValue
            ? _BookmarkedIconButton(
                onPressed: () async {
                  await ref
                      .read(bookmarkButtonControllerProvider.notifier)
                      .unbookmarkQuestion(question);
                },
              )
            : _NotbookmarkedIconButton(
                onPressed: () async {
                  await ref
                      .read(bookmarkButtonControllerProvider.notifier)
                      .bookmarkQuestion(question);
                },
              );
      },
    );
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
