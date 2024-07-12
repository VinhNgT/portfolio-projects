import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:realm/realm.dart';

part 'product_variant_group.realm.dart';

@realmEmbedded
class $ProductVariantGroupRealm {
  late String groupName;
  late List<$ProductVariantRealm> variants;
}

class ProductVariantGroup {
  final String groupName;
  final List<ProductVariant> variants;

  const ProductVariantGroup({
    required this.groupName,
    this.variants = const [],
  });

  ProductVariantGroupRealm toRealm() {
    return ProductVariantGroupRealm(
      groupName: groupName,
      variants: variants.map((e) => e.toRealm()).toList(),
    );
  }

  factory ProductVariantGroup.fromRealm(ProductVariantGroupRealm realm) {
    return ProductVariantGroup(
      groupName: realm.groupName,
      variants: realm.variants.map(ProductVariant.fromRealm).toList(),
    );
  }
}
