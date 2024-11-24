import 'package:e_commerce/backend/database/drift/drift_provider.dart';
import 'package:e_commerce/constants/drift_cons.dart';
import 'package:e_commerce/features/cart/data/interface/cart_repository.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:realm/realm.dart';
import 'package:rxdart/rxdart.dart';

class DriftCartRepository implements CartRepository {
  DriftCartRepository(this.db);
  final AppDatabase db;

  @override
  Future<void> addCartItem(CartItem item) async {
    final existingOrderItemUuid =
        await db.orderItemTableDao.getExistingOrderItemId(
      item.orderItem.variantSelection.values.map((e) => e.toString()).toList(),
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

      await db.into(db.orderItemTable).insert(item.orderItem.toDbData());

      await db.orderItemVariantSelectionTableDao.addOrderItemVariantSelection(
        item.orderItem.id,
        item.orderItem.variantSelection,
      );

      await db.into(db.cartItemTable).insert(item.toDbData());
    });
  }

  @override
  Future<void> removeCartItem(Uuid itemId) async {
    await db.orderItemTableDao.removeOrderItem(itemId);
  }

  @override
  Future<void> updateCartItem(CartItem item) async {
    await db.transaction(() async {
      await removeCartItem(item.id);
      await addCartItem(item);
    });
  }

  @override
  Future<void> setItemOrderInclusionState(CartItem item, bool isSelected) {
    return db.cartItemTableDao.setItemOrderInclusionState(item, isSelected);
  }

  @override
  Future<void> setItemQuantity(CartItem item, int quantity) {
    return db.orderItemTableDao.setOrderItemQuantity(item.id, quantity);
  }

  @override
  Future<void> updateItemVariantSelection(
    CartItem item,
    ProductVariantIdsSelection variantSelection,
  ) async {
    await db.orderItemVariantSelectionTableDao.removeOrderItemVariantSelection(
      item.id,
    );

    await db.orderItemVariantSelectionTableDao.addOrderItemVariantSelection(
      item.id,
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
          id: Uuid.fromString('12345678-1234-5678-1234-567812345678'),
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
