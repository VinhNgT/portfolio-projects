import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/ui/container_badge.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/cart/data/interface/cart_repository.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:e_commerce/utils/list_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class CartItemWidget extends HookConsumerWidget {
  const CartItemWidget({super.key, required this.cartItem});
  final CartItem cartItem;

  final double imageSize = 80;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card.outlined(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kSize_12),
        side: BorderSide(color: context.colorScheme.outlineVariant),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            value: cartItem.isChecked,
            onChanged: (value) {
              ref.read(cartRepositoryProvider).updateCartItem(
                    cartItem.copyWith(isChecked: value),
                  );
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
                        imageUrl: cartItem.product.thumbnail,
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
    final vndPriceFormat = cartItem.product.vndPriceFormatter;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem.product.title,
          style: context.textTheme.titleSmall,
        ),
        const Gap(kSize_6),
        ...<Widget>[
          //
          if (cartItem.selectedVariants.isNotEmpty)
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
              cartItem.product.vndDiscountedPrice * cartItem.quantity,
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

class _VariantChip extends StatelessWidget {
  const _VariantChip({required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: const Icon(Symbols.play_shapes),
      label: Text('Phân loại: ${_buildVariantText(cartItem)}'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kSize_8),
        side: BorderSide(color: context.colorScheme.outlineVariant),
      ),
      padding: const EdgeInsets.only(
        left: kSize_8,
        right: kSize_16,
        top: kSize_6,
        bottom: kSize_6,
      ),
      labelPadding: const EdgeInsets.only(left: kSize_8),
      labelStyle: context.textTheme.labelMedium,
      onPressed: () {},
    );
  }

  String _buildVariantText(CartItem cartItem) {
    final variantTexts =
        cartItem.selectedVariants.map((variant) => variant.name);
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
              ref.read(cartRepositoryProvider).removeCartItem(cartItem.id);
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
    final vndPriceFormat = cartItem.product.vndPriceFormatter;

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
              'Phí VC: ${vndPriceFormat.format(13000 * cartItem.quantity)}',
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
    final count = useState(cartItem.quantity);

    return Row(
      children: [
        IconButton.filledTonal(
          constraints: BoxConstraints.tight(const Size.square(kSize_36)),
          onPressed: () {
            if (count.value > minQuantity) {
              count.value--;

              ref
                  .read(cartRepositoryProvider)
                  .updateCartItem(cartItem.copyWith(quantity: count.value));
            }
          },
          icon: const Icon(Symbols.remove),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSize_4),
          child: Text(
            '${count.value}',
            style: context.textTheme.labelLarge,
          ),
        ),
        IconButton.filledTonal(
          constraints: BoxConstraints.tight(const Size.square(kSize_36)),
          onPressed: () {
            if (count.value < maxQuantity) {
              count.value++;

              ref
                  .read(cartRepositoryProvider)
                  .updateCartItem(cartItem.copyWith(quantity: count.value));
            }
          },
          icon: const Icon(Symbols.add),
        ),
      ],
    );
  }
}
