import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:realm/realm.dart';

part 'product_variant.realm.dart';

@realmEmbedded
class $ProductVariantRealm {
  @Indexed()
  late Uuid id;
  late String name;
}

class ProductVariant {
  final Uuid id;
  final String name;

  const ProductVariant({
    required this.id,
    required this.name,
  });

  ProductVariantRealm toRealm() {
    return ProductVariantRealm(id: id, name: name);
  }

  factory ProductVariant.fromRealm(ProductVariantRealm realm) {
    return ProductVariant(
      id: realm.id,
      name: realm.name,
    );
  }
}
