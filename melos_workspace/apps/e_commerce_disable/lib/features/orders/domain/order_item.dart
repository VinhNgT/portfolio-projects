import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:realm/realm.dart';

part 'order_item.mapper.dart';
part 'order_item.realm.dart';

@MappableClass()
class OrderItem with OrderItemMappable {
  /// The unique identifier of this order item.
  final Uuid id;

  /// The product that this order item represents.
  final Product product;

  /// The quantity of this order item.
  final int quantity;

  /// The map of the selected variant for each variant group.
  /// The key is the variant group's id.
  final VariantSelection variantSelection;

  OrderItem({
    required this.id,
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
          'The group ${group.groupName} does not have a selected variant',
        );
      }

      if (!group.variants.contains(groupSelectedVariant)) {
        throw ArgumentError.value(
          variantSelection,
          'variantSelection',
          'The selected variant ${groupSelectedVariant.name} is not in the '
              'group ${group.groupName}',
        );
      }
    }
  }

  OrderItem.create({
    Uuid? id,
    required Product product,
    int quantity = 1,
    VariantSelection variantSelection = const {},
  }) : this(
          id: id ?? Uuid.v4(),
          product: product,
          quantity: quantity,
          variantSelection: variantSelection,
        );

  factory OrderItem.fromRealmObj(OrderItemRealm obj) =>
      OrderItemRealmConverter.fromRealmObj(obj);

  static final prototype = _Proto.prototype;
}

extension OrderItemGetters on OrderItem {
  double get price => product.vndDiscountedPrice.toDouble() * quantity;
  double get shippingFee => 13000.0 * quantity;

  List<ProductVariant> get orderedVariantSelection => variantSelection.entries
      .sortedBy<num>(
        (selectedEntry) => product.variantGroups
            .indexWhere((group) => group.id == selectedEntry.key),
      )
      .map((e) => e.value)
      .whereNotNull()
      .toList();
}

extension OrderItemMethods on OrderItem {
  /// Returns true if [other] has the same product and selected variant.
  bool hasSameContent(OrderItem other) {
    return product.id == other.product.id &&
        MapEquality<Uuid, ProductVariant?>(
          values: EqualityBy((variant) => variant?.id),
        ).equals(variantSelection, other.variantSelection);
  }
}

extension _Proto on OrderItem {
  static final prototype = OrderItem(
    id: Uuid.fromString('7988a4d0-e32b-412f-8a02-b5dbcc730f06'),
    product: Product.prototype,
    quantity: 1,
    variantSelection: {
      for (final group in Product.prototype.variantGroups)
        group.id: group.variants.first,
    },
  );
}

@realm
class $OrderItemRealm {
  @PrimaryKey()
  late Uuid id;

  late $ProductRealm? product;
  late Map<String, $ProductVariantRealm?> variantSelection;
  late int quantity;
}

extension OrderItemRealmConverter on OrderItem {
  static OrderItem fromRealmObj(OrderItemRealm obj) {
    return OrderItem(
      id: obj.id,
      product: Product.fromRealmObj(obj.product!),
      variantSelection: obj.variantSelection.map(
        (uuidString, value) => MapEntry(
          Uuid.fromString(uuidString),
          ProductVariant.fromRealmObj(value!),
        ),
      ),
      quantity: obj.quantity,
    );
  }

  OrderItemRealm toRealmObj(Realm realm) {
    final productRealm =
        realm.find<ProductRealm>(product.id) ?? product.toRealmObj(realm);

    final variantSelectionRealm = {
      for (final group in productRealm.variantGroups)
        group.id.toString(): group.variants.firstWhere(
          (realmVariant) {
            final selectedVariantId = variantSelection[group.id]!.id;
            return realmVariant.id == selectedVariantId;
          },
        ),
    };

    return OrderItemRealm(
      id: id,
      product: productRealm,
      variantSelection: variantSelectionRealm,
      quantity: quantity,
    );
  }
}
