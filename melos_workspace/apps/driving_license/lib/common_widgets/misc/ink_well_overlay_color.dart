import 'package:flutter/material.dart';

class InkWellBackgroundColor implements MaterialStateProperty<Color?> {
  const InkWellBackgroundColor(this.onSurfaceColor);
  final Color onSurfaceColor;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return onSurfaceColor.withOpacity(0.12);
    }
    if (states.contains(MaterialState.hovered)) {
      return onSurfaceColor.withOpacity(0.08);
    }
    if (states.contains(MaterialState.focused)) {
      return onSurfaceColor.withOpacity(0.12);
    }
    return null;
  }
}
