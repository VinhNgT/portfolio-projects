import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:realm/realm.dart';

part 'product_dimensions.mapper.dart';
part 'product_dimensions.realm.dart';

@realmEmbedded
class $ProductDimensionsRealm {
  late double? width;
  late double? height;
  late double? depth;
}

@MappableClass()
class ProductDimensions with ProductDimensionsMappable {
  final double? width;
  final double? height;
  final double? depth;

  const ProductDimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory ProductDimensions.fromRealm(ProductDimensionsRealm realm) {
    return ProductDimensions(
      width: realm.width,
      height: realm.height,
      depth: realm.depth,
    );
  }

  ProductDimensionsRealm toRealm() {
    return ProductDimensionsRealm(
      width: width,
      height: height,
      depth: depth,
    );
  }
}
