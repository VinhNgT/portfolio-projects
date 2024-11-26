import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/theme/components/navigation_bar_text_style.dart';
import 'package:flutter/material.dart';

/// Modifies an existing [ThemeData] to create a custom fine tuned theme.
class CustomAppTheme {
  CustomAppTheme(this.theme);
  final ThemeData theme;

  ThemeData create() {
    return theme.copyWith(
      dividerTheme: theme.dividerTheme.copyWith(
        space: 0,
      ),
      iconTheme: theme.iconTheme.copyWith(
        opticalSize: kSize_24,
      ),
      appBarTheme: theme.appBarTheme.copyWith(
        toolbarHeight: kSize_64,
      ),
      cardTheme: theme.cardTheme.copyWith(
        margin: EdgeInsets.zero,
      ),
      navigationBarTheme: theme.navigationBarTheme.copyWith(
        labelTextStyle: BoldSelectedNavigationBarTextStyle(theme),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
    );
  }
}
