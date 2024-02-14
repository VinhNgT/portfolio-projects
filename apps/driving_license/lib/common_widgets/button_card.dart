import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    super.key,
    required this.surfaceColor,
    required this.onSurfaceColor,
    required this.child,
    this.onTap,
  });

  final Color surfaceColor;
  final Color onSurfaceColor;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: surfaceColor,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        overlayColor: ButtonCardBackgroundColor(onSurfaceColor),
        onTap: onTap,
        child: child,
      ),
    );
  }
}

class ButtonCardBackgroundColor implements MaterialStateProperty<Color?> {
  final Color onSurfaceColor;
  ButtonCardBackgroundColor(this.onSurfaceColor);

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
