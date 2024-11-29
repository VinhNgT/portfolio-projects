import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common/widget_deadzone.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class SimpleBottomSheet extends StatelessWidget {
  const SimpleBottomSheet({
    super.key,
    required this.child,
    this.mainAxisSize = MainAxisSize.min,
  });

  final Widget child;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return WidgetDeadzone(
      deadzone: EdgeInsets.only(
        bottom: context.systemGestureInsets.bottom,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: mainAxisSize,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: kSize_8),
                child: _Handle(),
              ),
              Flexible(child: child),
            ],
          ),
          const Positioned(
            top: kSize_12,
            right: kSize_4,
            child: _CloseButton(),
          ),
        ],
      ),
    );
  }
}

class _Handle extends StatelessWidget {
  const _Handle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kSize_32,
      height: kSize_4,
      decoration: BoxDecoration(
        color: context.colorScheme.outline,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
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
        color: context.colorScheme.onSurfaceVariant,
      ),
      onPressed: () async => context.maybePop(),
    );
  }
}
