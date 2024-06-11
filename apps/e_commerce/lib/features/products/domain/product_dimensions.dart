import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dimensions.freezed.dart';
part 'product_dimensions.g.dart';

@freezed
class ProductDimensions with _$ProductDimensions {
  const factory ProductDimensions({
    double? width,
    double? height,
    double? depth,
  }) = _ProductDimensions;

  factory ProductDimensions.fromJson(Map<String, Object?> json) =>
      _$ProductDimensionsFromJson(json);
}
