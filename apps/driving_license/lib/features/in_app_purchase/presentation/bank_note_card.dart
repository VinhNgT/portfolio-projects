import 'package:driving_license/backend/in_app_purchase/iap_entry.dart';
import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';

class BankNoteCard extends StatelessWidget {
  const BankNoteCard({super.key, required this.productEntry});
  final IapProductEntry productEntry;

  @override
  Widget build(BuildContext context) {
    return ButtonCard(
      surfaceColor: context.materialScheme.surfaceContainerHigh,
      onSurfaceColor: context.materialScheme.onSurface,
      borderRadius: kSize_16,
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kSize_20,
          vertical: kSize_16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '10.000đ',
                  style: context.textTheme.titleLarge,
                ),
                kGap_4,
                Text(
                  'Đóng góp kha khá',
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.materialScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            Image.asset(
              productEntry.imagePath,
              height: 65,
            ),
          ],
        ),
      ),
    );
  }
}
