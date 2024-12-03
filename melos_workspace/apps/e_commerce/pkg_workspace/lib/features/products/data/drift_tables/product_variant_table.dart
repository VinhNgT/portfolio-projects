import 'package:drift/drift.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_variant_group_table.dart';

class ProductVariantTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();

  IntColumn get groupId =>
      integer().references(ProductVariantGroupTable, #id)();
}
