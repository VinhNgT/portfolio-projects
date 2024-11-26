import 'package:flutter/material.dart';

class BoldSelectedNavigationBarTextStyle
    extends WidgetStateProperty<TextStyle?> {
  BoldSelectedNavigationBarTextStyle(this.theme);

  final ThemeData theme;

  @override
  TextStyle? resolve(Set<WidgetState> states) {
    final defaultResolved =
        theme.navigationBarTheme.labelTextStyle?.resolve(states);

    if (states.contains(WidgetState.selected)) {
      return defaultResolved?.copyWith(fontWeight: FontWeight.w500);
    }

    return defaultResolved;
  }
}
