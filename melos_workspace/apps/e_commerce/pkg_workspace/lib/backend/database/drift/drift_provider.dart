import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drift_provider.g.dart';

@DriftDatabase(
  tables: [
    // Products
    ProductTable,
    ProductVariantTable,
    ProductVariantGroupTable,

    // Orders
    CartTable,
    CartItemTable,
    OrderItemTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase({required String dbName}) : super(_openConnection(dbName));

  static QueryExecutor _openConnection(String dbName) {
    return driftDatabase(name: dbName);
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}

@Riverpod(keepAlive: true)
AppDatabase drift(DriftRef ref, {String dbName = 'default'}) {
  return AppDatabase(dbName: dbName);
}

class DbJsonConverter extends TypeConverter<dynamic, String> {
  const DbJsonConverter();

  @override
  dynamic fromSql(String fromDb) {
    return jsonDecode(fromDb);
  }

  @override
  String toSql(dynamic value) {
    return jsonEncode(value);
  }
}
