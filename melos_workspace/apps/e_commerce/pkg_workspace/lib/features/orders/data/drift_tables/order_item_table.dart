import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'order_item_table.g.dart';

class OrderItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  // ignore: recursive_getters
  IntColumn get quantity => integer().check(quantity.isBiggerOrEqualValue(0))();
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
