import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:realm/realm.dart';

part 'products.mapper.dart';
part 'products.realm.dart';

@realm
class $ProductsRealm {
  late List<$ProductRealm> products;
  late int total;
  late int skip;
  late int limit;
}

@MappableClass()
class Products with ProductsMappable {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  const Products({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Products.fromRealmObj(ProductsRealm realm) {
    return Products(
      products: realm.products.map(Product.fromRealmObj).toList(),
      total: realm.total,
      skip: realm.skip,
      limit: realm.limit,
    );
  }

  ProductsRealm toRealmObj(Realm realm) {
    final productsRealm = products
        .map((e) => realm.find<ProductRealm>(e.id) ?? e.toRealmObj(realm));

    return ProductsRealm(
      products: productsRealm,
      total: total,
      skip: skip,
      limit: limit,
    );
  }
}
