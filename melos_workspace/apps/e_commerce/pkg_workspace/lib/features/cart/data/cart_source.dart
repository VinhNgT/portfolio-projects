import 'package:e_commerce/backend/database/drift_database_provider.dart';
import 'package:e_commerce/features/cart/data/local_cart_source.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/typedefs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_source.g.dart';

const DatabaseKey localCartSourceId = 1000;
const DatabaseKey localWishlistCartSourceId = 1001;

const DatabaseKey remoteCartSourceId = 2000;
const DatabaseKey remoteWishlistCartSourceId = 2001;

abstract interface class CartSource {
  /// The of the cart id of this source.
  DatabaseKey get cartId;

  /// Add a [CartItem] to the cart.
  Future<void> addCartItem(CartItem cartItem);

  /// Remove a [CartItem] from the cart.
  Future<void> removeCartItem(CartItem cartItemId);

  /// Update a [CartItem] in the cart.
  Future<void> replaceCartItem(CartItem item);

  /// Update the order inclusion state of a [CartItem] in the cart.
  Future<void> setItemOrderInclusionState(
    DatabaseKey cartItemId,
    bool isSelected,
  );

  /// Update the selected variant of a [CartItem] in the cart.
  Future<void> updateItemVariantSelection(
    DatabaseKey cartItemId,
    ProductVariantIdsSelection variantSelection,
  );

  /// Update the quantity of a [CartItem] in the cart.
  Future<void> setItemQuantity(DatabaseKey cartItemId, int quantity);

  /// Watch the cart.
  Stream<Cart> watchCart();
}

@Riverpod(keepAlive: true)
FutureOr<CartSource> makeDefaultLocalCartSourceFuture(Ref ref) {
  final db = ref.watch(driftDefaultLocalDatabaseProvider);
  return LocalCartSource.makeDefault(db, localCartSourceId);
}

@Riverpod(keepAlive: true)
CartSource localCartSource(Ref ref) {
  return ref.watch(makeDefaultLocalCartSourceFutureProvider).requireValue;
}
