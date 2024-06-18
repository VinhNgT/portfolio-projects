import 'package:e_commerce/features/products/domain/product_dimensions.dart';
import 'package:e_commerce/features/products/domain/product_meta.dart';
import 'package:e_commerce/features/products/domain/product_reviews.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'product.freezed.dart';
part 'product.g.dart';
part 'product.proto.dart';

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
  const Product._();

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);

  static const prototype = _ProductPrototypeX._prototype;
}

extension ProductPriceX on Product {
  // Estimated price in VND.
  int get vndPrice => (price! * 23000 / 1000).round() * 1000;

  // Discounted price in VND.
  int get vndDiscountedPrice =>
      (price! * 23000 * (1 - discountPercentage! / 100) / 1000).round() * 1000;

  NumberFormat get vndPriceFormatter => NumberFormat.currency(
        locale: 'vi_VN',
        symbol: '₫',
        decimalDigits: 0,
        customPattern: '¤#,###',
      );
}
