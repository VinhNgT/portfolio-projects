import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:realm/realm.dart';

part 'product_dimensions.mapper.dart';
part 'product_dimensions.realm.dart';

@MappableClass()
class ProductDimensions with ProductDimensionsMappable {
  final double width;
  final double height;
  final double depth;

  const ProductDimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory ProductDimensions.fromJson(Map<String, dynamic> json) =>
      ProductDimensionsMapper.fromJson(json);

  factory ProductDimensions.fromRealmObj(ProductDimensionsRealm obj) =>
      ProductDimensionsRealmConverter.fromRealmObj(obj);
}

@realmEmbedded
class $ProductDimensionsRealm {
  late double width;
  late double height;
  late double depth;
}

extension ProductDimensionsRealmConverter on ProductDimensions {
  static ProductDimensions fromRealmObj(ProductDimensionsRealm obj) {
    return ProductDimensions(
      width: obj.width,
      height: obj.height,
      depth: obj.depth,
    );
  }

  ProductDimensionsRealm toRealmObj() {
    return ProductDimensionsRealm(
      width: width,
      height: height,
      depth: depth,
    );
  }
}
