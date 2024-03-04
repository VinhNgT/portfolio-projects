import 'package:driving_license/common_widgets/misc/ink_well_overlay_color.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/constants/opacity.dart';
import 'package:driving_license/constants/widget_sizes.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class QuestionBottomNavigationBar extends HookConsumerWidget {
  final int questionCount;
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;
  final VoidCallback? onShowAllPressed;

  const QuestionBottomNavigationBar({
    super.key,
    required this.questionCount,
    this.onPreviousPressed,
    this.onNextPressed,
    this.onShowAllPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final previousButtonActive = ref.watch(
      currentPageIndexProvider
          .select((currentPageIndex) => currentPageIndex > 0),
    );
    final nextButtonActive = ref.watch(
      currentPageIndexProvider
          .select((currentPageIndex) => currentPageIndex < questionCount - 1),
    );

    return BottomAppBar(
      height: kBottomAppBarHeight,
      padding: const EdgeInsets.all(kSize_0),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: _PreviousQuestion(
              onPressed: previousButtonActive ? onPreviousPressed : null,
            ),
          ),
          Flexible(
            flex: 3,
            child: _ShowAllQuestion(
              onPressed: onShowAllPressed,
            ),
          ),
          Flexible(
            flex: 2,
            child: _NextQuestion(
              onPressed: nextButtonActive ? onNextPressed : null,
            ),
          ),
        ],
      ),
    );
  }
}

enum _IconPosition { left, right }

class _QuestionNavBarButton extends StatelessWidget {
  final Icon? icon;
  final Widget label;
  final _IconPosition iconPosition;
  final MainAxisAlignment mainAxisAlignment;
  final VoidCallback? onPressed;

  const _QuestionNavBarButton({
    this.icon,
    required this.label,
    this.iconPosition = _IconPosition.left,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var content = [
      if (icon != null) ...[icon!, kGap_8],
      label,
    ];

    if (iconPosition == _IconPosition.right) {
      content = content.reversed.toList();
    }

    return InkWell(
      overlayColor: InkWellBackgroundColor(context.materialScheme.onSurface),
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(
          left: (iconPosition == _IconPosition.left && icon != null)
              ? kSize_12
              : kSize_16,
          right: (iconPosition == _IconPosition.right && icon != null)
              ? kSize_12
              : kSize_16,
          top: kSize_10,
          bottom: kSize_10,
        ),
        child: Opacity(
          // Lower the opacity when button is disabled (when onPressed == null)
          opacity: onPressed != null ? kOpacityFull : kOpacityDisabled,
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: content,
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
        label: Text('Tất cả câu hỏi', style: context.textTheme.titleMedium),
        mainAxisAlignment: MainAxisAlignment.center,
        onPressed: onPressed,
      ),
    );
  }
}
