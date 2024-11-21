import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift/drift_provider.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:realm/realm.dart';

part 'product_variant_group.mapper.dart';
part 'product_variant_group.realm.dart';

typedef ProductVariantGroupId = Uuid;
typedef ProductVariantId = Uuid;
typedef ProductVariantIdsSelection
    = Map<ProductVariantGroupId, ProductVariantId?>;

class ProductVariantGroupTable extends Table {
  TextColumn get id => text()();
  TextColumn get groupName => text()();

  IntColumn get productId => integer().references(ProductTable, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

@MappableClass()
class ProductVariantGroup with ProductVariantGroupMappable {
  final ProductVariantGroupId id;
  final String groupName;
  final List<ProductVariant> variants;

  const ProductVariantGroup({
    required this.id,
    required this.groupName,
    this.variants = const [],
  });

  ProductVariantGroup.newId({
    required this.groupName,
    required this.variants,
  }) : id = Uuid.v4();

  static Future<ProductVariantGroup> fromDbData(
    AppDatabase db,
    ProductVariantGroupTableData data,
  ) async {
    final variants = await (db.select(db.productVariantTable)
          ..where((tbl) => tbl.groupId.equals(data.id)))
        .get();

    return ProductVariantGroup(
      id: Uuid.fromString(data.id),
      groupName: data.groupName,
      variants: variants.map(ProductVariant.fromDbData).toList(),
    );
  }

  ProductVariantGroupTableData toDbData({
    required int productId,
  }) {
    return ProductVariantGroupTableData(
      id: id.toString(),
      groupName: groupName,
      productId: productId,
    );
  }

  factory ProductVariantGroup.fromJson(Map<String, dynamic> json) =>
      ProductVariantGroupMapper.fromJson(json);

  factory ProductVariantGroup.fromRealmObj(ProductVariantGroupRealm obj) =>
      ProductVariantGroupRealmConverter.fromRealmObj(obj);

  @override
  String toString() {
    return '$id ($groupName)';
  }
}

@realm
class $ProductVariantGroupRealm {
  @PrimaryKey()
  late Uuid id;
  late String groupName;
  late List<$ProductVariantRealm> variants;
}

extension ProductVariantGroupRealmConverter on ProductVariantGroup {
  static ProductVariantGroup fromRealmObj(ProductVariantGroupRealm obj) {
    return ProductVariantGroup(
      id: obj.id,
      groupName: obj.groupName,
      variants: obj.variants.map(ProductVariant.fromRealmObj).toList(),
    );
  }

  ProductVariantGroupRealm toRealmObj(Realm realm) {
    return ProductVariantGroupRealm(
      id: id,
      groupName: groupName,
      variants: variants.map((e) => e.toRealmObj()).toList(),
    );
  }
}
