import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/constants/widget_sizes.dart';
import 'package:driving_license/features/question/presentation/question/question_page.dart';
import 'package:driving_license/features/question/presentation/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class QuestionAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const QuestionAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = ref.watch(currentPageIndexProvider);
    final currentPageScrollController =
        ref.watch(questionPageScrollControllerProvider(currentPageIndex));

    return CommonAppBar(
      title: Text('Câu hỏi ${currentPageIndex + 1}'),
      actions: [
        IconButton(
          icon: const Icon(Symbols.bookmark),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Symbols.restart_alt),
          onPressed: () {},
        ),
      ],
      scaffoldBodyScrollController: currentPageScrollController,
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kAppBarHeight);
}
