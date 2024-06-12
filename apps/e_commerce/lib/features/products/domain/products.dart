import 'package:e_commerce/features/products/domain/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products.freezed.dart';
part 'products.g.dart';

@freezed
class Products with _$Products {
  const factory Products({
    List<Product>? products,
    int? total,
    int? skip,
    int? limit,
  }) = _Products;

  factory Products.fromJson(Map<String, Object?> json) =>
      _$ProductsFromJson(json);
}
