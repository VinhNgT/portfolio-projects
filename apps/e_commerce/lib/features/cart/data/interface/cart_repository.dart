import 'package:e_commerce/backend/database/realm/realm_provider.dart';
import 'package:e_commerce/features/cart/data/realm_cart_repository.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repository.g.dart';

abstract interface class CartRepository {
  /// Add a [CartItem] to the cart.
  Future<void> addCartItem(CartItem cartItem);

  /// Remove a [CartItem] from the cart.
  Future<void> removeCartItem(Uuid cartId);

  /// Update a [CartItem] in the cart.
  Future<void> updateCartItem(CartItem cartItem);

  /// Add a [CartItem] to the cart or merges it with an existing one that has
  /// the same product and variants.
  Future<void> addOrMergeWithDuplicateCartItem(CartItem cartItem);

  /// Purge all duplicate [CartItem]s in the cart (items that have the same
  /// product and variants).
  Future<void> purgeDuplicateCartItems();

  /// Watch a [CartItem] in the cart.
  Stream<CartItem> watchCartItem(Uuid cartId);

  /// Watch all [CartItem]s in the cart.
  Stream<List<CartItem>> watchCartItems();
}

@riverpod
CartRepository cartRepository(CartRepositoryRef ref) {
  final realm = ref.watch(realmProvider).requireValue;
  return RealmCartRepository(realm);
}
