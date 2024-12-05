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

@DriftAccessor()
class OrderItemVariantSelectionTableDao extends DatabaseAccessor<AppDatabase> {
  OrderItemVariantSelectionTableDao(super.db);

  Future<ProductVariantIdsSelection> addOrderItemVariantSelection({
    required ProductVariantIdsSelection variantSelection,
    required DatabaseKey orderItemId,
  }) async {
    await db.transaction(() async {
      for (final variantId in variantSelection.values) {
        await into(db.orderItemVariantSelectionTable).insert(
          OrderItemVariantSelectionTableData(
            orderItemId: orderItemId,
            variantId: variantId!,
          ),
        );
      }
    });

    return variantSelection;
  }

  Future<ProductVariantIdsSelection> getOrderItemVariantSelection(
    DatabaseKey orderId,
  ) async {
    final query = db.select(db.orderItemVariantSelectionTable).join([
      innerJoin(
        db.productVariantTable,
        db.productVariantTable.id
            .equalsExp(db.orderItemVariantSelectionTable.variantId),
      ),
      innerJoin(
        db.productVariantGroupTable,
        db.productVariantGroupTable.id
            .equalsExp(db.productVariantTable.groupId),
      ),
    ])
      ..where(db.orderItemVariantSelectionTable.orderItemId.equals(orderId));

    final dbVariantSelection = await query.get();

    return {
      for (final dbVariant in dbVariantSelection)
        dbVariant.read(db.productVariantGroupTable.id)!:
            dbVariant.read(db.productVariantTable.id),
    };
  }

  Future<void> removeOrderItemVariantSelection(DatabaseKey itemId) async {
    await (delete(db.orderItemVariantSelectionTable)
          ..where((tbl) => tbl.orderItemId.equals(itemId)))
        .go();
  }
}
