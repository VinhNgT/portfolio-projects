import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/domain/order.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:realm/realm.dart';

part 'cart.mapper.dart';
part 'cart.realm.dart';

@MappableClass()
class Cart with CartMappable {
  final Uuid id;
  final List<CartItem> cartItems;

  const Cart({
    required this.id,
    required this.cartItems,
  });

  Cart.create({
    this.cartItems = const [],
  }) : id = Uuid.v4();

  factory Cart.fromRealmObj(CartRealm obj) =>
      CartRealmConverter.fromRealmObj(obj);
}

extension CartGetters on Cart {
  bool isItemSelected(CartItem cartItem) =>
      cartItems
          .firstWhereOrNull((e) => e.orderItem.id == cartItem.orderItem.id)
          ?.isSelected ??
      false;

  Order get order => Order.create(
        // Filter the items that are selected.
        items: cartItems
            .where((e) => e.isSelected)
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
  Cart removeItem(Uuid itemId) {
    return copyWith(
      cartItems: cartItems..removeWhere((e) => e.orderItem.id == itemId),
    );
  }

  /// Set the selection of the item. If selected, it will be added to the order
  /// upon checkout.
  Cart setItemSelection(Uuid itemId, bool isSelected) {
    final itemListId = cartItems.indexWhere((e) => e.orderItem.id == itemId);
    if (itemListId == -1) {
      throw ArgumentError('Item $itemId not found');
    }

    return copyWith(
      cartItems: cartItems
        ..[itemListId] = cartItems[itemListId].copyWith(isSelected: isSelected),
    );
  }

  /// Set the quantity of the item.
  Cart setItemQuantity(Uuid itemId, int quantity) {
    final itemListId = cartItems.indexWhere((e) => e.orderItem.id == itemId);
    if (itemListId == -1) {
      throw ArgumentError('Item $itemId not found');
    }

    final targetCartItem = cartItems[itemListId];
    return copyWith(
      cartItems: cartItems
        ..[itemListId] = targetCartItem.copyWith(
          orderItem: targetCartItem.orderItem.copyWith(quantity: quantity),
        ),
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

@realm
class $CartRealm {
  @PrimaryKey()
  late Uuid id;
  late List<$CartItemRealm> cartItems;
}

extension CartRealmConverter on Cart {
  static Cart fromRealmObj(CartRealm obj) {
    return Cart(
      id: obj.id,
      cartItems: obj.cartItems.map(CartItem.fromRealmObj).toList(),
    );
  }

  CartRealm toRealmObj(Realm realm) {
    return CartRealm(
      id: id,
      cartItems: cartItems.map((e) => e.toRealmObj(realm)).toList(),
    );
  }
}
