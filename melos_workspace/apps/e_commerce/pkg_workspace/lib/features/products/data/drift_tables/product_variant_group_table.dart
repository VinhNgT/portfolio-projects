import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_database_provider.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_table.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_variant_group_table.drift.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/typedefs.dart';

class ProductVariantGroupTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get groupName => text()();

  IntColumn get productId =>
      integer().references(ProductTable, #id, onDelete: KeyAction.cascade)();
}

extension ProductVariantGroupTableDomainConverter on ProductVariantGroup {
  static Future<ProductVariantGroup> fromDbData(
    DriftLocalDatabase db,
    ProductVariantGroupTableData data,
  ) async {
    final variants =
        await db.productVariantTableDao.getProductVariantsForGroup(data.id);

    return ProductVariantGroup(
      id: data.id,
      groupName: data.groupName,
      variants: variants,
    );
  }

  ProductVariantGroupTableCompanion toDbCompanion({
    required int productId,
  }) {
    return ProductVariantGroupTableCompanion(
      id: Value.absentIfNull(id),
      groupName: Value(groupName),
      productId: Value(productId),
    );
  }
}

@DriftAccessor()
class ProductVariantGroupTableDao extends DatabaseAccessor<DriftLocalDatabase> {
  ProductVariantGroupTableDao(super.db);

  Future<DatabaseKey> addProductVariantGroup({
    required ProductVariantGroup productVariantGroup,
    required DatabaseKey productId,
  }) {
    return db.transaction(() async {
      final dbProductVariantGroup =
          await into(db.productVariantGroupTable).insertReturning(
        productVariantGroup.toDbCompanion(productId: productId),
      );

      for (final variant in productVariantGroup.variants) {
        await db.productVariantTableDao.addProductVariant(
          productVariant: variant,
          productVariantGroupId: dbProductVariantGroup.id,
        );
      }

      return dbProductVariantGroup.id;
    });
  }

  Future<List<ProductVariantGroup>> getProductVariantGroupForProduct(
    DatabaseKey productId,
  ) async {
    final dbProductVariantGroups = await (select(db.productVariantGroupTable)
          ..where((tbl) => tbl.productId.equals(productId)))
        .get();

    return Future.wait(
      dbProductVariantGroups
          .map((group) => ProductVariantGroup.fromDbData(db, group)),
    );
  }
}
