import 'package:e_commerce/backend/env/env_provider.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/domain/order.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_dimensions.dart';
import 'package:e_commerce/features/products/domain/product_meta.dart';
import 'package:e_commerce/features/products/domain/product_review.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
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
    ProductReviewRealm.schema,
    ProductRealm.schema,
    ProductVariantGroupRealm.schema,
    ProductVariantRealm.schema,

    // Cart
    CartRealm.schema,
    CartItemRealm.schema,
    OrderRealm.schema,
    OrderItemRealm.schema,
  ];

  final realmPath = await getApplicationDocumentsDirectory();
  final config = Configuration.local(
    schemas,
    path: '${realmPath.path}/data.realm',
    shouldDeleteIfMigrationNeeded:
        ref.watch(envProvider).realmShouldDeleteIfMigrationNeeded,
  );

  final realm = Realm(config);
  ref.onDispose(realm.close);

  return realm;
}
