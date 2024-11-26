import 'package:flutter/material.dart';

class ThemeUtils {
  /// Use this method to get the card border radius so you can build a custom
  /// shape for [Card.outlined].
  ///
  /// Currently in Flutter 3.24.5, all types of card widgets share the same
  /// [CardTheme]. This means if you change [CardTheme.shape], all cards will
  /// now be forced to have the same [CardTheme.shape], which is not always what
  /// you want in the case of [Card.outlined].
  ///
  /// You need to build a custom shape for [Card.outlined] every time you use it
  /// in the widget tree:
  ///
  /// ```dart
  /// Card.outlined(
  ///   shape: RoundedRectangleBorder(
  ///     side: BorderSide(color: context.colorScheme.outlineVariant),
  ///     borderRadius: BorderRadius.all(
  ///       Radius.circular(ThemeUtils.getCardBorderRadius(context))),
  ///   ),
  /// ),
  /// ```
  ///
  /// For more information, see the note by rydmike at
  /// https://github.com/rydmike/flex_color_scheme/blob/8.0.1/example/lib/shared/widgets/universal/showcase_material.dart#L5776
  ///
  static double getCardBorderRadius(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;

    // Default starting point value based on M3,  M2 mode spec values.
    double borderRadius = useMaterial3 ? 12 : 4;
    // Is themed? Try to get the radius from the theme,  used that if it was.
    final ShapeBorder? cardShape = theme.cardTheme.shape;
    if (cardShape != null && cardShape is RoundedRectangleBorder) {
      final BorderRadius shape = cardShape.borderRadius as BorderRadius;
      borderRadius = shape.bottomLeft.x;
    }

    return borderRadius;
  }
}
