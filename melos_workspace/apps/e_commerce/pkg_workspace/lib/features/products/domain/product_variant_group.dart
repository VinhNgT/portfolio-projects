import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_variant_group_table.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';

part 'product_variant_group.mapper.dart';

typedef ProductVariantGroupId = int;
typedef ProductVariantId = int;
typedef ProductVariantIdsSelection
    = Map<ProductVariantGroupId, ProductVariantId?>;

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
  ) =>
      ProductVariantGroupTableDomainConverter.fromDbData(db, data);

  factory ProductVariantGroup.fromJson(Map<String, dynamic> json) =>
      ProductVariantGroupMapper.fromJson(json);

  @override
  String toString() {
    return '$id ($groupName)';
  }
}
