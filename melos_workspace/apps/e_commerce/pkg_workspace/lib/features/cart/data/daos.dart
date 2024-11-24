import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'daos.g.dart';

@DriftAccessor(tables: [CartItemTable])
class CartItemTableDao extends DatabaseAccessor<AppDatabase>
    with _$CartItemTableDaoMixin {
  CartItemTableDao(super.db);

  Future<void> setItemOrderInclusionState(CartItem item, bool isSelected) {
    return (update(db.cartItemTable)
          ..where(
            (tbl) => tbl.orderItemId.equals(item.orderItem.id!),
          ))
        .write(
      CartItemTableCompanion(
        isIncludeInOrder: Value(isSelected),
      ),
    );
  }

  Stream<List<CartItemTableData>> watchCartItems() {
    return select(db.cartItemTable).watch();
  }

  Future<List<CartItemTableData>> getCartItems() async {
    return select(db.cartItemTable).get();
  }
}

@DriftAccessor(tables: [OrderItemTable])
class OrderItemTableDao extends DatabaseAccessor<AppDatabase>
    with _$OrderItemTableDaoMixin {
  OrderItemTableDao(super.db);

  Stream<List<OrderItemTableData>> watchOrderItems() {
    return select(db.orderItemTable).watch();
  }

  Future<DatabaseKey?> getExistingOrderItemId(
    List<DatabaseKey> orderItemVariantSelectionKey,
  ) async {
    final distinctProductVariantCountExp =
        db.orderItemVariantSelectionTable.variantId.count(
      distinct: true,
    );

    final existingOrderItemQuery =
        select(db.orderItemVariantSelectionTable).join([])
          ..where(
            db.orderItemVariantSelectionTable.variantId.isIn(
              orderItemVariantSelectionKey,
            ),
          )
          ..addColumns([
            distinctProductVariantCountExp,
          ])
          ..groupBy(
            [db.orderItemVariantSelectionTable.orderItemId],
            having: distinctProductVariantCountExp
                .equals(orderItemVariantSelectionKey.length),
          );

    final rowResult = await existingOrderItemQuery.getSingleOrNull();
    final value =
        rowResult?.read(db.orderItemVariantSelectionTable.orderItemId);

    return value;
  }

  Future<void> setOrderItemQuantity(DatabaseKey itemId, int quantity) async {
    await (update(db.orderItemTable)..where((tbl) => tbl.id.equals(itemId)))
        .write(
      OrderItemTableCompanion(
        quantity: Value(quantity),
      ),
    );
  }

  Future<void> addOrderItemQuantity(DatabaseKey itemId, int quantity) async {
    await (update(db.orderItemTable)..where((tbl) => tbl.id.equals(itemId)))
        .write(
      OrderItemTableCompanion.custom(
        quantity: db.orderItemTable.quantity + Variable(quantity),
      ),
    );
  }

  Future<OrderItemTableData?> getOrderItem(DatabaseKey itemId) async {
    return (select(db.orderItemTable)..where((tbl) => tbl.id.equals(itemId)))
        .getSingleOrNull();
  }

  Future<void> removeOrderItem(DatabaseKey itemId) async {
    await (delete(db.orderItemTable)..where((tbl) => tbl.id.equals(itemId)))
        .go();
  }
}

@DriftAccessor(tables: [OrderItemVariantSelectionTable])
class OrderItemVariantSelectionTableDao extends DatabaseAccessor<AppDatabase>
    with _$OrderItemVariantSelectionTableDaoMixin {
  OrderItemVariantSelectionTableDao(super.db);

  Future<void> addOrderItemVariantSelection(
    DatabaseKey orderId,
    ProductVariantIdsSelection variantSelection,
  ) async {
    await db.transaction(() async {
      for (final variantId in variantSelection.values) {
        await db.into(db.orderItemVariantSelectionTable).insert(
              OrderItemVariantSelectionTableData(
                orderItemId: orderId,
                variantId: variantId!,
              ),
            );
      }
    });
  }

  Future<List<OrderItemVariantSelectionTableData>> getOrderItemVariantSelection(
    DatabaseKey orderId,
  ) async {
    return (select(db.orderItemVariantSelectionTable)
          ..where((tbl) => tbl.orderItemId.equals(orderId)))
        .get();
  }

  Future<void> removeOrderItemVariantSelection(DatabaseKey orderId) async {
    await (delete(db.orderItemVariantSelectionTable)
          ..where((tbl) => tbl.orderItemId.equals(orderId)))
        .go();
  }
}
