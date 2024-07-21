import 'package:e_commerce/features/cart/data/interface/cart_repository.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:realm/realm.dart';

class RealmCartRepository implements CartRepository {
  RealmCartRepository(this.realm);
  final Realm realm;

  @override
  Future<void> addCartItem(CartItem cartItem) async {
    realm.write(() => realm.add(cartItem.toRealmObj(realm)));
  }

  @override
  Future<void> removeCartItem(Uuid cartId) async {
    final realmCartItem = realm.find<CartItemRealm>(cartId);
    if (realmCartItem == null) {
      throw ArgumentError('Cart item with id $cartId not found');
    }

    realm.write(() => realm.delete(realmCartItem));
  }

  @override
  Future<void> updateCartItem(CartItem cartItem) async {
    final realmCartItem = realm.find<CartItemRealm>(cartItem.id);
    if (realmCartItem == null) {
      throw ArgumentError('Cart item with id ${cartItem.id} not found');
    }

    realm.write(() => realm.add(cartItem.toRealmObj(realm), update: true));
  }

  @override
  Future<void> addOrMergeWithDuplicateCartItem(CartItem cartItem) async {
    final realmCartItem = cartItem.toRealmObj(realm);
    final duplicateRealmCartItem =
        _findDuplicateCartItems(realmCartItem).firstOrNull;

    realm.write(() {
      if (duplicateRealmCartItem == null) {
        realm.add(realmCartItem);
      } else {
        realm.add(
          CartItem.fromRealmObj(duplicateRealmCartItem)
              .mergeWith(cartItem)
              .toRealmObj(realm),
          update: true,
        );
      }
    });
  }

  @override
  Future<void> purgeDuplicateCartItems() async {
    final realmCartItems = realm.all<CartItemRealm>();
    final Set<CartItemRealm> itemsToDelete = {};

    for (final cartItem in realmCartItems) {
      if (itemsToDelete.contains(cartItem)) {
        continue;
      }

      final duplicateCartItems = _findDuplicateCartItems(cartItem);
      itemsToDelete.addAll(
        duplicateCartItems
            .skipWhile((duplicateItem) => duplicateItem == cartItem),
      );
    }

    realm.write(() => realm.deleteMany(itemsToDelete));
  }

  @override
  Stream<CartItem> watchCartItem(Uuid cartId) {
    final realmCartItem = realm.find<CartItemRealm>(cartId);
    if (realmCartItem == null) {
      throw ArgumentError('Cart item with id $cartId not found');
    }

    return realmCartItem.changes
        .map((event) => CartItem.fromRealmObj(event.object));
  }

  @override
  Stream<Set<CartItem>> watchCartItems() {
    final realmCartItemsList = realm.all<CartItemRealm>();
    return realmCartItemsList.changes
        .map((event) => event.results.map(CartItem.fromRealmObj).toSet());
  }
}

extension _HelperRealmCartRepository on RealmCartRepository {
  RealmResults<CartItemRealm> _findDuplicateCartItems(CartItemRealm cartItem) {
    final duplicateItem = realm.query<CartItemRealm>('''

      product.id = \$0 AND 
      ALL \$1 IN selectedVariants[*].id AND
      selectedVariants.@count = ${cartItem.selectedVariants.length}

      ''', [
      cartItem.product!.id,
      cartItem.selectedVariants.map((element) => element.id),
    ]);

    return duplicateItem;
  }
}
