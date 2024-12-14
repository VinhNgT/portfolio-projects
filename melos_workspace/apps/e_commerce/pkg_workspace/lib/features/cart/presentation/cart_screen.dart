import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common/async/async_value_widget.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/cart/application/cart_providers.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/cart/presentation/components/cart_item_card.dart';
import 'package:e_commerce/features/mocking/service/mock_data_service.dart';
import 'package:e_commerce/features/orders/presentation/components/order_total_action_bar.dart';
import 'package:e_commerce/routing/app_router_provider.gr.dart';
import 'package:e_commerce/utils/list_utils.dart';
import 'package:e_commerce/utils/riverpod_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemIds = ref.watch(
      cartProvider.selectAsyncMap(
        (cart) => EqualityList.from(cart.cartItems.map((e) => e.id!)),
      ),
    );

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
          IconButton(
            onPressed: () {
              final mockDataService = ref.read(mockDataServiceProvider);
              unawaited(mockDataService.fillCart());
            },
            icon: const Icon(Symbols.more_vert),
          ),
        ],
      ),
      body: AsyncValueWidget(
        asyncValue: cartItemIds,
        builder: (itemIds) => ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: kSize_16,
            vertical: kSize_16,
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const Gap(kSize_16),
          itemCount: itemIds.length,
          itemBuilder: (context, index) {
            return _CartItemCartProviderListIndex(
              key: ValueKey(itemIds[index]),
              index: index,
            );
          },
        ),
      ),
      bottomNavigationBar: _ActionBar(),
    );
  }
}

class _CartItemCartProviderListIndex extends HookConsumerWidget {
  const _CartItemCartProviderListIndex({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItem = ref
        .watch(
          cartProvider
              .selectAsyncMap((cart) => cart.cartItems.elementAtOrNull(index)),
        )
        .requireValue!;

    return CartItemCard(cartItem: cartItem);
  }
}

class _ActionBar extends HookConsumerWidget {
  const _ActionBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartOrderAsync = ref.watch(
      cartProvider.selectAsyncMap(
        (cart) => cart.createOrder(
          receiveAddress:
              'Nhà abc, Phố Hoàng Dậu, Phường Tân Mai, Thị xã Quảng Yên, '
              'Tỉnh Quảng Ninh',
        ),
      ),
    );

    return AsyncValueWidget(
      asyncValue: cartOrderAsync,
      builder: (order) {
        return OrderTotalActionBar(
          order: order,
          actionButtonIcon: const Icon(Symbols.shopping_cart_checkout),
          actionButtonLabel: 'Đặt hàng',
          onActionButtonPressed: () {
            context.pushRoute(
              CheckoutRoute(order: order),
            );
          },
        );
      },
    );
  }
}
