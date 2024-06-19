import 'package:e_commerce/common/async/async_value_widget.dart';
import 'package:e_commerce/common/prototype_size.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/products/data/product_providers.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/presentation/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlashSaleList extends HookConsumerWidget {
  const FlashSaleList({super.key});

  static const _separatorWidth = 8.0;
  static const _itemCount = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(productsListFutureProvider(0));

    return PrototypeSize(
      prototype: ConstrainedBox(
        // Set product card width to 150
        constraints: const BoxConstraints.tightFor(width: 150),
        child: const ProductCard(
          product: Product.prototype,
          isCompact: true,
        ),
      ),
      builder: (context, prototypeSize, _, __) => AsyncValueWidget(
        asyncValue: productList,
        showLoadingIndicator: true,
        builder: (productListValue) => SizedBox(
          height: prototypeSize.height,
          child: ListView.custom(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.symmetric(horizontal: kSize_12),
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) {
                final int itemIndex = index ~/ 2;

                return index.isEven
                    ? ProductCard(
                        product: productListValue[itemIndex],
                        isCompact: true,
                      )
                    : const Gap(_separatorWidth);
              },
              // _itemCount items, _itemCount - 1 gaps in between
              childCount: _itemCount * 2 - 1,
            ),
            itemExtentBuilder: (index, dimensions) {
              return index.isEven ? prototypeSize.width : _separatorWidth;
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
