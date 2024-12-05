import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'order_item_table.g.dart';

class OrderItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  // ignore: recursive_getters
  IntColumn get quantity => integer().check(quantity.isBiggerOrEqualValue(0))();
}

extension OrderItemTableDomainExtensionConverter on OrderItem {
  static Future<OrderItem> fromDbData(
    AppDatabase db,
    OrderItemTableData data,
  ) async {
    final productQuery = db.select(db.productTable, distinct: true).join([
      innerJoin(
        db.productVariantGroupTable,
        db.productVariantGroupTable.productId.equalsExp(db.productTable.id),
        useColumns: false,
      ),
      innerJoin(
        db.productVariantTable,
        db.productVariantTable.groupId
            .equalsExp(db.productVariantGroupTable.id),
        useColumns: false,
      ),
      innerJoin(
        db.orderItemVariantSelectionTable,
        db.orderItemVariantSelectionTable.variantId
            .equalsExp(db.productVariantTable.id),
        useColumns: false,
      ),
      innerJoin(
        db.orderItemTable,
        db.orderItemTable.id
            .equalsExp(db.orderItemVariantSelectionTable.orderItemId),
        useColumns: false,
      ),
    ])
      ..where(db.orderItemTable.id.equals(data.id));

    final productData =
        (await productQuery.getSingle()).readTable(db.productTable);

    final variantSelectionQuery = db
        .select(db.orderItemVariantSelectionTable)
        .join([
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
      ..where(db.orderItemVariantSelectionTable.orderItemId.equals(data.id));

    final variantSelectionStringMap = (await variantSelectionQuery.get()).fold(
        <ProductVariantGroupId, ProductVariantId?>{}, (previousValue, element) {
      final groupId = element.read(db.productVariantGroupTable.id)!;
      final variantId = element.read(db.productVariantTable.id);

      return {
        ...previousValue,
        groupId: variantId,
      };
    });

    return OrderItem(
      id: data.id,
      product: await Product.fromDbData(db, productData),
      quantity: data.quantity,
      variantSelection: variantSelectionStringMap,
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
class OrderItemTableDao extends DatabaseAccessor<AppDatabase> {
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
