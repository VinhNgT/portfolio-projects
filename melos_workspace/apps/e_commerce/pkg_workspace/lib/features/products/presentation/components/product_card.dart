import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/constants/golden_ratios.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/presentation/components/rating_stars.dart';
import 'package:e_commerce/routing/app_router_provider.gr.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.isCompact = false,
  });

  final Product product;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kSize_12),
        side: BorderSide(color: context.colorScheme.outlineVariant),
      ),
      child: InkWell(
        onTap: () {
          context.navigateTo(ProductDetailsRoute(productId: product.id));
        },
        child: isCompact
            ? _ProductCardCompactColumn(product: product)
            : _ProductCardColumn(product: product),
      ),
    );
  }
}

class _ProductCardColumn extends HookConsumerWidget {
  const _ProductCardColumn({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vndPriceFormat = useRef(product.vndPriceFormatter);

    return LayoutBuilder(
      builder: (context, constraints) => IntrinsicHeight(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: CachedNetworkImage(
                imageUrl: product.thumbnail,
                height: constraints.maxWidth,
                width: constraints.maxWidth,
              ),
            ),
            const Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(kSize_8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Title
                    Text(
                      product.title,
                      style: context.textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                    const Gap(kSize_4),

                    // Pricing
                    Text(
                      vndPriceFormat.value.format(product.vndDiscountedPrice),
                      style: context.textTheme.titleMedium!.copyWith(
                        color: context.theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      vndPriceFormat.value.format(product.vndPrice),
                      style: context.textTheme.labelMedium!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: context.theme.colorScheme.onSurfaceVariant
                            .withOpacity(kGoldenRatioDivide_1),
                      ),
                    ),
                    const Gap(kSize_6),

                    // Rating
                    RatingStars(rating: product.rating),
                    const Gap(kSize_8),

                    // Location
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Symbols.location_on,
                              size: 16,
                              color: context.theme.colorScheme.onSurfaceVariant
                                  .withOpacity(kGoldenRatioDivide_1),
                            ),
                            const Gap(kSize_2),
                            Text(
                              'Quảng Ninh',
                              style: context.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCardCompactColumn extends HookConsumerWidget {
  const _ProductCardCompactColumn({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vndPriceFormat = useRef(product.vndPriceFormatter);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        LayoutBuilder(
          builder: (context, constraints) => Container(
            color: Colors.white,
            child: CachedNetworkImage(
              imageUrl: product.thumbnail,
              height: constraints.maxWidth,
              width: constraints.maxWidth,
            ),
          ),
        ),
        const Divider(),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(kSize_8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Pricing
                Text(
                  vndPriceFormat.value.format(product.vndPrice),
                  style: context.textTheme.labelMedium!.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: context.theme.colorScheme.onSurfaceVariant
                        .withOpacity(kGoldenRatioDivide_1),
                  ),
                ),
                Text(
                  vndPriceFormat.value.format(product.vndDiscountedPrice),
                  style: context.textTheme.titleMedium!
                      .copyWith(color: context.theme.colorScheme.primary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
