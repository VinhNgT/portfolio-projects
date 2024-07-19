import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/cart/presentation/components/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: BackButton(
          onPressed: () => context.maybePop(),
        ),
        title: const Text('Giỏ hàng'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Symbols.bookmarks)),
          IconButton(onPressed: () {}, icon: const Icon(Symbols.flip_to_front)),
          IconButton(onPressed: () {}, icon: const Icon(Symbols.more_vert)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: kSize_16,
          vertical: kSize_16,
        ),
        children: [
          CartItemWidget(
            cartItem: CartItem.prototype,
          ),
        ],
      ),
    );
  }
}
