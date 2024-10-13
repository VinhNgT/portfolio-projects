import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:realm/realm.dart';

part 'product_variant.mapper.dart';
part 'product_variant.realm.dart';

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
