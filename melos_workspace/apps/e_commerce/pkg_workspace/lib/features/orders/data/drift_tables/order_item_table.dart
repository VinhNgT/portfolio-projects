import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_database_provider.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'order_item_table.g.dart';

class OrderItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  // ignore: recursive_getters
  IntColumn get quantity => integer().check(quantity.isBiggerOrEqualValue(0))();
}

extension OrderItemTableDomainExtensionConverter on OrderItem {
  static Future<OrderItem> fromDbData(
    DriftLocalDatabase db,
    OrderItemTableData data,
  ) async {
    final product = await db.productTableDao.getProductFromOrderItem(data.id);
    final variantSelection = await db.orderItemVariantSelectionTableDao
        .getOrderItemVariantSelection(data.id);

    return OrderItem(
      id: data.id,
      product: product!,
      quantity: data.quantity,
      variantSelection: variantSelection,
    );
  }

  OrderItemTableCompanion toDbCompanion() {
    return OrderItemTableCompanion(
      id: Value.absentIfNull(id),
      quantity: Value(quantity),
    );
  }
}

@DriftAccessor()
class OrderItemTableDao extends DatabaseAccessor<DriftLocalDatabase> {
  OrderItemTableDao(super.db);

  Future<DatabaseKey> addOrderItem({required OrderItem orderItem}) {
    return db.transaction(() async {
      final dbOrderItem = await into(db.orderItemTable)
          .insertReturning(orderItem.toDbCompanion());

      await db.orderItemVariantSelectionTableDao.addOrderItemVariantSelection(
        variantSelection: orderItem.variantSelection,
        orderItemId: dbOrderItem.id,
      );

      return dbOrderItem.id;
    });
  }

  Future<OrderItem?> getOrderItem(DatabaseKey itemId) async {
    final orderItem = await (db.select(db.orderItemTable)
          ..where((tbl) => tbl.id.equals(itemId)))
        .getSingleOrNull();

    return orderItem == null ? null : OrderItem.fromDbData(db, orderItem);
  }

  Future<void> removeOrderItem(DatabaseKey itemId) async {
    await (delete(db.orderItemTable)..where((tbl) => tbl.id.equals(itemId)))
        .go();
  }

  Future<void> setOrderItemQuantity(DatabaseKey itemId, int quantity) async {
    await (update(db.orderItemTable)..where((tbl) => tbl.id.equals(itemId)))
        .write(
      OrderItemTableCompanion(
        quantity: Value(quantity),
      ),
    );
  }
}
