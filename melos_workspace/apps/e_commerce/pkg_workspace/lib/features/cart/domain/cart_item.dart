import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/features/cart/data/drift_tables/cart_item_table.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'cart_item.mapper.dart';

@MappableClass()
class CartItem with CartItemMappable {
  /// The item that is added to the cart.
  final OrderItem orderItem;

  /// Whether the item is included in the order when the user checkouts the cart
  /// contains this item.
  final bool isIncludeInOrder;

  const CartItem({
    required this.orderItem,
    required this.isIncludeInOrder,
  });

  const CartItem.create({
    required this.orderItem,
    this.isIncludeInOrder = true,
  });

  static const fromDbData = CartItemTableDomainConverter.fromDbData;
}

extension CartItemGetters on CartItem {
  DatabaseKey? get id => orderItem.id;
  // Product get product => orderItem.product;
  // double get price => orderItem.price;
  // double get shippingFee => orderItem.shippingFee;
}

extension CartItemMutations on CartItem {
  CartItem updateVariantSelection(
    ProductVariantIdsSelection variantSelection,
  ) {
    return copyWith(
      orderItem: orderItem.copyWith(variantSelection: variantSelection),
    );
  }

  CartItem mergeWith(CartItem other) {
    return copyWith(
      orderItem: orderItem.copyWith(
        quantity: orderItem.quantity + other.orderItem.quantity,
      ),
    );
  }
}
