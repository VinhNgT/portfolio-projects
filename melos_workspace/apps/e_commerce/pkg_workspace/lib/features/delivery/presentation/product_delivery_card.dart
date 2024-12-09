import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:e_commerce/utils/pricing_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductDeliveryCard extends HookConsumerWidget {
  const ProductDeliveryCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vndPrice = useMemoized(
      () => PricingUtils.vndPriceFormatter.format(product.mockShippingFee),
    );

    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.only(
          left: kSize_16,
          right: kSize_4,
          top: kSize_12,
          bottom: kSize_12,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phí vận chuyển: '
                    '$vndPrice',
                    style: context.textTheme.titleSmall,
                  ),
                  const Gap(kSize_2),
                  Text(
                    'Giảm đ25.000 cho đơn hàng từ đ99.000',
                    style: context.textTheme.bodyMedium,
                  ),
                  const Text(
                    'Nhận hàng sau 3 - 5 ngày (26/12 - 28/12)',
                  ),
                ],
              ),
            ),
            const Gap(kSize_8),
            const SizedBox.square(
              dimension: kSize_48,
              child: Icon(
                Icons.arrow_forward_ios,
                size: kSize_24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
