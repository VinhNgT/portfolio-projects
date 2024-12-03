import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/constants/drift_constants.dart';
import 'package:e_commerce/features/cart/data/cart_repository.dart';
import 'package:e_commerce/features/cart/data/drift_tables/cart_item_table.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/typedefs.dart';
import 'package:rxdart/rxdart.dart';

class DriftCartRepository implements CartRepository {
  DriftCartRepository(this.db);
  final AppDatabase db;

  @override
  Future<void> addCartItem(CartItem item) async {
    final existingOrderItemUuid =
        await db.orderItemTableDao.getExistingOrderItemId(
      item.orderItem.variantSelection.values.map((e) => e!).toList(),
    );

    if (existingOrderItemUuid != null) {
      await db.orderItemTableDao.addOrderItemQuantity(
        existingOrderItemUuid,
        item.orderItem.quantity,
      );

      return;
    }

    await db.transaction(() async {
      await db.productTableDao
          .addProductFromOrderItem(item.orderItem, replaceOld: true);

      final orderItemDbData = await db
          .into(db.orderItemTable)
          .insertReturning(item.orderItem.toDbCompanion());

      await db.orderItemVariantSelectionTableDao.addOrderItemVariantSelection(
        orderItemDbData.id,
        item.orderItem.variantSelection,
      );

      await db.into(db.cartItemTable).insert(
            item.toDbCompanion(orderItemId: orderItemDbData.id, cartId: 1000),
          );
    });
  }

  @override
  Future<void> removeCartItem(DatabaseKey itemId) async {
    await db.orderItemTableDao.removeOrderItem(itemId);
  }

  @override
  Future<void> updateCartItem(CartItem item) async {
    await db.transaction(() async {
      await removeCartItem(item.id!);
      await addCartItem(item);
    });
  }

  @override
  Future<void> setItemOrderInclusionState(CartItem item, bool isSelected) {
    return db.cartItemTableDao.setItemOrderInclusionState(item, isSelected);
  }

  @override
  Future<void> setItemQuantity(CartItem item, int quantity) {
    return db.orderItemTableDao.setOrderItemQuantity(item.id!, quantity);
  }

  @override
  Future<void> updateItemVariantSelection(
    CartItem item,
    ProductVariantIdsSelection variantSelection,
  ) async {
    await db.orderItemVariantSelectionTableDao.removeOrderItemVariantSelection(
      item.id!,
    );

    await db.orderItemVariantSelectionTableDao.addOrderItemVariantSelection(
      item.id!,
      variantSelection,
    );
  }

  @override
  Stream<Cart> watchCart() async* {
    final eventStream = MergeStream([
      db.cartItemTableDao.watchCartItems(),
      db.orderItemTableDao.watchOrderItems(),
    ]).debounceTime(driftStreamDebounceDuration);

    await for (final _ in eventStream) {
      try {
        final cartItemData = await db.cartItemTableDao.getCartItems();

        yield Cart(
          id: 1000,
          cartItems: await Future.wait(
            cartItemData.map((e) => CartItem.fromDbData(db, e)),
          ),
        );
      } catch (e, st) {
        yield* Stream.error(e, st);
      }
    }
  }
}
