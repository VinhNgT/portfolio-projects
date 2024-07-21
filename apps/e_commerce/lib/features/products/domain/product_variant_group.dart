import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:realm/realm.dart';

part 'product_variant_group.mapper.dart';
part 'product_variant_group.realm.dart';

@realm
class $ProductVariantGroupRealm {
  @PrimaryKey()
  late Uuid id;
  late String groupName;
  late List<$ProductVariantRealm> variants;
}

@MappableClass()
class ProductVariantGroup with ProductVariantGroupMappable {
  final Uuid id;
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

  factory ProductVariantGroup.fromRealmObj(ProductVariantGroupRealm realm) {
    return ProductVariantGroup(
      id: realm.id,
      groupName: realm.groupName,
      variants: realm.variants.map(ProductVariant.fromRealmObj).toList(),
    );
  }

  ProductVariantGroupRealm toRealmObj(Realm realm) {
    final variantsRealm = variants
        .map((e) => realm.find<ProductVariantRealm>(e.id) ?? e.toRealmObj());

    return ProductVariantGroupRealm(
      id: id,
      groupName: groupName,
      variants: variantsRealm,
    );
  }

  @override
  String toString() {
    return '$id ($groupName)';
  }
}
