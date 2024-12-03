import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_variant_table.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'order_item_variant_selection_table.g.dart';

class OrderItemVariantSelectionTable extends Table {
  IntColumn get orderItemId =>
      integer().references(OrderItemTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get variantId => integer().references(ProductVariantTable, #id)();

  @override
  Set<Column> get primaryKey => {orderItemId, variantId};
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
