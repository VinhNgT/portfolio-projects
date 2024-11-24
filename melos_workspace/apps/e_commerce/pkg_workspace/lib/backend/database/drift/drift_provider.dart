import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:e_commerce/features/cart/data/daos.dart';
import 'package:e_commerce/features/cart/domain/cart.dart';
import 'package:e_commerce/features/cart/domain/cart_item.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/data/daos/product_table_dao.dart';
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
  AppDatabase({
    required File dbfile,
    bool inMemmory = false,
  }) : super(_openConnection(dbfile));

  AppDatabase.inMemory() : super(NativeDatabase.memory());

  static QueryExecutor _openConnection(File dbfile) {
    return NativeDatabase.createInBackground(dbfile);
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
Future<AppDatabase> drift(DriftRef ref, {String dbName = 'default'}) async {
  // final dbPath = (await getApplicationDocumentsDirectory()).path;
  // return AppDatabase(dbfile: File('$dbPath/$dbName.db'));
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
