import 'package:e_commerce/features/cart/data/interface/cart_repository.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';

class RealmCartRepository implements CartRepository {
  RealmCartRepository(this.realm, {required this.cartRealm});

  final Realm realm;
  final CartRealm cartRealm;

  @factory
  static RealmCartRepository makeDefault(Realm realm) {
    final cart = realm.all<CartRealm>().firstOrNull ?? _createNewCart(realm);
    return RealmCartRepository(realm, cartRealm: cart);
  }

  static CartRealm _createNewCart(Realm realm) {
    final newCart = Cart.create().toRealmObj(realm);
    realm.write(() {
      // There should be only one cart in the database since this is a local
      // cart.
      realm.deleteAll<CartRealm>();
      realm.add(newCart);
    });

    return newCart;
  }

  @override
  Future<void> addCartItem(CartItem item) async {
    final mutatedCart =
        Cart.fromRealmObj(cartRealm).addItem(item).toRealmObj(realm);

    realm.write(() => realm.add<CartRealm>(mutatedCart, update: true));
  }

  @override
  Future<void> removeCartItem(Uuid itemId) async {
    final mutatedCart =
        Cart.fromRealmObj(cartRealm).removeItem(itemId).toRealmObj(realm);

    final cartItemToRemove = realm.find<CartItemRealm>(itemId);
    final orderItemToRemove =
        realm.find<OrderItemRealm>(cartItemToRemove?.orderItem?.id);

    realm.write(() {
      if (cartItemToRemove != null) {
        realm.delete(cartItemToRemove);
      }
      if (orderItemToRemove != null) {
        realm.delete(orderItemToRemove);
      }

      realm.add<CartRealm>(mutatedCart, update: true);
    });
  }

  @override
  Future<void> updateCartItem(CartItem item) async {
    final mutatedCart =
        Cart.fromRealmObj(cartRealm).updateItem(item).toRealmObj(realm);

    realm.write(() => realm.add<CartRealm>(mutatedCart, update: true));
  }

  @override
  Future<void> setItemOrderInclusionState(
    CartItem item,
    bool isIncludeInOrder,
  ) async {
    final mutatedCart = Cart.fromRealmObj(cartRealm)
        .setItemOrderInclusionState(item.orderItem.id, isIncludeInOrder)
        .toRealmObj(realm);

    realm.write(() => realm.add<CartRealm>(mutatedCart, update: true));
  }

  @override
  Future<void> updateItemVariantSelection(
    CartItem item,
    VariantSelection variantSelection,
  ) async {
    final mutatedCart = Cart.fromRealmObj(cartRealm)
        .updateItemVariantSelection(item.orderItem.id, variantSelection)
        .toRealmObj(realm);

    realm.write(() => realm.add<CartRealm>(mutatedCart, update: true));
  }

  @override
  Future<void> setItemQuantity(CartItem item, int quantity) async {
    final mutatedCart = Cart.fromRealmObj(cartRealm)
        .setItemQuantity(item.orderItem.id, quantity)
        .toRealmObj(realm);

    realm.write(() => realm.add<CartRealm>(mutatedCart, update: true));
  }

  @override
  Stream<Cart> watchCart() {
    return cartRealm.changes.map((event) {
      final obj = Cart.fromRealmObj(event.object);
      return obj;
    });
  }
}
