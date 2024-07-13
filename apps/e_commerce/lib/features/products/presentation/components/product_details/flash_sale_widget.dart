import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSize_4),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: kSize_2,
          horizontal: kSize_8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSize_20),
          color: context.theme.colorScheme.primaryContainer,
        ),
        child: Text(
          'Flash sale kết thúc sau 2 giờ',
          style: context.textTheme.labelSmall!
              .copyWith(color: context.colorScheme.onPrimaryContainer),
        ),
      ),
    );
  }
}
