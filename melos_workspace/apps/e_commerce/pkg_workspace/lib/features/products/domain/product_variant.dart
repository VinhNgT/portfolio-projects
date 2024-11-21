import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift/drift_provider.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:realm/realm.dart';

part 'product_variant.mapper.dart';
part 'product_variant.realm.dart';

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

  factory ProductVariant.fromRealmObj(ProductVariantRealm obj) =>
      ProductVariantRealmConverter.fromRealmObj(obj);

  @override
  String toString() {
    return '$id ($name)';
  }
}

@realm
class $ProductVariantRealm {
  @PrimaryKey()
  late Uuid id;
  late String name;
}

extension ProductVariantRealmConverter on ProductVariant {
  static ProductVariant fromRealmObj(ProductVariantRealm obj) {
    return ProductVariant(
      id: obj.id,
      name: obj.name,
    );
  }

  ProductVariantRealm toRealmObj() {
    return ProductVariantRealm(
      id: id,
      name: name,
    );
  }
}
