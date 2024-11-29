import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/theme/theme_utils.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SellerCard extends StatelessWidget {
  const SellerCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.all(
          Radius.circular(ThemeUtils.getCardBorderRadius(context)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kSize_12,
          horizontal: kSize_12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SellerInfo(product),
            const SizedBox(height: kSize_12),
            const _ContactButtons(),
          ],
        ),
      ),
    );
  }
}

class _SellerInfo extends StatelessWidget {
  const _SellerInfo(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.theme.colorScheme.tertiaryContainer,
          ),
          height: kSize_56,
          width: kSize_56,
        ),
        const Gap(kSize_16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.brand ?? 'Shopey Mall',
              style: context.textTheme.titleMedium,
            ),
            const Gap(kSize_2),
            const Gap(kSize_2),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.rating.toString(),
                  style: context.theme.textTheme.labelMedium,
                ),
                const Gap(kSize_2),
                const Icon(
                  Icons.star,
                  size: kSize_16,
                  fill: 1,
                ),
                const Gap(kSize_4),
                Text(
                  '(${product.reviews.length} lượt đánh giá)',
                  style: context.theme.textTheme.bodySmall!.copyWith(
                    color: context.theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const Gap(kSize_2),
            const Gap(kSize_2),
            Transform.translate(
              offset: const Offset(-3, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: kSize_16,
                    fill: 1,
                  ),
                  const Gap(kSize_4),
                  Text(
                    'T.P. Hồ Chí Minh',
                    style: context.theme.textTheme.bodySmall!.copyWith(
                      color: context.theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ContactButtons extends StatelessWidget {
  const _ContactButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.store_outlined),
            label: const Text('Vào shop'),
          ),
        ),
        const Gap(kSize_8),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.chat_outlined),
            label: const Text('Liên hệ'),
          ),
        ),
      ],
    );
  }
}
