import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common/ui/container_badge.dart';
import 'package:e_commerce/common/ui/simple_bottom_sheet.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/features/products/presentation/components/product_details/flash_sale_widget.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:e_commerce/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

typedef AddToCartSheetCallback = void Function(CartItem item);

@RoutePage()
class AddToCartSheet extends HookConsumerWidget {
  const AddToCartSheet({
    super.key,
    this.product,
    this.initialCartItem,
    this.onConfirm,
  }) : assert(
          (product != null) != (initialCartItem != null),
          'Either product or initialCartItem must be provided, but not both',
        );

  /// The product to be added to the cart.
  final Product? product;

  /// The initial data of the cart.
  final CartItem? initialCartItem;

  /// The callback that will be called when the user confirms adding the
  /// product.
  final AddToCartSheetCallback? onConfirm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useRef(GlobalKey<FormBuilderState>()).value;

    return SimpleBottomSheet(
      child: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: kSize_4, bottom: kSize_20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _ProductOverview(
                product: product ?? initialCartItem!.orderItem.product,
              ),
              const Gap(kSize_16),
              _VariationGroups(
                product: product ?? initialCartItem!.orderItem.product,
                initialVariants:
                    initialCartItem?.orderItem.variantSelection ?? {},
              ),
              const Gap(kSize_16),
              _QuantitySelectionContainer(
                initialQuantity: initialCartItem?.orderItem.quantity,
              ),
              const Divider(height: kSize_32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kSize_16),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Symbols.check_circle_outline),
                    label: const Text('Xác nhận'),
                    onPressed: () {
                      if (!(formKey.currentState?.saveAndValidate() ?? false)) {
                        return;
                      }

                      final selectedVariant = formKey.currentState
                          ?.value['variant'] as Map<String, ProductVariantId?>;

                      final cartItem = CartItem.create(
                        orderItem: OrderItem(
                          id: initialCartItem?.orderItem.id,
                          product:
                              product ?? initialCartItem!.orderItem.product,
                          quantity: formKey.currentState?.value['quantity'],
                          variantSelection: {
                            for (final entry in selectedVariant.entries)
                              if (entry.value != null)
                                int.parse(entry.key): entry.value,
                          },
                        ),
                      );

                      onConfirm?.call(cartItem);
                    },
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

class _ProductOverview extends HookConsumerWidget {
  const _ProductOverview({required this.product});

  final Product product;
  final double _imageSize = 140;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vndPriceFormatter = useRef(product.vndPriceFormatter).value;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSize_16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: _imageSize,
            height: _imageSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSize_8),
              color: context.colorScheme.tertiaryContainer,
            ),
          ),
          const Gap(kSize_16),
          Padding(
            padding: const EdgeInsets.only(bottom: kSize_12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const FlashSaleWidget(),
                const Gap(kSize_6),
                Text(
                  vndPriceFormatter.format(product.vndDiscountedPrice),
                  style: context.textTheme.headlineSmall,
                ),
                const Gap(kSize_2),
                Text(
                  vndPriceFormatter.format(product.vndPrice),
                  style: context.textTheme.bodyMedium!.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VariationGroups extends HookConsumerWidget {
  const _VariationGroups({
    required this.product,
    required this.initialVariants,
  });

  final Product product;
  final ProductVariantIdsSelection initialVariants;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final variationFormKey = useRef(GlobalKey<FormBuilderState>()).value;

    return FormBuilderField(
      name: 'variant',
      initialValue: <String, ProductVariantId?>{
        for (final group in product.variantGroups)
          group.id!.toString(): initialVariants[group.id],
      },
      validator: (value) {
        if (value!.values.any((selectedVariant) => selectedVariant == null)) {
          return 'Vui lòng chọn phân loại';
        }
        return null;
      },
      builder: (field) => FormBuilder(
        key: variationFormKey,
        onChanged: () => field.didChange(
          variationFormKey.currentState?.instantValue
              .cast<String, ProductVariantId?>(),
        ),
        child: Column(
          children: [
            const Divider(),
            Stack(
              children: [
                AnimatedSwitcher(
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  duration: Durations.short4,
                  transitionBuilder: (child, animation) {
                    return SizeTransition(
                      axisAlignment: 1,
                      sizeFactor: animation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                  child: field.errorText != null
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: kSize_6,
                              right: kSize_12,
                            ),
                            child: Text(
                              field.errorText!,
                              style: context.textTheme.labelLarge!.copyWith(
                                color: context.colorScheme.error,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Gap(kSize_20),
                  padding: const EdgeInsets.only(
                    top: kSize_12,
                    bottom: kSize_16,
                    left: kSize_16,
                    right: kSize_16,
                  ),
                  itemCount: product.variantGroups.length,
                  itemBuilder: (context, index) {
                    return _VariationSelection(
                      group: product.variantGroups[index],
                      initialVariantId:
                          initialVariants[product.variantGroups[index].id],
                    );
                  },
                ),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class _VariationSelection extends HookConsumerWidget {
  const _VariationSelection({
    required this.group,
    this.initialVariantId,
  });

  final ProductVariantGroup group;
  final DatabaseKey? initialVariantId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Kích thước 1',
          style: context.textTheme.titleMedium,
        ),
        const Gap(kSize_8),
        FormBuilderChoiceChip<DatabaseKey?>(
          name: group.id.toString(),
          initialValue: initialVariantId,
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            isCollapsed: true,
          ),
          spacing: kSize_8,
          runSpacing: kSize_8,
          options: List.generate(group.variants.length, (index) {
            final variant = group.variants[index];

            return FormBuilderChipOption(
              value: variant.id,
              child: Text(variant.name),
            );
          }),
        ),
      ],
    );
  }
}

class _QuantitySelectionContainer extends HookConsumerWidget {
  const _QuantitySelectionContainer({this.initialQuantity});
  final int? initialQuantity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSize_16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: kSize_4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chọn số lượng',
                      style: context.textTheme.titleMedium,
                    ),
                    const Gap(kSize_4),
                    ContainerBadge(
                      labelText: 'Giảm giá 5% khi mua 2 chiếc trở lên',
                      containerColor:
                          context.colorScheme.surfaceContainerHighest,
                      onContainerColor: context.colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
              const Gap(kSize_6),
              _QuantitySelectionButtons(
                initialQuantity: initialQuantity,
              ),
            ],
          ),
          // const Gap(kSize_8),
          // IconButton(
          //   style: IconButton.styleFrom(
          //     backgroundColor: context.colorScheme.surface,
          //     foregroundColor: context.colorScheme.onSurface,
          //   ),
          //   onPressed: () {},
          //   icon: const Icon(Symbols.keyboard),
          // ),
        ],
      ),
    );
  }
}

class _QuantitySelectionButtons extends HookConsumerWidget {
  const _QuantitySelectionButtons({required this.initialQuantity});

  final int minQuantity = 1;
  final int maxQuantity = 12;
  final int? initialQuantity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evaluatedInitialQuantity = useRef(initialQuantity ?? 1).value;
    final count = useState(evaluatedInitialQuantity);

    return FormBuilderField<int>(
      name: 'quantity',
      initialValue: evaluatedInitialQuantity,
      builder: (field) => Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: context.colorScheme.primaryContainer,
              foregroundColor: context.colorScheme.onPrimaryContainer,
            ),
            onPressed: () {
              if (count.value > minQuantity) {
                count.value--;
                field.didChange(count.value);
              }
            },
            icon: const Icon(Symbols.remove),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSize_4),
            child: Text(
              '${count.value} chiếc',
              style: context.textTheme.labelLarge,
            ),
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: context.colorScheme.primaryContainer,
              foregroundColor: context.colorScheme.onPrimaryContainer,
            ),
            onPressed: () {
              if (count.value < maxQuantity) {
                count.value++;
                field.didChange(count.value);
              }
            },
            icon: const Icon(Symbols.add),
          ),
          const Gap(kSize_12),
          Text('Tối đa $maxQuantity'),
        ],
      ),
    );
  }
}
