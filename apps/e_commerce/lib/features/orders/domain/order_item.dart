import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:realm/realm.dart';

part 'order_item.mapper.dart';
part 'order_item.realm.dart';

@MappableClass()
class OrderItem with OrderItemMappable {
  final Uuid id;
  final Product product;
  final List<ProductVariant> selectedVariants;
  final int quantity;

  OrderItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.selectedVariants,
  }) {
    if (quantity <= 0) {
      throw ArgumentError('Quantity must be greater than 0');
    }

    // For every group that the product has...
    for (final group in product.variantsGroup) {
      // Check if none of the selected variants are in this group.
      if (selectedVariants.none(group.variants.contains)) {
        throw ArgumentError(
          'The group ${group.groupName} is not selected',
        );
      }
    }
  }

  OrderItem.create({
    required Product product,
    required int quantity,
    List<ProductVariant> selectedVariants = const [],
  }) : this(
          id: Uuid.v4(),
          product: product,
          quantity: quantity,
          selectedVariants: selectedVariants,
        );

  factory OrderItem.fromRealmObj(OrderItemRealm obj) =>
      OrderItemRealmConverter.fromRealmObj(obj);

  static final prototype = _Proto.prototype;
}

extension OrderItemGetters on OrderItem {
  double get price => product.vndDiscountedPrice.toDouble() * quantity;
  double get shippingFee => 13000.0 * quantity;
}

extension OrderItemMethods on OrderItem {
  /// Returns true if [other] has the same product and selected variants.
  bool hasSameContent(OrderItem other) {
    return product.id == other.product.id &&
        ListEquality<ProductVariant>(EqualityBy((variant) => variant.id))
            .equals(selectedVariants, other.selectedVariants);
  }
}

extension _Proto on OrderItem {
  static final prototype = OrderItem(
    id: Uuid.fromString('7988a4d0-e32b-412f-8a02-b5dbcc730f06'),
    product: Product.prototype,
    quantity: 1,
    selectedVariants: [
      Product.prototype.variantsGroup[0].variants[0],
      Product.prototype.variantsGroup[1].variants[0],
    ],
  );
}

@realm
class $OrderItemRealm {
  @PrimaryKey()
  late Uuid id;

  late $ProductRealm? product;
  late List<$ProductVariantRealm> selectedVariants;
  late int quantity;
}

extension OrderItemRealmConverter on OrderItem {
  static OrderItem fromRealmObj(OrderItemRealm obj) {
    return OrderItem(
      id: obj.id,
      product: Product.fromRealmObj(obj.product!),
      selectedVariants:
          obj.selectedVariants.map(ProductVariant.fromRealmObj).toList(),
      quantity: obj.quantity,
    );
  }

  OrderItemRealm toRealmObj(Realm realm) {
    final productRealm =
        realm.find<ProductRealm>(product.id) ?? product.toRealmObj(realm);

    final selectedVariantsRealm = selectedVariants.map((e) {
      final existingVariant = productRealm.variantGroups
          .expand((element) => element.variants)
          .firstWhereOrNull((element) => element.id == e.id);

      return existingVariant ?? e.toRealmObj();
    });

    return OrderItemRealm(
      id: id,
      product: productRealm,
      selectedVariants: selectedVariantsRealm,
      quantity: quantity,
    );
  }
}
