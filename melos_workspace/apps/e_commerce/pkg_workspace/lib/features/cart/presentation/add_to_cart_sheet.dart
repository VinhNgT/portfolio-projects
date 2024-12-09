import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/common/ui/container_badge.dart';
import 'package:e_commerce/common/ui/simple_bottom_sheet.dart';
import 'package:e_commerce/constants/app_sizes.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/cart/domain/new_cart_item_form.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/features/products/presentation/components/product_details/flash_sale_widget.dart';
import 'package:e_commerce/utils/context_extensions.dart';
import 'package:e_commerce/utils/pricing_formatter.dart';
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

  /// Get the product for this cart item. If the product is provided, return it.
  /// Otherwise, return the product from the initial cart item.
  Product get _cartProduct => product ?? initialCartItem!.orderItem.product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useRef(GlobalKey<FormBuilderState>()).value;

    final initialInputForm = useRef(
      initialCartItem != null
          ? NewCartItemForm.fromCartItem(initialCartItem!)
          : NewCartItemForm.initial(product: product!),
    ).value;

    final inputForm = useValueNotifier(initialInputForm);

    return SimpleBottomSheet(
      child: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: kSize_4, bottom: kSize_20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _ProductOverview(product: _cartProduct),
              const Gap(kSize_16),
              _VariationGroups(
                variantGroups: _cartProduct.variantGroups,
                initialVariants: initialInputForm.variantSelection,
                onChanged: (variantSelection) {
                  inputForm.value = inputForm.value.copyWith(
                    variantSelection: variantSelection,
                  );
                },
              ),
              const Gap(kSize_16),
              _QuantitySelectionContainer(
                initialQuantity: initialCartItem?.orderItem.quantity,
                onChanged: (newQuantity) {
                  inputForm.value =
                      inputForm.value.copyWith(quantity: newQuantity);
                },
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

                      final cartItem = _buildCartItem(inputForm.value);
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

  CartItem _buildCartItem(NewCartItemForm inputForm) {
    return CartItem.create(
      orderItem: OrderItem(
        id: initialCartItem?.orderItem.id,
        product: _cartProduct,
        quantity: inputForm.quantity,
        variantSelection: inputForm.variantSelection,
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
    final pricingFormatter = PricingUtils.vndPriceFormatter;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSize_16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: _imageSize,
            height: _imageSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSize_12),
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
                  pricingFormatter.format(product.vndDiscountedPrice),
                  style: context.textTheme.headlineSmall,
                ),
                const Gap(kSize_2),
                Text(
                  pricingFormatter.format(product.vndPrice),
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
    required this.variantGroups,
    required this.initialVariants,
    this.onChanged,
  });

  final List<ProductVariantGroup> variantGroups;
  final ProductVariantIdsSelection initialVariants;
  final void Function(ProductVariantIdsSelection variantSelection)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final variantSelectionFormKey =
        useRef(GlobalKey<FormBuilderFieldState>()).value;

    final shouldShowError = useState(false);

    return FormBuilderField<ProductVariantIdsSelection>(
      key: variantSelectionFormKey,
      name: 'variantSelection',
      initialValue: initialVariants,
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        if (!shouldShowError.value) {
          return null;
        }

        if (variantGroups.any(
          (variant) => value![variant.id] == null,
        )) {
          return 'Vui lòng chọn phân loại';
        }
        return null;
      },
      onSaved: (_) => shouldShowError.value = true,
      onChanged: (value) {
        shouldShowError.value = false;
        onChanged?.call(value!);
      },
      builder: (field) => Column(
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
                separatorBuilder: (context, index) => const Gap(kSize_12),
                padding: const EdgeInsets.only(
                  top: kSize_12,
                  bottom: kSize_16,
                  left: kSize_16,
                  right: kSize_16,
                ),
                itemCount: variantGroups.length,
                itemBuilder: (context, index) {
                  return _VariationSelection(
                    group: variantGroups[index],
                    initialVariantId: initialVariants[variantGroups[index].id],
                    onChanged: (newValue) {
                      field.didChange({
                        ...field.value!,
                        variantGroups[index].id!: newValue,
                      });
                    },
                  );
                },
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class _VariationSelection extends HookConsumerWidget {
  const _VariationSelection({
    required this.group,
    this.initialVariantId,
    this.onChanged,
  });

  final ProductVariantGroup group;
  final DatabaseKey? initialVariantId;
  final void Function(DatabaseKey? newValue)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          group.groupName,
          style: context.textTheme.titleMedium,
        ),
        FormBuilderChoiceChip<DatabaseKey?>(
          name: group.id!.toString(),
          onChanged: (newValue) {
            onChanged?.call(newValue);
          },
          autovalidateMode: AutovalidateMode.always,
          initialValue: initialVariantId,
          decoration: const InputDecoration().applyDefaults(
            context.theme.inputDecorationTheme.copyWith(
              border: InputBorder.none,
            ),
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

class _QuantitySelectionContainer extends StatelessWidget {
  const _QuantitySelectionContainer({
    this.initialQuantity,
    this.onChanged,
  });

  final int? initialQuantity;
  final void Function(int newQuantity)? onChanged;

  @override
  Widget build(BuildContext context) {
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
                initialQuantity: initialQuantity ?? 1,
                onChanged: onChanged,
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

class _QuantitySelectionButtons extends HookWidget {
  const _QuantitySelectionButtons({
    required this.initialQuantity,
    this.onChanged,
  });

  final int initialQuantity;
  final void Function(int newQuantity)? onChanged;

  final int minQuantity = 1;
  final int maxQuantity = 12;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<int>(
      name: 'quantity',
      initialValue: initialQuantity,
      onChanged: (newValue) {
        onChanged?.call(newValue!);
      },
      builder: (field) => Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: context.colorScheme.primaryContainer,
              foregroundColor: context.colorScheme.onPrimaryContainer,
            ),
            onPressed: () {
              if (field.value! > minQuantity) {
                field.didChange(field.value! - 1);
              }
            },
            icon: const Icon(Symbols.remove),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSize_4),
            child: Text(
              '${field.value!} chiếc',
              style: context.textTheme.labelLarge,
            ),
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: context.colorScheme.primaryContainer,
              foregroundColor: context.colorScheme.onPrimaryContainer,
            ),
            onPressed: () {
              if (field.value! < maxQuantity) {
                field.didChange(field.value! + 1);
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
