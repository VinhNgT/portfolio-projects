import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/cart/data/drift_cart_repository.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/typedefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repository.g.dart';

abstract interface class CartRepository {
  /// Add a [CartItem] to the cart.
  Future<void> addCartItem(CartItem item);

  /// Remove a [CartItem] from the cart.
  Future<void> removeCartItem(DatabaseKey itemId);

  /// Update a [CartItem] in the cart.
  Future<void> updateCartItem(CartItem item);

  /// Update the order inclusion state of a [CartItem] in the cart.
  Future<void> setItemOrderInclusionState(CartItem item, bool isSelected);

  /// Update the selected variant of a [CartItem] in the cart.
  Future<void> updateItemVariantSelection(
    CartItem item,
    ProductVariantIdsSelection variantSelection,
  );

  /// Update the quantity of a [CartItem] in the cart.
  Future<void> setItemQuantity(CartItem item, int quantity);

  /// Watch the cart.
  Stream<Cart> watchCart();
}

@Riverpod(keepAlive: true)
CartRepository cartRepository(CartRepositoryRef ref) {
  final db = ref.watch(driftProvider()).requireValue;
  return DriftCartRepository(db);
}
