import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_variant_group_table.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';

class ProductVariantTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();

  IntColumn get groupId =>
      integer().references(ProductVariantGroupTable, #id)();
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
