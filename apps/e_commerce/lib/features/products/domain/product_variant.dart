import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:realm/realm.dart';

part 'product_variant.mapper.dart';
part 'product_variant.realm.dart';

@realm
class $ProductVariantRealm {
  @PrimaryKey()
  late Uuid id;
  late String name;
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

  factory ProductVariant.fromRealmObj(ProductVariantRealm realm) {
    return ProductVariant(
      id: realm.id,
      name: realm.name,
    );
  }

  ProductVariantRealm toRealmObj() {
    return ProductVariantRealm(id: id, name: name);
  }

  @override
  String toString() {
    return '$id ($name)';
  }
}
