import 'package:driving_license/common_widgets/misc/ink_well_overlay_color.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    super.key,
    required this.surfaceColor,
    required this.onSurfaceColor,
    required this.child,
    this.onPressed,
    this.borderRadius,
  });

  final Color surfaceColor;
  final Color onSurfaceColor;
  final Widget child;
  final VoidCallback? onPressed;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: surfaceColor,
      clipBehavior: Clip.antiAlias,
      shape: borderRadius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            )
          : null,
      child: InkWell(
        overlayColor: InkWellBackgroundColor(onSurfaceColor),
        onTap: onPressed,
        child: child,
      ),
    );
  }
}
