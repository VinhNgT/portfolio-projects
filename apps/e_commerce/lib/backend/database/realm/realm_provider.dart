import 'package:e_commerce/backend/env/env_provider.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_dimensions.dart';
import 'package:e_commerce/features/products/domain/product_meta.dart';
import 'package:e_commerce/features/products/domain/product_reviews.dart';
import 'package:e_commerce/features/products/domain/products.dart';
import 'package:path_provider/path_provider.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'realm_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Realm> realm(RealmRef ref) async {
  final schemas = [
    // Products
    ProductDimensionsRealm.schema,
    ProductMetaRealm.schema,
    ProductReviewsRealm.schema,
    ProductRealm.schema,
    ProductsRealm.schema,
  ];

  final realmPath = await getApplicationDocumentsDirectory();
  final config = Configuration.local(
    schemas,
    path: '${realmPath.path}/data.realm',
    shouldDeleteIfMigrationNeeded:
        ref.watch(envProvider).realmShouldDeleteIfMigrationNeeded,
  );

  return Realm(config);
}
