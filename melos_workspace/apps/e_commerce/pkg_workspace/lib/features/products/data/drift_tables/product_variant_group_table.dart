import 'package:drift/drift.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_table.dart';

class ProductVariantGroupTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get groupName => text()();

  IntColumn get productId => integer().references(ProductTable, #id)();
}
