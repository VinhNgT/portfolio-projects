import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_database_provider.dart';
import 'package:e_commerce/features/orders/data/drift_tables/order_table.drift.dart';
import 'package:e_commerce/features/orders/domain/order.dart';
import 'package:e_commerce/utils/typedefs.dart';

class OrderTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get receiveAddress => text()();
  TextColumn get status => textEnum<OrderStatus>()();
}

extension OrderTableDomainExtensionConverter on Order {
  static Future<Order> fromDbData(
    DriftLocalDatabase db,
    OrderTableData data,
  ) async {
    final orderItems =
        await db.orderItemTableDao.getOrderItemsForOrder(data.id);

    return Order(
      id: data.id,
      items: orderItems,
      receiveAddress: data.receiveAddress,
      status: OrderStatus.values.byName(data.status.name),
    );
  }

  OrderTableCompanion toDbCompanion() {
    return OrderTableCompanion(
      id: Value.absentIfNull(id),
      receiveAddress: Value(receiveAddress),
      status: Value(status),
    );
  }
}

@DriftAccessor()
class OrderTableDao extends DatabaseAccessor<DriftLocalDatabase> {
  OrderTableDao(super.db);

  Future<DatabaseKey> addOrder({required Order order}) {
    return db.transaction(() async {
      final dbOrder =
          await into(db.orderTable).insertReturning(order.toDbCompanion());

      return dbOrder.id;
    });
  }

  Future<Order?> getOrder(DatabaseKey orderId) async {
    final dbOrder = await (db.select(db.orderTable)
          ..where((tbl) => tbl.id.equals(orderId)))
        .getSingleOrNull();

    return dbOrder == null ? null : Order.fromDbData(db, dbOrder);
  }

  Future<void> removeOrder(DatabaseKey orderId) async {
    await (delete(db.orderTable)..where((tbl) => tbl.id.equals(orderId))).go();
  }
}
