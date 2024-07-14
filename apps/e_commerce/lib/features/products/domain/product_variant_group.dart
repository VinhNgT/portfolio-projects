import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:realm/realm.dart';

part 'product_variant_group.realm.dart';

@realmEmbedded
class $ProductVariantGroupRealm {
  @Indexed()
  late Uuid id;
  late String groupName;
  late List<$ProductVariantRealm> variants;
}

class ProductVariantGroup {
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

  ProductVariantGroupRealm toRealm() {
    return ProductVariantGroupRealm(
      id: id,
      groupName: groupName,
      variants: variants.map((e) => e.toRealm()).toList(),
    );
  }

  factory ProductVariantGroup.fromRealm(ProductVariantGroupRealm realm) {
    return ProductVariantGroup(
      id: realm.id,
      groupName: realm.groupName,
      variants: realm.variants.map(ProductVariant.fromRealm).toList(),
    );
  }

  @override
  String toString() {
    return '${id}_$groupName';
  }
}
