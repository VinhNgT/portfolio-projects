import 'package:driving_license/common_widgets/misc/ink_well_overlay_color.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    super.key,
    required this.surfaceColor,
    required this.onSurfaceColor,
    required this.child,
    this.onPressed,
  });

  final Color surfaceColor;
  final Color onSurfaceColor;
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: surfaceColor,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        overlayColor: InkWellBackgroundColor(onSurfaceColor),
        onTap: onPressed,
        child: child,
      ),
    );
  }
}
