import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:e_commerce/backend/database/drift_database_provider.drift.dart';
import 'package:e_commerce/backend/env/env_provider.dart';
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
    this.rebuildLocalDatabaseOnStartup = false,
  }) : super(_openConnection(dbName));

  DriftLocalDatabase.inMemory({
    required this.logger,
    this.rebuildLocalDatabaseOnStartup = false,
  }) : super(NativeDatabase.memory());

  final Logger logger;
  final bool rebuildLocalDatabaseOnStartup;

  static QueryExecutor _openConnection(String name) {
    return driftDatabase(name: name);
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        if (rebuildLocalDatabaseOnStartup) {
          logger.w('Rebuild local database, all existing data will be lost');

          await customStatement('PRAGMA foreign_keys = OFF');
          await transaction(() async {
            for (final table in allTables) {
              await delete(table).go();
            }
          });
        }

        // Do not remove this line. It enables foreign key constraints.
        await customStatement('PRAGMA foreign_keys = ON');
      },
      onUpgrade: (m, from, to) async {
        logger.w('New schema version detected');
      },
    );
  }
}

@Riverpod(keepAlive: true)
DriftLocalDatabase driftInMemoryDatabase(Ref ref) {
  final logger = ref.watch(loggerProvider);
  final rebuildLocalDatabaseOnStartup =
      ref.watch(envProvider.select((env) => env.rebuildLocalDatabaseOnStartup));

  return DriftLocalDatabase.inMemory(
    logger: logger,
    rebuildLocalDatabaseOnStartup: rebuildLocalDatabaseOnStartup,
  );
}

@Riverpod(keepAlive: true)
DriftLocalDatabase driftLocalDatabase(Ref ref, {required String dbName}) {
  final logger = ref.watch(loggerProvider);
  final rebuildLocalDatabaseOnStartup =
      ref.watch(envProvider.select((env) => env.rebuildLocalDatabaseOnStartup));

  return DriftLocalDatabase(
    dbName: dbName,
    logger: logger,
    rebuildLocalDatabaseOnStartup: rebuildLocalDatabaseOnStartup,
  );
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
