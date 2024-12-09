// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:e_commerce/backend/database/drift_database_provider.dart' as i1;
import 'package:e_commerce/features/orders/data/drift_tables/order_item_variant_selection_table.drift.dart'
    as i2;
import 'package:e_commerce/features/orders/data/drift_tables/order_item_variant_selection_table.dart'
    as i3;
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.drift.dart'
    as i4;
import 'package:drift/internal/modular.dart' as i5;
import 'package:e_commerce/features/products/data/drift_tables/product_variant_table.drift.dart'
    as i6;

typedef $$OrderItemVariantSelectionTableTableCreateCompanionBuilder
    = i2.OrderItemVariantSelectionTableCompanion Function({
  required int orderItemId,
  required int variantId,
  i0.Value<int> rowid,
});
typedef $$OrderItemVariantSelectionTableTableUpdateCompanionBuilder
    = i2.OrderItemVariantSelectionTableCompanion Function({
  i0.Value<int> orderItemId,
  i0.Value<int> variantId,
  i0.Value<int> rowid,
});

class $$OrderItemVariantSelectionTableTableFilterComposer extends i0
    .Composer<i0.GeneratedDatabase, i2.$OrderItemVariantSelectionTableTable> {
  $$OrderItemVariantSelectionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i4.$$OrderItemTableTableFilterComposer get orderItemId {
    final i4.$$OrderItemTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderItemId,
        referencedTable: i5.ReadDatabaseContainer($db)
            .resultSet<i4.$OrderItemTableTable>('order_item_table'),
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i4.$$OrderItemTableTableFilterComposer(
              $db: $db,
              $table: i5.ReadDatabaseContainer($db)
                  .resultSet<i4.$OrderItemTableTable>('order_item_table'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  i6.$$ProductVariantTableTableFilterComposer get variantId {
    final i6.$$ProductVariantTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.variantId,
            referencedTable: i5.ReadDatabaseContainer($db)
                .resultSet<i6.$ProductVariantTableTable>(
                    'product_variant_table'),
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                i6.$$ProductVariantTableTableFilterComposer(
                  $db: $db,
                  $table: i5.ReadDatabaseContainer($db)
                      .resultSet<i6.$ProductVariantTableTable>(
                          'product_variant_table'),
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$OrderItemVariantSelectionTableTableOrderingComposer extends i0
    .Composer<i0.GeneratedDatabase, i2.$OrderItemVariantSelectionTableTable> {
  $$OrderItemVariantSelectionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i4.$$OrderItemTableTableOrderingComposer get orderItemId {
    final i4.$$OrderItemTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderItemId,
        referencedTable: i5.ReadDatabaseContainer($db)
            .resultSet<i4.$OrderItemTableTable>('order_item_table'),
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i4.$$OrderItemTableTableOrderingComposer(
              $db: $db,
              $table: i5.ReadDatabaseContainer($db)
                  .resultSet<i4.$OrderItemTableTable>('order_item_table'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  i6.$$ProductVariantTableTableOrderingComposer get variantId {
    final i6.$$ProductVariantTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.variantId,
            referencedTable: i5.ReadDatabaseContainer($db)
                .resultSet<i6.$ProductVariantTableTable>(
                    'product_variant_table'),
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                i6.$$ProductVariantTableTableOrderingComposer(
                  $db: $db,
                  $table: i5.ReadDatabaseContainer($db)
                      .resultSet<i6.$ProductVariantTableTable>(
                          'product_variant_table'),
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$OrderItemVariantSelectionTableTableAnnotationComposer extends i0
    .Composer<i0.GeneratedDatabase, i2.$OrderItemVariantSelectionTableTable> {
  $$OrderItemVariantSelectionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i4.$$OrderItemTableTableAnnotationComposer get orderItemId {
    final i4.$$OrderItemTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.orderItemId,
            referencedTable: i5.ReadDatabaseContainer($db)
                .resultSet<i4.$OrderItemTableTable>('order_item_table'),
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                i4.$$OrderItemTableTableAnnotationComposer(
                  $db: $db,
                  $table: i5.ReadDatabaseContainer($db)
                      .resultSet<i4.$OrderItemTableTable>('order_item_table'),
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  i6.$$ProductVariantTableTableAnnotationComposer get variantId {
    final i6.$$ProductVariantTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.variantId,
            referencedTable: i5.ReadDatabaseContainer($db)
                .resultSet<i6.$ProductVariantTableTable>(
                    'product_variant_table'),
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                i6.$$ProductVariantTableTableAnnotationComposer(
                  $db: $db,
                  $table: i5.ReadDatabaseContainer($db)
                      .resultSet<i6.$ProductVariantTableTable>(
                          'product_variant_table'),
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$OrderItemVariantSelectionTableTableTableManager
    extends i0.RootTableManager<
        i0.GeneratedDatabase,
        i2.$OrderItemVariantSelectionTableTable,
        i2.OrderItemVariantSelectionTableData,
        i2.$$OrderItemVariantSelectionTableTableFilterComposer,
        i2.$$OrderItemVariantSelectionTableTableOrderingComposer,
        i2.$$OrderItemVariantSelectionTableTableAnnotationComposer,
        $$OrderItemVariantSelectionTableTableCreateCompanionBuilder,
        $$OrderItemVariantSelectionTableTableUpdateCompanionBuilder,
        (
          i2.OrderItemVariantSelectionTableData,
          i0.BaseReferences<
              i0.GeneratedDatabase,
              i2.$OrderItemVariantSelectionTableTable,
              i2.OrderItemVariantSelectionTableData>
        ),
        i2.OrderItemVariantSelectionTableData,
        i0.PrefetchHooks Function({bool orderItemId, bool variantId})> {
  $$OrderItemVariantSelectionTableTableTableManager(
      i0.GeneratedDatabase db, i2.$OrderItemVariantSelectionTableTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i2.$$OrderItemVariantSelectionTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              i2.$$OrderItemVariantSelectionTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              i2.$$OrderItemVariantSelectionTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> orderItemId = const i0.Value.absent(),
            i0.Value<int> variantId = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i2.OrderItemVariantSelectionTableCompanion(
            orderItemId: orderItemId,
            variantId: variantId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int orderItemId,
            required int variantId,
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i2.OrderItemVariantSelectionTableCompanion.insert(
            orderItemId: orderItemId,
            variantId: variantId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OrderItemVariantSelectionTableTableProcessedTableManager
    = i0.ProcessedTableManager<
        i0.GeneratedDatabase,
        i2.$OrderItemVariantSelectionTableTable,
        i2.OrderItemVariantSelectionTableData,
        i2.$$OrderItemVariantSelectionTableTableFilterComposer,
        i2.$$OrderItemVariantSelectionTableTableOrderingComposer,
        i2.$$OrderItemVariantSelectionTableTableAnnotationComposer,
        $$OrderItemVariantSelectionTableTableCreateCompanionBuilder,
        $$OrderItemVariantSelectionTableTableUpdateCompanionBuilder,
        (
          i2.OrderItemVariantSelectionTableData,
          i0.BaseReferences<
              i0.GeneratedDatabase,
              i2.$OrderItemVariantSelectionTableTable,
              i2.OrderItemVariantSelectionTableData>
        ),
        i2.OrderItemVariantSelectionTableData,
        i0.PrefetchHooks Function({bool orderItemId, bool variantId})>;
mixin $OrderItemVariantSelectionTableDaoMixin
    on i0.DatabaseAccessor<i1.DriftLocalDatabase> {}

class $OrderItemVariantSelectionTableTable
    extends i3.OrderItemVariantSelectionTable
    with
        i0.TableInfo<$OrderItemVariantSelectionTableTable,
            i2.OrderItemVariantSelectionTableData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemVariantSelectionTableTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _orderItemIdMeta =
      const i0.VerificationMeta('orderItemId');
  @override
  late final i0.GeneratedColumn<int> orderItemId = i0.GeneratedColumn<int>(
      'order_item_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'REFERENCES order_item_table (id) ON DELETE CASCADE'));
  static const i0.VerificationMeta _variantIdMeta =
      const i0.VerificationMeta('variantId');
  @override
  late final i0.GeneratedColumn<int> variantId = i0.GeneratedColumn<int>(
      'variant_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'REFERENCES product_variant_table (id)'));
  @override
  List<i0.GeneratedColumn> get $columns => [orderItemId, variantId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_item_variant_selection_table';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i2.OrderItemVariantSelectionTableData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('order_item_id')) {
      context.handle(
          _orderItemIdMeta,
          orderItemId.isAcceptableOrUnknown(
              data['order_item_id']!, _orderItemIdMeta));
    } else if (isInserting) {
      context.missing(_orderItemIdMeta);
    }
    if (data.containsKey('variant_id')) {
      context.handle(_variantIdMeta,
          variantId.isAcceptableOrUnknown(data['variant_id']!, _variantIdMeta));
    } else if (isInserting) {
      context.missing(_variantIdMeta);
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {orderItemId, variantId};
  @override
  i2.OrderItemVariantSelectionTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i2.OrderItemVariantSelectionTableData(
      orderItemId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}order_item_id'])!,
      variantId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}variant_id'])!,
    );
  }

  @override
  $OrderItemVariantSelectionTableTable createAlias(String alias) {
    return $OrderItemVariantSelectionTableTable(attachedDatabase, alias);
  }
}

class OrderItemVariantSelectionTableData extends i0.DataClass
    implements i0.Insertable<i2.OrderItemVariantSelectionTableData> {
  final int orderItemId;
  final int variantId;
  const OrderItemVariantSelectionTableData(
      {required this.orderItemId, required this.variantId});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['order_item_id'] = i0.Variable<int>(orderItemId);
    map['variant_id'] = i0.Variable<int>(variantId);
    return map;
  }

  i2.OrderItemVariantSelectionTableCompanion toCompanion(bool nullToAbsent) {
    return i2.OrderItemVariantSelectionTableCompanion(
      orderItemId: i0.Value(orderItemId),
      variantId: i0.Value(variantId),
    );
  }

  factory OrderItemVariantSelectionTableData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return OrderItemVariantSelectionTableData(
      orderItemId: serializer.fromJson<int>(json['orderItemId']),
      variantId: serializer.fromJson<int>(json['variantId']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'orderItemId': serializer.toJson<int>(orderItemId),
      'variantId': serializer.toJson<int>(variantId),
    };
  }

  i2.OrderItemVariantSelectionTableData copyWith(
          {int? orderItemId, int? variantId}) =>
      i2.OrderItemVariantSelectionTableData(
        orderItemId: orderItemId ?? this.orderItemId,
        variantId: variantId ?? this.variantId,
      );
  OrderItemVariantSelectionTableData copyWithCompanion(
      i2.OrderItemVariantSelectionTableCompanion data) {
    return OrderItemVariantSelectionTableData(
      orderItemId:
          data.orderItemId.present ? data.orderItemId.value : this.orderItemId,
      variantId: data.variantId.present ? data.variantId.value : this.variantId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemVariantSelectionTableData(')
          ..write('orderItemId: $orderItemId, ')
          ..write('variantId: $variantId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(orderItemId, variantId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i2.OrderItemVariantSelectionTableData &&
          other.orderItemId == this.orderItemId &&
          other.variantId == this.variantId);
}

class OrderItemVariantSelectionTableCompanion
    extends i0.UpdateCompanion<i2.OrderItemVariantSelectionTableData> {
  final i0.Value<int> orderItemId;
  final i0.Value<int> variantId;
  final i0.Value<int> rowid;
  const OrderItemVariantSelectionTableCompanion({
    this.orderItemId = const i0.Value.absent(),
    this.variantId = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  OrderItemVariantSelectionTableCompanion.insert({
    required int orderItemId,
    required int variantId,
    this.rowid = const i0.Value.absent(),
  })  : orderItemId = i0.Value(orderItemId),
        variantId = i0.Value(variantId);
  static i0.Insertable<i2.OrderItemVariantSelectionTableData> custom({
    i0.Expression<int>? orderItemId,
    i0.Expression<int>? variantId,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (orderItemId != null) 'order_item_id': orderItemId,
      if (variantId != null) 'variant_id': variantId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i2.OrderItemVariantSelectionTableCompanion copyWith(
      {i0.Value<int>? orderItemId,
      i0.Value<int>? variantId,
      i0.Value<int>? rowid}) {
    return i2.OrderItemVariantSelectionTableCompanion(
      orderItemId: orderItemId ?? this.orderItemId,
      variantId: variantId ?? this.variantId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (orderItemId.present) {
      map['order_item_id'] = i0.Variable<int>(orderItemId.value);
    }
    if (variantId.present) {
      map['variant_id'] = i0.Variable<int>(variantId.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemVariantSelectionTableCompanion(')
          ..write('orderItemId: $orderItemId, ')
          ..write('variantId: $variantId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}
