import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/drift_database_provider.dart';
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';

part 'order_item.mapper.dart';

@MappableClass()
class OrderItem with OrderItemMappable {
  /// The unique identifier of this order item.
  final int? id;

  /// The product that this order item represents.
  final Product product;

  /// The quantity of this order item.
  final int quantity;

  /// The map of the selected variant for each variant group.
  /// The key is the variant group's id.
  final ProductVariantIdsSelection variantSelection;

  OrderItem({
    this.id,
    required this.product,
    required this.quantity,
    required this.variantSelection,
  }) {
    // Validate the quantity.
    if (quantity <= 0) {
      throw ArgumentError('Quantity must be greater than 0');
    }

    // Validate the selected variant.
    for (final group in product.variantGroups) {
      final groupSelectedVariant = variantSelection[group.id];

      if (groupSelectedVariant == null) {
        throw ArgumentError.value(
          variantSelection,
          'variantSelection',
          'No variant selected for group ${group.groupName}',
        );
      }

      if (!group.variants
          .any((variant) => variant.id == groupSelectedVariant)) {
        throw ArgumentError.value(
          variantSelection,
          'variantSelection',
          'The selected variant $groupSelectedVariant is not in the '
              'group ${group.groupName}',
        );
      }
    }
  }

  static Future<OrderItem> fromDbData(
    DriftLocalDatabase db,
    OrderItemTableData data,
  ) {
    return OrderItemTableDomainExtensionConverter.fromDbData(db, data);
  }

  static final prototype = _Proto.prototype;
}

extension OrderItemGetters on OrderItem {
  double get price => product.vndDiscountedPrice.toDouble() * quantity;
  double get shippingFee => 13000.0 * quantity;

  List<ProductVariant> get productVariantSelection => product.variantGroups
      .where((groupId) => variantSelection.containsKey(groupId.id))
      .map(
        (e) => e.variants
            .firstWhere((variant) => variant.id == variantSelection[e.id]),
      )
      .toList();
}

extension OrderItemMethods on OrderItem {
  /// Returns true if [other] has the same product and selected variant.
  bool hasSameContent(OrderItem other) {
    return product.id == other.product.id &&
        const MapEquality<ProductVariantGroupId, ProductVariantId?>()
            .equals(variantSelection, other.variantSelection);
  }
}

extension _Proto on OrderItem {
  static final prototype = OrderItem(
    id: 999,
    product: Product.prototype,
    quantity: 1,
    variantSelection: {
      for (final group in Product.prototype.variantGroups)
        group.id!: group.variants.first.id,
    },
  );
}
