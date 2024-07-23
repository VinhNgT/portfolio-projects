import 'package:e_commerce/backend/database/realm/realm_provider.dart';
import 'package:e_commerce/features/cart/data/realm_cart_repository.dart';
import 'package:e_commerce/features/orders/domain/order.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repository.g.dart';

abstract interface class CartRepository {
  /// Add a [OrderItem] to the cart.
  Future<void> addCartItem(OrderItem cartItem);

  /// Remove a [OrderItem] from the cart.
  Future<void> removeCartItem(Uuid cartId);

  /// Update a [OrderItem] in the cart.
  Future<void> updateCartItem(OrderItem cartItem);

  /// Add a [OrderItem] to the cart or merges it with an existing one that has
  /// the same product and variants.
  Future<void> addOrMergeWithDuplicateCartItem(OrderItem cartItem);

  /// Purge all duplicate [OrderItem]s in the cart (items that have the same
  /// product and variants).
  Future<void> purgeDuplicateCartItems();

  /// Watch a [OrderItem] in the cart.
  Stream<OrderItem> watchCartItem(Uuid cartId);

  /// Watch all [OrderItem]s in the cart.
  Stream<List<OrderItem>> watchCartItems();

  /// Watch the order information of the cart.
  Stream<Order> watchCartOrder();
}

@riverpod
CartRepository cartRepository(CartRepositoryRef ref) {
  final realm = ref.watch(realmProvider).requireValue;
  return RealmCartRepository(realm);
}
