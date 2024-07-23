import 'package:e_commerce/features/cart/data/interface/cart_repository.dart';
import 'package:e_commerce/features/orders/domain/order.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:realm/realm.dart';

class RealmCartRepository implements CartRepository {
  RealmCartRepository(this.realm);
  final Realm realm;

  @override
  Future<void> addCartItem(OrderItem cartItem) async {
    realm.write(() => realm.add(cartItem.toRealmObj(realm)));
  }

  @override
  Future<void> removeCartItem(Uuid cartId) async {
    final cartItemRealm = realm.find<OrderItemRealm>(cartId);
    if (cartItemRealm == null) {
      throw ArgumentError('Cart item with id $cartId not found');
    }

    realm.write(() => realm.delete(cartItemRealm));
  }

  @override
  Future<void> updateCartItem(OrderItem cartItem) async {
    final cartItemRealm = realm.find<OrderItemRealm>(cartItem.id);
    if (cartItemRealm == null) {
      throw ArgumentError('Cart item with id ${cartItem.id} not found');
    }

    realm.write(() => realm.add(cartItem.toRealmObj(realm), update: true));
  }

  @override
  Future<void> addOrMergeWithDuplicateCartItem(OrderItem cartItem) async {
    final cartItemRealm = cartItem.toRealmObj(realm);
    final duplicateOrderItemRealm =
        _findDuplicateCartItems(cartItemRealm).firstOrNull;

    realm.write(() {
      if (duplicateOrderItemRealm == null) {
        realm.add(cartItemRealm);
      } else {
        realm.add(
          OrderItem.fromRealmObj(duplicateOrderItemRealm)
              .mergeWith(cartItem)
              .toRealmObj(realm),
          update: true,
        );
      }
    });
  }

  @override
  Future<void> purgeDuplicateCartItems() async {
    final cartItemsListRealm = realm.all<OrderItemRealm>();
    final Set<OrderItemRealm> itemsToDelete = {};

    for (final cartItem in cartItemsListRealm) {
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
  Stream<OrderItem> watchCartItem(Uuid cartId) {
    final cartItemRealm = realm.find<OrderItemRealm>(cartId);
    if (cartItemRealm == null) {
      throw ArgumentError('Cart item with id $cartId not found');
    }

    return cartItemRealm.changes
        .map((event) => OrderItem.fromRealmObj(event.object));
  }

  @override
  Stream<List<OrderItem>> watchCartItems() {
    final cartItemsListRealm = realm.all<OrderItemRealm>();
    return cartItemsListRealm.changes
        .map((event) => event.results.map(OrderItem.fromRealmObj).toList());
  }

  @override
  Stream<Order> watchCartOrder() {
    final orderCartItemsRealm = realm.query<OrderItemRealm>('isChecked = true');

    return orderCartItemsRealm.changes.map((event) {
      final items = event.results.map(OrderItem.fromRealmObj).toList();
      return Order(items: items);
    });
  }
}

extension _HelperRealmCartRepository on RealmCartRepository {
  RealmResults<OrderItemRealm> _findDuplicateCartItems(
      OrderItemRealm cartItem) {
    final duplicateItem = realm.query<OrderItemRealm>('''

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
