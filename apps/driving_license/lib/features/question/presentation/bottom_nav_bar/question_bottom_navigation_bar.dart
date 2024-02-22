import 'package:driving_license/common_widgets/misc/ink_well_overlay_color.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/question/data/question_repository.dart';
import 'package:driving_license/features/question/presentation/question_screen.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

enum _IconPosition { left, right }

class QuestionBottomNavigationBar extends HookConsumerWidget {
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;
  final VoidCallback? onShowAllPressed;

  const QuestionBottomNavigationBar({
    super.key,
    this.onPreviousPressed,
    this.onNextPressed,
    this.onShowAllPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastQuestionIndex =
        ref.watch(questionRepositoryProvider).getQuestionCount() - 1;

    final previousButtonActive = ref.watch(
      currentPageIndexProvider
          .select((currentPageIndex) => currentPageIndex > 0),
    );
    final nextButtonActive = ref.watch(
      currentPageIndexProvider
          .select((currentPageIndex) => currentPageIndex < lastQuestionIndex),
    );

    return Row(
      children: [
        Flexible(
          flex: 1,
          child: _PreviousQuestion(
            onPressed: previousButtonActive ? onPreviousPressed : null,
          ),
        ),
        _ShowAllQuestion(
          onPressed: onShowAllPressed,
        ),
        Flexible(
          flex: 1,
          child: _NextQuestion(
            onPressed: nextButtonActive ? onNextPressed : null,
          ),
        ),
      ],
    );
  }
}

class _QuestionNavBarButton extends StatelessWidget {
  final Icon icon;
  final Widget label;
  final _IconPosition iconPosition;
  final MainAxisAlignment mainAxisAlignment;
  final VoidCallback? onPressed;

  const _QuestionNavBarButton({
    required this.icon,
    required this.label,
    this.iconPosition = _IconPosition.left,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final content = [icon, kGap_8, label];

    return InkWell(
      overlayColor: InkWellBackgroundColor(context.materialScheme.onSurface),
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(
          left: (iconPosition == _IconPosition.left) ? kSize_12 : kSize_16,
          right: (iconPosition == _IconPosition.left) ? kSize_16 : kSize_12,
          top: kSize_10,
          bottom: kSize_10,
        ),
        child: Opacity(
          // Lower the opacity when button is disabled (when onPressed == null)
          opacity: onPressed != null ? 1.0 : 0.38,
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: iconPosition == _IconPosition.left
                ? content
                : content.reversed.toList(),
          ),
        ),
      ),
    );
  }
}

class _PreviousQuestion extends StatelessWidget {
  final VoidCallback? onPressed;

  const _PreviousQuestion({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: _QuestionNavBarButton(
        icon: Icon(
          Symbols.arrow_back_ios_new,
          size: kSize_20,
          color: context.materialScheme.onSurface,
        ),
        label: Text('Trước', style: context.textTheme.titleMedium),
        iconPosition: _IconPosition.left,
        mainAxisAlignment: MainAxisAlignment.start,
        onPressed: onPressed,
      ),
    );
  }
}

class _NextQuestion extends StatelessWidget {
  final VoidCallback? onPressed;

  const _NextQuestion({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: _QuestionNavBarButton(
        icon: Icon(
          Symbols.arrow_forward_ios,
          size: kSize_20,
          color: context.materialScheme.onSurface,
        ),
        label: Text('Sau', style: context.textTheme.titleMedium),
        iconPosition: _IconPosition.right,
        mainAxisAlignment: MainAxisAlignment.end,
        onPressed: onPressed,
      ),
    );
  }
}

class _ShowAllQuestion extends StatelessWidget {
  final VoidCallback? onPressed;

  const _ShowAllQuestion({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: _QuestionNavBarButton(
        icon: Icon(
          Symbols.expand_all,
          size: kSize_24,
          color: context.materialScheme.onSurface,
        ),
        label: Text('Các câu hỏi', style: context.textTheme.titleMedium),
        iconPosition: _IconPosition.left,
        mainAxisAlignment: MainAxisAlignment.center,
        onPressed: onPressed,
      ),
    );
  }
}
