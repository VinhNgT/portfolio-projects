import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/features/products/domain/product.dart';

part 'products.mapper.dart';

@MappableClass()
class ProductsLazyList with ProductsLazyListMappable {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  const ProductsLazyList({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsLazyList.fromJson(Map<String, dynamic> json) =>
      ProductsLazyListMapper.fromJson(json);
}
