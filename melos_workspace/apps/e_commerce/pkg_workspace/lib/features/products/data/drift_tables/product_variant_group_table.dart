import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_table.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';

class ProductVariantGroupTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get groupName => text()();

  IntColumn get productId => integer().references(ProductTable, #id)();
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
