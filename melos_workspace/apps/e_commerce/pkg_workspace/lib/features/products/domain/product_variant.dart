import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:sane_uuid/uuid.dart';

part 'product_variant.mapper.dart';

class ProductVariantTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  TextColumn get groupId => text().references(ProductVariantGroupTable, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

@MappableClass()
class ProductVariant with ProductVariantMappable {
  final Uuid id;
  final String name;

  const ProductVariant({
    required this.id,
    required this.name,
  });

  ProductVariant.newId({
    required this.name,
  }) : id = Uuid.v4();

  ProductVariant.fromDbData(ProductVariantTableData data)
      : id = Uuid.fromString(data.id),
        name = data.name;

  ProductVariantTableData toDbData({
    required String groupId,
  }) {
    return ProductVariantTableData(
      id: id.toString(),
      name: name,
      groupId: groupId,
    );
  }

  factory ProductVariant.fromJson(Map<String, dynamic> json) =>
      ProductVariantMapper.fromJson(json);

  @override
  String toString() {
    return '$id ($name)';
  }
}
