import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:realm/realm.dart';

part 'cart_item.mapper.dart';
part 'cart_item.realm.dart';

@realm
class $CartItemRealm {
  @PrimaryKey()
  late Uuid id;

  late $ProductRealm? product;
  late List<$ProductVariantRealm> selectedVariants;
  late int quantity;
}

@MappableClass()
class CartItem with CartItemMappable {
  final Uuid id;
  final Product product;
  final List<ProductVariant> selectedVariants;
  final int quantity;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    this.selectedVariants = const [],
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

  CartItem.newId({
    required Product product,
    required List<ProductVariant> selectedVariants,
    required int quantity,
  }) : this(
          id: Uuid.v4(),
          product: product,
          quantity: quantity,
          selectedVariants: selectedVariants,
        );

  factory CartItem.fromRealmObj(CartItemRealm obj) {
    return CartItem(
      id: obj.id,
      product: Product.fromRealmObj(obj.product!),
      selectedVariants:
          obj.selectedVariants.map(ProductVariant.fromRealmObj).toList(),
      quantity: obj.quantity,
    );
  }

  CartItemRealm toRealmObj(Realm realm) {
    final productRealm =
        realm.find<ProductRealm>(product.id) ?? product.toRealmObj(realm);

    final selectedVariantsRealm = selectedVariants.map((e) {
      final existingVariant = productRealm.variantGroups
          .expand((element) => element.variants)
          .firstWhereOrNull((element) => element.id == e.id);

      return existingVariant ?? e.toRealmObj();
    });

    return CartItemRealm(
      id: id,
      product: productRealm,
      selectedVariants: selectedVariantsRealm,
      quantity: quantity,
    );
  }

  static final prototype = _Proto.prototype;
}

extension CartItemMutation on CartItem {
  // CartItem addQuantity(int quantity) {
  //   return copyWith(quantity: this.quantity + quantity);
  // }

  // CartItem removeQuantity(int quantity) {
  //   return copyWith(quantity: this.quantity - quantity);
  // }

  CartItem updateSelectedVariants(List<ProductVariant> selectedVariants) {
    return copyWith(selectedVariants: selectedVariants);
  }

  CartItem mergeWith(CartItem other) {
    return copyWith(
      quantity: quantity + other.quantity,
    );
  }
}

extension _Proto on CartItem {
  static final prototype = CartItem(
    id: Uuid.fromString('7988a4d0-e32b-412f-8a02-b5dbcc730f06'),
    product: Product.prototype,
    quantity: 1,
    selectedVariants: [
      Product.prototype.variantsGroup[0].variants[0],
      Product.prototype.variantsGroup[1].variants[0],
    ],
  );
}
