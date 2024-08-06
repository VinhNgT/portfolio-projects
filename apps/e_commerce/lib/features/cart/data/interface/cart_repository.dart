import 'package:e_commerce/backend/database/realm/realm_provider.dart';
import 'package:e_commerce/features/cart/data/realm_cart_repository.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repository.g.dart';

abstract interface class CartRepository {
  /// Add a [CartItem] to the cart.
  Future<void> addCartItem(CartItem item);

  /// Remove a [CartItem] from the cart.
  Future<void> removeCartItem(Uuid itemId);

  /// Update the order inclusion state of a [CartItem] in the cart.
  Future<void> setItemOrderInclusionState(CartItem item, bool isSelected);

  /// Update the selected variants of a [CartItem] in the cart.
  Future<void> updateItemVariant(CartItem item, ProductVariant variant);

  /// Update the quantity of a [CartItem] in the cart.
  Future<void> setItemQuantity(CartItem item, int quantity);

  /// Watch the cart.
  Stream<Cart> watchCart();
}

@Riverpod(keepAlive: true)
CartRepository cartRepository(CartRepositoryRef ref) {
  final realm = ref.watch(realmProvider).requireValue;
  return RealmCartRepository.makeDefault(realm);
}
