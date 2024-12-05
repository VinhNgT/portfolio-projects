import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_variant_table.dart';

part 'product_variant.mapper.dart';

@MappableClass()
class ProductVariant with ProductVariantMappable {
  final int? id;
  final String name;

  const ProductVariant({
    required this.id,
    required this.name,
  });

  static ProductVariant fromDbData(ProductVariantTableData data) =>
      ProductVariantTableDomainConverter.fromDbData(data);

  factory ProductVariant.fromJson(Map<String, dynamic> json) =>
      ProductVariantMapper.fromJson(json);

  @override
  String toString() {
    return '$id ($name)';
  }
}
