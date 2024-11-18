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

  // factory ProductsLazyList.fromRealmObj(ProductsRealm realm) =>
  //     ProductsRealmConverter.fromRealmObj(realm);
}

// @realm
// class $ProductsRealm {
//   late List<$ProductRealm> products;
//   late int total;
//   late int skip;
//   late int limit;
// }

// extension ProductsRealmConverter on ProductsLazyList {
//   static ProductsLazyList fromRealmObj(ProductsRealm realm) {
//     return ProductsLazyList(
//       products: realm.products.map(Product.fromRealmObj).toList(),
//       total: realm.total,
//       skip: realm.skip,
//       limit: realm.limit,
//     );
//   }

//   ProductsRealm toRealmObj(Realm realm) {
//     final productsRealm = products
//         .map((e) => realm.find<ProductRealm>(e.id) ?? e.toRealmObj(realm));

//     return ProductsRealm(
//       products: productsRealm,
//       total: total,
//       skip: skip,
//       limit: limit,
//     );
//   }
// }
