import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/features/cart/data/drift_tables/cart_table.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/domain/order.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'cart.mapper.dart';

@MappableClass()
class Cart with CartMappable {
  final int? id;
  final List<CartItem> cartItems;

  const Cart({
    required this.id,
    required this.cartItems,
  });

  static const fromDb = CartTableDomainConverter.fromDbData;
}

extension CartGetters on Cart {
  bool isItemIncludeInOrder(CartItem cartItem) =>
      cartItems
          .firstWhereOrNull((e) => e.orderItem.id == cartItem.orderItem.id)
          ?.isIncludeInOrder ??
      false;

  Order get order => Order.create(
        items: cartItems
            .where((e) => e.isIncludeInOrder)
            .map((e) => e.orderItem)
            .toList(),
      );
}

extension CartMutation on Cart {
  /// If the item is already in the cart, merge it with the existing one,
  /// otherwise add it to the cart.
  Cart addItem(CartItem cartItem) {
    final duplicateItemListIndex = cartItems
        .indexWhere((e) => e.orderItem.hasSameContent(cartItem.orderItem));

    if (duplicateItemListIndex != -1) {
      return copyWith(
        cartItems: cartItems
          ..[duplicateItemListIndex] =
              cartItems[duplicateItemListIndex].mergeWith(cartItem),
      );
    }

    return copyWith(
      cartItems: cartItems..add(cartItem),
    );
  }

  /// Remove the item from the cart.
  Cart removeItem(DatabaseKey itemId) {
    return copyWith(
      cartItems: cartItems..removeWhere((e) => e.orderItem.id == itemId),
    );
  }

  /// Update the item in the cart.
  Cart updateItem(CartItem cartItem) {
    final itemListId =
        cartItems.indexWhere((e) => e.orderItem.id == cartItem.orderItem.id);
    if (itemListId == -1) {
      throw CartNoItemFoundError(cartItem.orderItem.id!);
    }

    return copyWith(
      cartItems: cartItems..[itemListId] = cartItem,
    );
  }

  /// Set the state of whether the item is included in the order.
  Cart setItemOrderInclusionState(DatabaseKey itemId, bool isIncludeInOrder) {
    final itemListId = cartItems.indexWhere((e) => e.orderItem.id == itemId);
    if (itemListId == -1) {
      throw CartNoItemFoundError(itemId);
    }

    return copyWith(
      cartItems: cartItems
        ..[itemListId] =
            cartItems[itemListId].copyWith(isIncludeInOrder: isIncludeInOrder),
    );
  }

  /// Set the quantity of the item.
  Cart setItemQuantity(DatabaseKey itemId, int quantity) {
    final itemListId = cartItems.indexWhere((e) => e.orderItem.id == itemId);
    if (itemListId == -1) {
      throw CartNoItemFoundError(itemId);
    }

    final targetCartItem = cartItems[itemListId];
    return copyWith(
      cartItems: cartItems
        ..[itemListId] = targetCartItem.copyWith(
          orderItem: targetCartItem.orderItem.copyWith(quantity: quantity),
        ),
    );
  }

  /// Update the selected variant of the item.
  Cart updateItemVariantSelection(
    DatabaseKey itemId,
    ProductVariantIdsSelection variantSelection,
  ) {
    final itemListId = cartItems.indexWhere((e) => e.orderItem.id == itemId);
    if (itemListId == -1) {
      throw CartNoItemFoundError(itemId);
    }

    final targetCartItem = cartItems[itemListId];
    return copyWith(
      cartItems: cartItems
        ..[itemListId] =
            targetCartItem.updateVariantSelection(variantSelection),
    );
  }

  /// Remove all but one item with the same content.
  Cart removeDuplicateItems() {
    final Set<CartItem> itemsToDelete = {};

    for (final item in cartItems) {
      if (itemsToDelete.contains(item)) {
        continue;
      }

      final duplicateCartItems =
          cartItems.skipWhile((e) => e.id == item.id).where(
                (e) =>
                    !itemsToDelete.contains(e) &&
                    e.orderItem.hasSameContent(item.orderItem),
              );

      itemsToDelete.addAll(duplicateCartItems);
    }

    return copyWith(
      cartItems: cartItems..removeWhere(itemsToDelete.contains),
    );
  }
}

class CartNoItemFoundError extends Error {
  final DatabaseKey itemId;
  CartNoItemFoundError(this.itemId);

  @override
  String toString() {
    return 'Item $itemId not found in cart';
  }
}
