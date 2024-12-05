import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_table.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'product_variant_group_table.g.dart';

class ProductVariantGroupTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get groupName => text()();

  IntColumn get productId =>
      integer().references(ProductTable, #id, onDelete: KeyAction.cascade)();
}

extension ProductVariantGroupTableDomainConverter on ProductVariantGroup {
  static Future<ProductVariantGroup> fromDbData(
    AppDatabase db,
    ProductVariantGroupTableData data,
  ) async {
    final variants = await (db.select(db.productVariantTable)
          ..where((tbl) => tbl.groupId.equals(data.id)))
        .get();

    return ProductVariantGroup(
      id: data.id,
      groupName: data.groupName,
      variants: variants.map(ProductVariant.fromDbData).toList(),
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
class ProductVariantGroupTableDao extends DatabaseAccessor<AppDatabase> {
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
}
