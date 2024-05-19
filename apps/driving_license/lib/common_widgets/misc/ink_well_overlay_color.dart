import 'package:flutter/material.dart';

class InkWellBackgroundColor implements WidgetStateProperty<Color?> {
  const InkWellBackgroundColor(this.onSurfaceColor);
  final Color onSurfaceColor;

  @override
  Color? resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      return onSurfaceColor.withOpacity(0.12);
    }
    if (states.contains(WidgetState.hovered)) {
      return onSurfaceColor.withOpacity(0.08);
    }
    if (states.contains(WidgetState.focused)) {
      return onSurfaceColor.withOpacity(0.12);
    }
    return null;
  }
}
