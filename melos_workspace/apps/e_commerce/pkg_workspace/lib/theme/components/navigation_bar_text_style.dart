import 'package:flutter/material.dart';

class NavigationBarTextStyle extends WidgetStateProperty<TextStyle?> {
  NavigationBarTextStyle({
    required this.selectedTextStyle,
    required this.unselectedTextStyle,
  });

  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;

  @override
  TextStyle? resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return selectedTextStyle;
    }
    return unselectedTextStyle;
  }
}
