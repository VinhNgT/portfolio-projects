import 'package:auto_route/auto_route.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_list.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class QuestionBottomSheet extends HookConsumerWidget {
  final int questionCount;
  final void Function(int index)? onQuestionCardPressed;

  const QuestionBottomSheet({
    super.key,
    required this.questionCount,
    this.onQuestionCardPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _TitleBar(questionCount: questionCount),
        Expanded(
          child: Scrollbar(
            child: QuestionList(
              initialCurrentPageIndex: ref.read(currentPageIndexProvider),
              onQuestionCardPressed: onQuestionCardPressed,
            ),
          ),
        ),
      ],
    );
  }
}

class _TitleBar extends StatelessWidget {
  final int questionCount;
  const _TitleBar({required this.questionCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: kSize_8),
              child: _Handle(),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kSize_12,
                  horizontal: kSize_16,
                ),
                child: _Title(questionCount: questionCount),
              ),
            ),
            const Divider(height: 0),
          ],
        ),
        const Positioned(
          top: 12,
          right: 4,
          child: _CloseButton(),
        ),
      ],
    );
  }
}

class _Handle extends StatelessWidget {
  const _Handle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 4,
      decoration: BoxDecoration(
        color: context.materialScheme.outline,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final int questionCount;
  const _Title({required this.questionCount});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaler: MediaQuery.of(context).textScaler,
      text: TextSpan(
        style: context.defaultTextStyle,
        children: [
          TextSpan(
            text: 'Khái niệm và quy tắc',
            style: context.textTheme.titleMedium,
          ),
          const WidgetSpan(
            child: SizedBox(width: kSize_8),
          ),
          TextSpan(
            text: questionCount.toString(),
            style: context.textTheme.bodyLarge!.copyWith(
              color: context.materialScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Symbols.close,
        color: context.materialScheme.onSurfaceVariant,
      ),
      onPressed: () async => context.popRoute(),
    );
  }
}
