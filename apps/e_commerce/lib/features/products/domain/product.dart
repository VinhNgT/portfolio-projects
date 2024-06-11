import 'package:e_commerce/features/products/domain/product_dimensions.dart';
import 'package:e_commerce/features/products/domain/product_meta.dart';
import 'package:e_commerce/features/products/domain/product_reviews.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    ProductDimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<ProductReviews>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    ProductMeta? meta,
    String? thumbnail,
    List<String>? images,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
