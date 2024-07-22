import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common/async/async_value_widget.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/cart/application/cart_providers.dart';
import 'package:e_commerce/features/cart/presentation/components/cart_item_widget.dart';
import 'package:e_commerce/features/orders/domain/order.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:e_commerce/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vndPriceFormatter = Product.prototype.vndPriceFormatter;

    final cartItemsListAsync = ref.watch(cartItemsListProvider);
    final cartOrderAsync = ref.watch(cartOrderProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: BackButton(
          onPressed: () => context.maybePop(),
        ),
        title: const Text('Giỏ hàng'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Symbols.bookmarks)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Symbols.flip_to_front),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Symbols.more_vert)),
        ],
      ),
      body: AsyncValueWidget(
        asyncValue: cartItemsListAsync,
        builder: (cartItemsList) => ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: kSize_16,
            vertical: kSize_16,
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const Gap(kSize_16),
          itemCount: cartItemsList.length,
          itemBuilder: (context, index) {
            return CartItemWidget(
              key: ValueKey(cartItemsList[index].id),
              cartItem: cartItemsList[index],
            );
          },
        ),
      ),
      bottomNavigationBar: AsyncValueWidget(
        asyncValue: cartOrderAsync,
        builder: (cartOrder) => Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            boxShadow: UiUtils.reverseBoxShadow(kElevationToShadow[1]!),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kSize_16,
              vertical: kSize_12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vndPriceFormatter.format(cartOrder.itemsPrice),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Phí vận chuyển: '
                      '${vndPriceFormatter.format(cartOrder.shippingFee)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Symbols.shopping_cart_checkout),
                  label: const Text('Đặt hàng'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
