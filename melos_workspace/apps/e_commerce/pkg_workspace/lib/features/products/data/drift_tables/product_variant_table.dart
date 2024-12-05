import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_variant_group_table.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'product_variant_table.g.dart';

class ProductVariantTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();

  IntColumn get groupId => integer()
      .references(ProductVariantGroupTable, #id, onDelete: KeyAction.cascade)();
}

extension ProductVariantTableDomainConverter on ProductVariant {
  static ProductVariant fromDbData(ProductVariantTableData data) {
    return ProductVariant(
      id: data.id,
      name: data.name,
    );
  }

  ProductVariantTableCompanion toDbCompanion({
    required int groupId,
  }) {
    return ProductVariantTableCompanion(
      id: Value.absentIfNull(id),
      name: Value(name),
      groupId: Value(groupId),
    );
  }
}

@DriftAccessor()
class ProductVariantTableDao extends DatabaseAccessor<AppDatabase> {
  ProductVariantTableDao(super.db);

  Future<DatabaseKey> addProductVariant({
    required ProductVariant productVariant,
    required DatabaseKey productVariantGroupId,
  }) {
    return db.transaction(() async {
      final dbProductVariant =
          await into(db.productVariantTable).insertReturning(
        productVariant.toDbCompanion(groupId: productVariantGroupId),
      );

      return dbProductVariant.id;
    });
  }

  Future<List<ProductVariant>> getProductVariantsForGroup(int groupId) async {
    final data = await (select(db.productVariantTable)
          ..where((tbl) => tbl.groupId.equals(groupId)))
        .get();

    return data.map(ProductVariant.fromDbData).toList();
  }
}
