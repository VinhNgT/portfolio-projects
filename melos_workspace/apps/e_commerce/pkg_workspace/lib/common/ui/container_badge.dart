import 'package:e_commerce/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class ContainerBadge extends StatelessWidget {
  const ContainerBadge({
    super.key,
    required this.labelText,
    this.containerColor,
    this.onContainerColor,
  });

  final String labelText;
  final Color? containerColor;
  final Color? onContainerColor;

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Text(labelText),
      padding: const EdgeInsets.symmetric(
        vertical: kSize_2,
        horizontal: kSize_8,
      ),
      backgroundColor: containerColor,
      textColor: onContainerColor,
    );
  }
}
