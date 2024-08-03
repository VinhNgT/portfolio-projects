import 'package:e_commerce/features/cart/data/interface/cart_repository.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
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
    final newCart = $CartRealm.createRealmObj(realm, Cart.create());
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
    final mutatedCart = $CartRealm.createRealmObj(
      realm,
      Cart.fromRealmObj(cartRealm).addItem(item),
    );

    realm.write(() => realm.add<CartRealm>(mutatedCart, update: true));
  }

  @override
  Future<void> removeCartItem(Uuid itemId) async {
    final mutatedCart = $CartRealm.createRealmObj(
      realm,
      Cart.fromRealmObj(cartRealm).removeItem(itemId),
    );

    realm.write(() => realm.add<CartRealm>(mutatedCart, update: true));
  }

  @override
  Future<void> setItemSelection(CartItem item, bool isSelected) async {
    final mutatedCart = $CartRealm.createRealmObj(
      realm,
      Cart.fromRealmObj(cartRealm)
          .setItemSelection(item.orderItem.id, isSelected),
    );

    realm.write(() => realm.add<CartRealm>(mutatedCart, update: true));
  }

  @override
  Future<void> setItemQuantity(CartItem item, int quantity) async {
    final mutatedCart = $CartRealm.createRealmObj(
      realm,
      Cart.fromRealmObj(cartRealm).setItemQuantity(item.orderItem.id, quantity),
    );

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
