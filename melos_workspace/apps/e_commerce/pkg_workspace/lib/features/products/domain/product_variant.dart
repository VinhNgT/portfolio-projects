import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';

part 'product_variant.mapper.dart';

@MappableClass()
class ProductVariant with ProductVariantMappable {
  final int? id;
  final String name;

  const ProductVariant({
    required this.id,
    required this.name,
  });

  ProductVariant.fromDbData(ProductVariantTableData data)
      : id = data.id,
        name = data.name;

  ProductVariantTableCompanion toDbCompanion({
    required int groupId,
  }) {
    return ProductVariantTableCompanion(
      id: Value.absentIfNull(id),
      name: Value(name),
      groupId: Value(groupId),
    );
  }

  factory ProductVariant.fromJson(Map<String, dynamic> json) =>
      ProductVariantMapper.fromJson(json);

  @override
  String toString() {
    return '$id ($name)';
  }
}
