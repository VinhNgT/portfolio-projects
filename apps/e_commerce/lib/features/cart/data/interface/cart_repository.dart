import 'package:e_commerce/backend/database/realm/realm_provider.dart';
import 'package:e_commerce/features/cart/data/realm_cart_repository.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repository.g.dart';

abstract interface class CartRepository {
  /// Add an [CartItem] to the cart.
  Future<void> addCartItem(CartItem item);

  /// Remove an [CartItem] from the cart.
  Future<void> removeCartItem(Uuid itemId);

  /// Update an [CartItem] in the cart.
  Future<void> setItemSelection(CartItem item, bool isSelected);

  Future<void> setItemQuantity(CartItem item, int quantity);

  /// Add an [CartItem] to the cart or merges it with an existing one that has
  /// the same product and variants.
  // Future<void> addOrMergeWithDuplicateCartItem(CartItem item);

  /// Purge all duplicate [CartItem]s in the cart (items that have the same
  /// product and variants).
  // Future<void> purgeDuplicateCartItems();

  /// Watch an [CartItem] in the cart.
  // Stream<OrderItem> watchCartItem(Uuid itemId);

  /// Watch the cart.
  Stream<Cart> watchCart();
}

@Riverpod(keepAlive: true)
CartRepository cartRepository(CartRepositoryRef ref) {
  final realm = ref.watch(realmProvider).requireValue;
  return RealmCartRepository.makeDefault(realm);
}
