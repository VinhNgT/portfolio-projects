import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/presentation/product_components/rating_stars.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ProductCard extends HookConsumerWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vndPriceFormat = useRef(
      NumberFormat.currency(
        locale: 'vi_VN',
        symbol: '₫',
        decimalDigits: 0,
        customPattern: '¤#,###',
      ),
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kSize_12),
        side: const BorderSide(
          width: 0.1,
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Image.network(product.thumbnail!),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(kSize_8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Title
                      Text(
                        product.title!,
                        style: context.textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                      const Gap(kSize_4),

                      // Pricing
                      Text(
                        vndPriceFormat.value.format(product.vndDiscountedPrice),
                        style: context.textTheme.titleMedium,
                      ),
                      Text(
                        vndPriceFormat.value.format(product.vndPrice),
                        style: context.textTheme.labelMedium!.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: context.theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const Gap(kSize_6),

                      // Rating
                      RatingStars(rating: product.rating!),
                      const Gap(kSize_8),

                      // Location
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Symbols.location_on,
                                size: 16,
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
      ),
    );
  }
}
