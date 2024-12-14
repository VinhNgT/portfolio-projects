// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:e_commerce/features/products/data/drift_tables/product_table.drift.dart'
    as i1;
import 'package:e_commerce/features/products/data/drift_tables/product_variant_group_table.drift.dart'
    as i2;
import 'package:e_commerce/features/products/data/drift_tables/product_variant_table.drift.dart'
    as i3;
import 'package:e_commerce/features/cart/data/drift_tables/cart_table.drift.dart'
    as i4;
import 'package:e_commerce/features/orders/data/drift_tables/order_table.drift.dart'
    as i5;
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.drift.dart'
    as i6;
import 'package:e_commerce/features/cart/data/drift_tables/cart_item_table.drift.dart'
    as i7;
import 'package:e_commerce/features/orders/data/drift_tables/order_item_variant_selection_table.drift.dart'
    as i8;
import 'package:e_commerce/features/products/data/drift_tables/product_table.dart'
    as i9;
import 'package:e_commerce/backend/database/drift_database_provider.dart'
    as i10;
import 'package:e_commerce/features/products/data/drift_tables/product_variant_table.dart'
    as i11;
import 'package:e_commerce/features/products/data/drift_tables/product_variant_group_table.dart'
    as i12;
import 'package:e_commerce/features/cart/data/drift_tables/cart_table.dart'
    as i13;
import 'package:e_commerce/features/cart/data/drift_tables/cart_item_table.dart'
    as i14;
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.dart'
    as i15;
import 'package:e_commerce/features/orders/data/drift_tables/order_item_variant_selection_table.dart'
    as i16;
import 'package:e_commerce/features/orders/data/drift_tables/order_table.dart'
    as i17;

abstract class $DriftLocalDatabase extends i0.GeneratedDatabase {
  $DriftLocalDatabase(i0.QueryExecutor e) : super(e);
  $DriftLocalDatabaseManager get managers => $DriftLocalDatabaseManager(this);
  late final i1.$ProductTableTable productTable = i1.$ProductTableTable(this);
  late final i2.$ProductVariantGroupTableTable productVariantGroupTable =
      i2.$ProductVariantGroupTableTable(this);
  late final i3.$ProductVariantTableTable productVariantTable =
      i3.$ProductVariantTableTable(this);
  late final i4.$CartTableTable cartTable = i4.$CartTableTable(this);
  late final i5.$OrderTableTable orderTable = i5.$OrderTableTable(this);
  late final i6.$OrderItemTableTable orderItemTable =
      i6.$OrderItemTableTable(this);
  late final i7.$CartItemTableTable cartItemTable =
      i7.$CartItemTableTable(this);
  late final i8.$OrderItemVariantSelectionTableTable
      orderItemVariantSelectionTable =
      i8.$OrderItemVariantSelectionTableTable(this);
  late final i9.ProductTableDao productTableDao =
      i9.ProductTableDao(this as i10.DriftLocalDatabase);
  late final i11.ProductVariantTableDao productVariantTableDao =
      i11.ProductVariantTableDao(this as i10.DriftLocalDatabase);
  late final i12.ProductVariantGroupTableDao productVariantGroupTableDao =
      i12.ProductVariantGroupTableDao(this as i10.DriftLocalDatabase);
  late final i13.CartTableDao cartTableDao =
      i13.CartTableDao(this as i10.DriftLocalDatabase);
  late final i14.CartItemTableDao cartItemTableDao =
      i14.CartItemTableDao(this as i10.DriftLocalDatabase);
  late final i15.OrderItemTableDao orderItemTableDao =
      i15.OrderItemTableDao(this as i10.DriftLocalDatabase);
  late final i16.OrderItemVariantSelectionTableDao
      orderItemVariantSelectionTableDao =
      i16.OrderItemVariantSelectionTableDao(this as i10.DriftLocalDatabase);
  late final i17.OrderTableDao orderTableDao =
      i17.OrderTableDao(this as i10.DriftLocalDatabase);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [
        productTable,
        productVariantGroupTable,
        productVariantTable,
        cartTable,
        orderTable,
        orderItemTable,
        cartItemTable,
        orderItemVariantSelectionTable
      ];
  @override
  i0.StreamQueryUpdateRules get streamUpdateRules =>
      const i0.StreamQueryUpdateRules(
        [
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('product_table',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('product_variant_group_table',
                  kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('product_variant_group_table',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('product_variant_table',
                  kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('order_table',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('order_item_table', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('order_item_table',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('cart_item_table', kind: i0.UpdateKind.delete),
            ],
          ),
          i0.WritePropagation(
            on: i0.TableUpdateQuery.onTableName('order_item_table',
                limitUpdateKind: i0.UpdateKind.delete),
            result: [
              i0.TableUpdate('order_item_variant_selection_table',
                  kind: i0.UpdateKind.delete),
            ],
          ),
        ],
      );
}

class $DriftLocalDatabaseManager {
  final $DriftLocalDatabase _db;
  $DriftLocalDatabaseManager(this._db);
  i1.$$ProductTableTableTableManager get productTable =>
      i1.$$ProductTableTableTableManager(_db, _db.productTable);
  i2.$$ProductVariantGroupTableTableTableManager get productVariantGroupTable =>
      i2.$$ProductVariantGroupTableTableTableManager(
          _db, _db.productVariantGroupTable);
  i3.$$ProductVariantTableTableTableManager get productVariantTable =>
      i3.$$ProductVariantTableTableTableManager(_db, _db.productVariantTable);
  i4.$$CartTableTableTableManager get cartTable =>
      i4.$$CartTableTableTableManager(_db, _db.cartTable);
  i5.$$OrderTableTableTableManager get orderTable =>
      i5.$$OrderTableTableTableManager(_db, _db.orderTable);
  i6.$$OrderItemTableTableTableManager get orderItemTable =>
      i6.$$OrderItemTableTableTableManager(_db, _db.orderItemTable);
  i7.$$CartItemTableTableTableManager get cartItemTable =>
      i7.$$CartItemTableTableTableManager(_db, _db.cartItemTable);
  i8.$$OrderItemVariantSelectionTableTableTableManager
      get orderItemVariantSelectionTable =>
          i8.$$OrderItemVariantSelectionTableTableTableManager(
              _db, _db.orderItemVariantSelectionTable);
}
