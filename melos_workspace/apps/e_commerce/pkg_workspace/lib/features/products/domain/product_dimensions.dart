import 'package:dart_mappable/dart_mappable.dart';

part 'product_dimensions.mapper.dart';

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
}
