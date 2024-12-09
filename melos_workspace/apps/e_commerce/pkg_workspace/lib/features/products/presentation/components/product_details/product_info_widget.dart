import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/presentation/components/product_details/flash_sale_widget.dart';
import 'package:e_commerce/features/products/presentation/components/rating_stars.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:e_commerce/utils/pricing_formatter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductInfoWidget extends HookConsumerWidget {
  const ProductInfoWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSize_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _Pricing(product),
          const Gap(kSize_10),
          _ReviewStarsAndSold(product),
        ],
      ),
    );
  }
}

class _Pricing extends HookConsumerWidget {
  const _Pricing(this.product);
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pricingFormatter = PricingUtils.vndPriceFormatter;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(kSize_6),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: kSize_4),
          child: FlashSaleWidget(),
        ),
        const Gap(kSize_2),
        Text(
          pricingFormatter.format(product.vndDiscountedPrice),
          style: context.theme.textTheme.titleLarge,
        ),
        const Gap(kSize_2),
        Text(
          pricingFormatter.format(product.vndPrice),
          style: context.theme.textTheme.bodyMedium!.copyWith(
            decoration: TextDecoration.lineThrough,
            color: context.theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _ReviewStarsAndSold extends StatelessWidget {
  const _ReviewStarsAndSold(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RatingStars(
          rating: product.rating,
          starSize: kSize_16 + 2,
          textStyle: context.textTheme.labelLarge,
        ),
        const Gap(kSize_16),
        Text(
          'Đã bán ${product.mockSoldCount}',
          style: context.theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
