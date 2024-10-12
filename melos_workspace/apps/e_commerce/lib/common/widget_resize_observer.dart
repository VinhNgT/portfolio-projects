import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// A callback to be invoked when the size of the observed widget changes.
typedef ResizeCallback = void Function(Size oldSize, Size newSize);

/// A widget that calls a callback when the size of its [child] changes.
///
/// Copy from https://github.com/hacker1024/flutter_resize_observer.dart
class WidgetResizeObserver extends SingleChildRenderObjectWidget {
  const WidgetResizeObserver({
    super.key,
    required this.onResized,
    super.child,
  });

  /// The callback to be called when the size of [child] changes.
  final ResizeCallback onResized;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderResizeObserver(onLayoutChangedCallback: onResized);
}

class _RenderResizeObserver extends RenderProxyBox {
  _RenderResizeObserver({
    RenderBox? child,
    required this.onLayoutChangedCallback,
  }) : super(child);
  final ResizeCallback onLayoutChangedCallback;

  late var _oldSize = size;

  @override
  void performLayout() {
    super.performLayout();
    if (size != _oldSize) {
      onLayoutChangedCallback(_oldSize, size);
      _oldSize = size;
    }
  }
}
