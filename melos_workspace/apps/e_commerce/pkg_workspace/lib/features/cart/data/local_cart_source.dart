import 'package:e_commerce/backend/database/drift_database_provider.dart';
import 'package:e_commerce/features/cart/data/cart_source.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/typedefs.dart';

class LocalCartSource implements CartSource {
  LocalCartSource(this.db, this.cartId);
  final DriftLocalDatabase db;

  static Future<LocalCartSource> makeDefault(
    DriftLocalDatabase db,
    DatabaseKey cartId,
  ) async {
    final cartExists = await db.cartTableDao.checkCartExists(cartId: cartId);
    if (!cartExists) {
      await db.cartTableDao.addCart(cart: Cart(id: cartId, cartItems: []));
    }

    return LocalCartSource(db, cartId);
  }

  @override
  final DatabaseKey cartId;

  @override
  Future<void> addCartItem(CartItem item) async {
    await db.transaction(() async {
      final existingCartItem =
          await db.cartItemTableDao.getCartItemFromVariantSelection(
        variantSelection: item.orderItem.variantSelection,
      );

      if (existingCartItem != null) {
        final newItem = existingCartItem.mergeWith(item);

        await db.orderItemTableDao.setOrderItemQuantity(
          newItem.id!,
          newItem.orderItem.quantity,
        );

        return;
      }

      final isProductExist = await db.productTableDao
          .checkProductExists(productId: item.orderItem.product.id!);

      if (!isProductExist) {
        await db.productTableDao.addProduct(product: item.orderItem.product);
      }

      await db.cartItemTableDao.addCartItem(cartId: cartId, cartItem: item);
    });
  }

  @override
  Future<void> addAllCartItems(Iterable<CartItem> items) async {
    await db.transaction(() async {
      for (final item in items) {
        await addCartItem(item);
      }
    });
  }

  @override
  Future<void> removeCartItem(CartItem item) async {
    await db.transaction(() async {
      await db.orderItemTableDao.removeOrderItem(item.id!);

      final isProductExist = await db.productTableDao
          .checkIfProductIsInCart(item.orderItem.product.id!, cartId);

      if (!isProductExist) {
        await db.productTableDao.removeProduct(item.orderItem.product.id!);
      }
    });
  }

  @override
  Future<void> clearCart() async {
    await db.transaction(() async {
      await db.cartItemTableDao.clearAllItemInCart(cartId: cartId);
    });
  }

  @override
  Future<void> replaceCartItem(CartItem item) async {
    await db.transaction(() async {
      await removeCartItem(item);
      await addCartItem(item);
    });
  }

  @override
  Future<void> setItemOrderInclusionState(
    DatabaseKey cartItemId,
    bool isSelected,
  ) {
    return db.cartItemTableDao
        .setItemOrderInclusionState(cartItemId, isSelected);
  }

  @override
  Future<void> setItemQuantity(DatabaseKey cartItemId, int quantity) {
    return db.orderItemTableDao.setOrderItemQuantity(cartItemId, quantity);
  }

  @override
  Future<void> updateItemVariantSelection(
    DatabaseKey cartItemId,
    ProductVariantIdsSelection variantSelection,
  ) async {
    return db.transaction(() async {
      await db.orderItemVariantSelectionTableDao
          .removeOrderItemVariantSelection(cartItemId);
      await db.orderItemVariantSelectionTableDao.addOrderItemVariantSelection(
        orderItemId: cartItemId,
        variantSelection: variantSelection,
      );
    });
  }

  @override
  Stream<Cart> watchCart() async* {
    final cartItemStream =
        db.cartItemTableDao.watchCartItemsAndChilds(cartId: cartId);

    await for (final cartItems in cartItemStream) {
      try {
        yield Cart(
          id: cartId,
          cartItems: cartItems,
        );
      } catch (e, st) {
        yield* Stream.error(e, st);
      }
    }
  }

  @override
  Future<int> getCartItemsCount() {
    return db.cartItemTableDao.getCartItemsCountInCart(cartId);
  }
}
