import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Color useAppBarScrolledUnderBackgroundColor(
  BuildContext context,
  ScrollController scrollController,
) {
  final appBarSurfaceColor = context.materialScheme.surface;
  final appBarScrolledUnderColor = context.materialScheme.surfaceContainerLow;

  return useListenableSelector(scrollController, () {
    /// If the scroll controller has not been attached to a scroll view yet,
    /// return the default color
    if (!scrollController.hasClients) {
      return appBarSurfaceColor;
    }

    final newColor = Color.lerp(
      appBarSurfaceColor,
      appBarScrolledUnderColor,
      (scrollController.offset / (context.appBarHeight / 4)).clamp(0, 1),
    )!;

    return newColor;
  });
}
