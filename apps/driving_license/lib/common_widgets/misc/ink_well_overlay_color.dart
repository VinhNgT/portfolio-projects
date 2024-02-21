import 'package:flutter/material.dart';

class InkWellBackgroundColor implements MaterialStateProperty<Color?> {
  final Color onSurfaceColor;
  InkWellBackgroundColor(this.onSurfaceColor);

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
