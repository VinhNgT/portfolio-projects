import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/presentation/components/rating_stars.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
            product.title!,
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
    final vndPriceFormatter = useRef(product.vndPriceFormatter);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(kSize_6),
        const _FlashSale(),
        const Gap(kSize_2),
        Text(
          vndPriceFormatter.value.format(product.vndDiscountedPrice),
          style: context.theme.textTheme.titleLarge,
        ),
        const Gap(kSize_2),
        Text(
          vndPriceFormatter.value.format(product.vndPrice),
          style: context.theme.textTheme.bodyMedium!.copyWith(
            decoration: TextDecoration.lineThrough,
            color: context.theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _FlashSale extends StatelessWidget {
  const _FlashSale();

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
          style: context.theme.textTheme.labelSmall!
              .copyWith(color: context.theme.colorScheme.onPrimaryContainer),
        ),
      ),
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
          rating: product.rating!,
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
