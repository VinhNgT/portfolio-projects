import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/ui/container_badge.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/cart/data/interface/cart_repository.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/routing/app_router_provider.gr.dart';
import 'package:e_commerce/theme/theme_utils.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:e_commerce/utils/list_extention.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class CartItemCard extends HookConsumerWidget {
  const CartItemCard({
    super.key,
    required this.cartItem,
    required this.isIncludeInOrder,
  });

  final CartItem cartItem;
  final bool isIncludeInOrder;

  final double imageSize = 80;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card.outlined(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.colorScheme.outlineVariant),
        borderRadius: BorderRadius.all(
          Radius.circular(ThemeUtils.getCardBorderRadius(context)),
        ),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            value: isIncludeInOrder,
            onChanged: (value) {
              ref
                  .read(cartRepositoryProvider)
                  .setItemOrderInclusionState(cartItem, value!);
            },
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: kSize_12,
                  bottom: kSize_8,
                  left: kSize_12,
                  right: kSize_48, // Checkbox size
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: kSize_4),
                      child: CachedNetworkImage(
                        imageUrl: cartItem.orderItem.product.thumbnail,
                        height: imageSize,
                        width: imageSize,
                      ),
                    ),
                    const Gap(kSize_12),
                    Expanded(child: _CartItemTopPart(cartItem: cartItem)),
                  ],
                ),
              ),
              const Divider(indent: kSize_12, endIndent: kSize_12),
              _CartItemBottomPart(cartItem: cartItem),
            ],
          ),
        ],
      ),
    );
  }
}

class _CartItemTopPart extends StatelessWidget {
  const _CartItemTopPart({required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final vndPriceFormat = cartItem.orderItem.product.vndPriceFormatter;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem.orderItem.product.title,
          style: context.textTheme.titleSmall,
        ),
        const Gap(kSize_6),
        ...<Widget>[
          //
          if (cartItem.orderItem.variantSelection.isNotEmpty)
            _VariantChip(cartItem: cartItem),

          //
          const Row(
            children: [
              ContainerBadge(labelText: 'Flashsale'),
              Gap(kSize_4),
              ContainerBadge(labelText: 'FreeshipXTRA'),
            ],
          ),

          //
          Text(
            vndPriceFormat.format(
              cartItem.orderItem.product.vndDiscountedPrice *
                  cartItem.orderItem.quantity,
            ),
            style: context.textTheme.titleMedium!.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ].separated(const Gap(kSize_8)),
      ],
    );
  }
}

class _VariantChip extends HookConsumerWidget {
  const _VariantChip({required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ActionChip(
      avatar: const Icon(Symbols.play_shapes),
      label: Text('Phân loại: ${_buildVariantText(cartItem)}'),
      onPressed: () {
        context.pushRoute(
          AddToCartRoute(
            initialCartItem: cartItem,
            onConfirm: (cartItem) async {
              await ref.read(cartRepositoryProvider).updateCartItem(cartItem);
              if (context.mounted) {
                // Pop the AddToCartSheet if it's still on the stack
                context.router.root.popUntil(
                  (route) => !ModalRoute.withName(AddToCartRoute.name)(route),
                );
              }
            },
          ),
        );
      },
    );
  }

  String _buildVariantText(CartItem cartItem) {
    final variantTexts =
        cartItem.orderItem.productVariantSelection.map((e) => e.name).toList();
    return variantTexts.join('/');
  }
}

class _CartItemBottomPart extends HookConsumerWidget {
  const _CartItemBottomPart({required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kSize_4,
        bottom: kSize_4,
        left: kSize_4,
        // right: kSize_4,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _ShippingCost(cartItem: cartItem)),
          // const MaxGap(double.maxFinite),
          _CartItemQuantitySelection(cartItem: cartItem),
          // const Gap(kSize_4),
          IconButton(
            onPressed: () {
              ref.read(cartRepositoryProvider).removeCartItem(cartItem.id!);
            },
            icon: const Icon(Symbols.delete_outline),
          ),
        ],
      ),
    );
  }
}

class _ShippingCost extends StatelessWidget {
  const _ShippingCost({required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final vndPriceFormat = cartItem.orderItem.product.vndPriceFormatter;

    return Padding(
      padding: const EdgeInsets.only(
        top: kSize_10,
        bottom: kSize_10,
        left: kSize_12,
        right: kSize_16,
      ),
      child: Row(
        children: [
          Icon(
            Symbols.local_shipping,
            color: context.colorScheme.tertiary,
            size: 18,
          ),
          const Gap(kSize_8),
          Expanded(
            child: Text(
              'Phí VC: '
              '${vndPriceFormat.format(13000 * cartItem.orderItem.quantity)}',
              // vndPriceFormat.format(103000),
              style: context.textTheme.bodySmall!.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItemQuantitySelection extends HookConsumerWidget {
  const _CartItemQuantitySelection({required this.cartItem});
  final CartItem cartItem;

  final int minQuantity = 1;
  final int maxQuantity = 12;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final count = useState(cartItem.quantity);

    return Row(
      children: [
        IconButton.filledTonal(
          constraints: BoxConstraints.tight(const Size.square(kSize_36)),
          onPressed: () {
            if (cartItem.orderItem.quantity > minQuantity) {
              ref
                  .read(cartRepositoryProvider)
                  .setItemQuantity(cartItem, cartItem.orderItem.quantity - 1);
            }
          },
          icon: const Icon(Symbols.remove),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSize_4),
          child: Text(
            '${cartItem.orderItem.quantity}',
            style: context.textTheme.labelLarge,
          ),
        ),
        IconButton.filledTonal(
          constraints: BoxConstraints.tight(const Size.square(kSize_36)),
          onPressed: () {
            if (cartItem.orderItem.quantity < maxQuantity) {
              ref
                  .read(cartRepositoryProvider)
                  .setItemQuantity(cartItem, cartItem.orderItem.quantity + 1);
            }
          },
          icon: const Icon(Symbols.add),
        ),
      ],
    );
  }
}
