import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:e_commerce/backend/database/drift_database_provider.drift.dart';
import 'package:e_commerce/features/cart/data/drift_tables/cart_item_table.dart';
import 'package:e_commerce/features/cart/data/drift_tables/cart_table.dart';
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.dart';
import 'package:e_commerce/features/orders/data/drift_tables/order_item_variant_selection_table.dart';
import 'package:e_commerce/features/orders/data/drift_tables/order_table.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_table.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_variant_group_table.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_variant_table.dart';
import 'package:e_commerce/logging/logger_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drift_database_provider.g.dart';

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
    OrderTable,
  ],
  daos: [
    // Products
    ProductTableDao,
    ProductVariantTableDao,
    ProductVariantGroupTableDao,

    // Orders
    CartTableDao,
    CartItemTableDao,
    OrderItemTableDao,
    OrderItemVariantSelectionTableDao,
    OrderTableDao,
  ],
)
class DriftLocalDatabase extends $DriftLocalDatabase {
  DriftLocalDatabase({
    required String dbName,
    required this.logger,
  }) : super(_openConnection(dbName));

  DriftLocalDatabase.inMemory({required this.logger})
      : super(NativeDatabase.memory());

  final Logger logger;

  static QueryExecutor _openConnection(String name) {
    return driftDatabase(name: name);
  }

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
      onUpgrade: (m, from, to) async {
        if (to != schemaVersion) {
          return;
        }

        // Remove this in production.
        logger.w('New schema version detected, drop all tables');
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
          await m.createTable(table);
        }
      },
    );
  }
}

@Riverpod(keepAlive: true)
DriftLocalDatabase driftInMemoryDatabase(Ref ref) {
  final logger = ref.watch(loggerProvider);
  return DriftLocalDatabase.inMemory(logger: logger);
}

@Riverpod(keepAlive: true)
DriftLocalDatabase driftLocalDatabase(Ref ref, {required String dbName}) {
  final logger = ref.watch(loggerProvider);
  return DriftLocalDatabase(dbName: dbName, logger: logger);
}

@Riverpod(keepAlive: true)
DriftLocalDatabase driftDefaultLocalDatabase(Ref ref) {
  // return ref.watch(driftInMemoryDatabaseProvider);
  return ref.watch(driftLocalDatabaseProvider(dbName: 'default'));
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
