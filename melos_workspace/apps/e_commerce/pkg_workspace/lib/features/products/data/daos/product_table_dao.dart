import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'product_table_dao.g.dart';

@DriftAccessor(tables: [ProductTable])
class ProductTableDao extends DatabaseAccessor<AppDatabase>
    with _$ProductTableDaoMixin {
  ProductTableDao(super.db);

  Future<void> addProductFromOrderItem(
    OrderItem item, {
    bool replaceOld = false,
  }) async {
    await db.transaction(() async {
      final productTableData = await db.into(db.productTable).insertReturning(
            item.product.toDbCompanion(),
            mode: replaceOld ? InsertMode.insertOrReplace : InsertMode.insert,
          );

      for (final group in item.product.variantGroups) {
        final groupTableData = await db
            .into(db.productVariantGroupTable)
            .insertReturning(
              group.toDbCompanion(productId: productTableData.id),
              mode: replaceOld ? InsertMode.insertOrReplace : InsertMode.insert,
            );

        for (final variant in group.variants) {
          await db.into(db.productVariantTable).insert(
                variant.toDbCompanion(groupId: groupTableData.id),
                mode:
                    replaceOld ? InsertMode.insertOrReplace : InsertMode.insert,
              );
        }
      }
    });
  }

  Future<ProductTableData?> getProduct(int productId) async {
    return (select(db.productTable)..where((tbl) => tbl.id.equals(productId)))
        .getSingleOrNull();
  }

  Future<ProductTableData?> getProductByVariantId(DatabaseKey variantId) async {
    final query = select(db.productTable).join([
      innerJoin(
        db.productVariantGroupTable,
        db.productVariantGroupTable.productId.equalsExp(db.productTable.id),
      ),
      innerJoin(
        db.productVariantTable,
        db.productVariantTable.groupId
            .equalsExp(db.productVariantGroupTable.id),
      ),
    ])
      ..where(
        db.productVariantTable.id.equals(variantId),
      );

    final result = await query.getSingleOrNull();
    return result?.readTable(db.productTable);
  }
}
