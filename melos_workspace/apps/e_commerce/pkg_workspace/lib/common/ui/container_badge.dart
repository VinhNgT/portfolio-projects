import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/utils/context_extensions.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kSize_2,
        horizontal: kSize_8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSize_20),
        color: containerColor ?? context.theme.colorScheme.primaryContainer,
      ),
      child: Text(
        labelText,
        style: context.textTheme.labelSmall!.copyWith(
          color: onContainerColor ?? context.colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
