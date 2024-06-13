import 'dart:async';

import 'package:e_commerce/common/widget_resize_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef IntrinsicSizeBuilder = Widget Function(
  BuildContext context,
  Size prototypeSize,
  Widget prototype,
  Widget? child,
);

/// A widget that measures the size of another widget (referred to as the
/// prototype widget) by rendering the prototype off-screen using
/// the [Overlay] widget. This technique allows us to measure the size of the
/// prototype without actually displaying it on the screen.
///
/// While the prototype widget size is being determined, a SizedBox.shrink() is
/// put in place of the [builder] widget. Once the size has been determined,
/// then the [builder] will be called.
///
/// See also:
/// - StackOverflow post describing this technique by Rémi Rousselet:
///   https://stackoverflow.com/a/49650741
class IntrinsicSize extends HookConsumerWidget {
  const IntrinsicSize({
    super.key,
    required this.prototype,
    required this.builder,
    this.child,
  });

  /// The widget whose size will be measured.
  final Widget prototype;

  /// The builder that will be called when the prototype size is measured.
  final IntrinsicSizeBuilder builder;

  /// The subtree widget that does not depend on the prototype size.
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeNotifier = useState<Size?>(null);

    useEffect(
      () {
        final overlaysEntry = OverlayEntry(
          builder: (context) {
            return Align(
              child: Offstage(
                // Change this line to `offstage: false` to show the overlay for
                // debuging purpose.
                offstage: true,
                child: _ReportSizeWidget(
                  onSizeChangedNotifier: sizeNotifier,
                  child: prototype,
                ),
              ),
            );
          },
        );

        Future.microtask(() {
          Overlay.of(context).insert(overlaysEntry);
        });

        return overlaysEntry.remove;
      },
      [prototype],
    );

    return ValueListenableBuilder(
      valueListenable: sizeNotifier,
      builder: (context, value, child) {
        return value == null
            ? const SizedBox.shrink()
            : builder(context, value, prototype, child);
      },
      child: child,
    );
  }
}

class _ReportSizeWidget extends HookConsumerWidget {
  const _ReportSizeWidget({
    required this.onSizeChangedNotifier,
    required this.child,
  });

  final ValueNotifier<Size?> onSizeChangedNotifier;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useDidChangeMetricRebuild();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   onSizeChangedNotifier.value = context.size;
    // });

    Future.microtask(() => onSizeChangedNotifier.value = context.size);

    return WidgetResizeObserver(
      onResized: (oldSize, newSize) {
        Future.microtask(() => onSizeChangedNotifier.value = newSize);
      },
      child: child,
    );
  }
}
