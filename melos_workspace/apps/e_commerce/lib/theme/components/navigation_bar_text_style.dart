import 'package:flutter/material.dart';

class NavigationBarTextStyle extends MaterialStateProperty<TextStyle?> {
  NavigationBarTextStyle({
    required this.selectedTextStyle,
    required this.unselectedTextStyle,
  });

  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;

  @override
  TextStyle? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return selectedTextStyle;
    }
    return unselectedTextStyle;
  }
}
