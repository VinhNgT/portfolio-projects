import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';

part 'product_variant_group.mapper.dart';

typedef ProductVariantGroupId = int;
typedef ProductVariantId = int;
typedef ProductVariantIdsSelection
    = Map<ProductVariantGroupId, ProductVariantId?>;

class ProductVariantGroupTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get groupName => text()();

  IntColumn get productId => integer().references(ProductTable, #id)();
}

@MappableClass()
class ProductVariantGroup with ProductVariantGroupMappable {
  final ProductVariantGroupId? id;
  final String groupName;
  final List<ProductVariant> variants;

  const ProductVariantGroup({
    this.id,
    required this.groupName,
    this.variants = const [],
  });

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

  factory ProductVariantGroup.fromJson(Map<String, dynamic> json) =>
      ProductVariantGroupMapper.fromJson(json);

  @override
  String toString() {
    return '$id ($groupName)';
  }
}
