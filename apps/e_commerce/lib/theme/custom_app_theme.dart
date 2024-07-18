import 'package:e_commerce/constants/app_sizes.dart';
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
        height: kSize_64,
        elevation: 0,
        // labelTextStyle: NavigationBarTextStyle(
        //   selectedTextStyle: theme.textTheme.labelMedium!
        //       .copyWith(fontWeight: FontWeight.w600),
        //   unselectedTextStyle: theme.textTheme.labelMedium!,
        // ),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
    );
  }
}
