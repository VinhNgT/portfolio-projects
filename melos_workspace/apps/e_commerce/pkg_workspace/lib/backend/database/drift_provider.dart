import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:e_commerce/features/cart/data/daos.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/data/daos/product_table_dao.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    OrderItemVariantSelectionTable,
  ],
  daos: [
    OrderItemTableDao,
    OrderItemVariantSelectionTableDao,
    CartItemTableDao,
    ProductTableDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase({required String dbName}) : super(_openConnection(dbName));
  AppDatabase.inMemory() : super(NativeDatabase.memory());

  static QueryExecutor _openConnection(String name) {
    return driftDatabase(name: name);
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
AppDatabase driftAppDatabase(Ref ref) {
  // return AppDatabase(dbName: 'default');
  return AppDatabase.inMemory();
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
