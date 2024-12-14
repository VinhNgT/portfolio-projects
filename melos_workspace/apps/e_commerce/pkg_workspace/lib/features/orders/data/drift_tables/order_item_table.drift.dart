// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:e_commerce/backend/database/drift_database_provider.dart' as i1;
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.drift.dart'
    as i2;
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.dart'
    as i3;
import 'package:drift/src/runtime/query_builder/query_builder.dart' as i4;
import 'package:e_commerce/features/orders/data/drift_tables/order_table.drift.dart'
    as i5;
import 'package:drift/internal/modular.dart' as i6;

typedef $$OrderItemTableTableCreateCompanionBuilder = i2.OrderItemTableCompanion
    Function({
  i0.Value<int> id,
  required int quantity,
  i0.Value<int?> orderId,
});
typedef $$OrderItemTableTableUpdateCompanionBuilder = i2.OrderItemTableCompanion
    Function({
  i0.Value<int> id,
  i0.Value<int> quantity,
  i0.Value<int?> orderId,
});

class $$OrderItemTableTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$OrderItemTableTable> {
  $$OrderItemTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => i0.ColumnFilters(column));

  i5.$$OrderTableTableFilterComposer get orderId {
    final i5.$$OrderTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: i6.ReadDatabaseContainer($db)
            .resultSet<i5.$OrderTableTable>('order_table'),
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i5.$$OrderTableTableFilterComposer(
              $db: $db,
              $table: i6.ReadDatabaseContainer($db)
                  .resultSet<i5.$OrderTableTable>('order_table'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OrderItemTableTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$OrderItemTableTable> {
  $$OrderItemTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => i0.ColumnOrderings(column));

  i5.$$OrderTableTableOrderingComposer get orderId {
    final i5.$$OrderTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: i6.ReadDatabaseContainer($db)
            .resultSet<i5.$OrderTableTable>('order_table'),
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i5.$$OrderTableTableOrderingComposer(
              $db: $db,
              $table: i6.ReadDatabaseContainer($db)
                  .resultSet<i5.$OrderTableTable>('order_table'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OrderItemTableTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$OrderItemTableTable> {
  $$OrderItemTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  i5.$$OrderTableTableAnnotationComposer get orderId {
    final i5.$$OrderTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: i6.ReadDatabaseContainer($db)
            .resultSet<i5.$OrderTableTable>('order_table'),
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i5.$$OrderTableTableAnnotationComposer(
              $db: $db,
              $table: i6.ReadDatabaseContainer($db)
                  .resultSet<i5.$OrderTableTable>('order_table'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OrderItemTableTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.$OrderItemTableTable,
    i2.OrderItemTableData,
    i2.$$OrderItemTableTableFilterComposer,
    i2.$$OrderItemTableTableOrderingComposer,
    i2.$$OrderItemTableTableAnnotationComposer,
    $$OrderItemTableTableCreateCompanionBuilder,
    $$OrderItemTableTableUpdateCompanionBuilder,
    (
      i2.OrderItemTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i2.$OrderItemTableTable,
          i2.OrderItemTableData>
    ),
    i2.OrderItemTableData,
    i0.PrefetchHooks Function({bool orderId})> {
  $$OrderItemTableTableTableManager(
      i0.GeneratedDatabase db, i2.$OrderItemTableTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i2.$$OrderItemTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i2.$$OrderItemTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => i2
              .$$OrderItemTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<int> quantity = const i0.Value.absent(),
            i0.Value<int?> orderId = const i0.Value.absent(),
          }) =>
              i2.OrderItemTableCompanion(
            id: id,
            quantity: quantity,
            orderId: orderId,
          ),
          createCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            required int quantity,
            i0.Value<int?> orderId = const i0.Value.absent(),
          }) =>
              i2.OrderItemTableCompanion.insert(
            id: id,
            quantity: quantity,
            orderId: orderId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OrderItemTableTableProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i2.$OrderItemTableTable,
    i2.OrderItemTableData,
    i2.$$OrderItemTableTableFilterComposer,
    i2.$$OrderItemTableTableOrderingComposer,
    i2.$$OrderItemTableTableAnnotationComposer,
    $$OrderItemTableTableCreateCompanionBuilder,
    $$OrderItemTableTableUpdateCompanionBuilder,
    (
      i2.OrderItemTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i2.$OrderItemTableTable,
          i2.OrderItemTableData>
    ),
    i2.OrderItemTableData,
    i0.PrefetchHooks Function({bool orderId})>;
mixin $OrderItemTableDaoMixin on i0.DatabaseAccessor<i1.DriftLocalDatabase> {}

class $OrderItemTableTable extends i3.OrderItemTable
    with i0.TableInfo<$OrderItemTableTable, i2.OrderItemTableData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemTableTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const i0.VerificationMeta _quantityMeta =
      const i0.VerificationMeta('quantity');
  @override
  late final i0.GeneratedColumn<int> quantity = i0.GeneratedColumn<int>(
      'quantity', aliasedName, false,
      check: () => i4.ComparableExpr(quantity).isBiggerOrEqualValue(0),
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true);
  static const i0.VerificationMeta _orderIdMeta =
      const i0.VerificationMeta('orderId');
  @override
  late final i0.GeneratedColumn<int> orderId = i0.GeneratedColumn<int>(
      'order_id', aliasedName, true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'REFERENCES order_table (id) ON DELETE CASCADE'));
  @override
  List<i0.GeneratedColumn> get $columns => [id, quantity, orderId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_item_table';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i2.OrderItemTableData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i2.OrderItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i2.OrderItemTableData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      quantity: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      orderId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}order_id']),
    );
  }

  @override
  $OrderItemTableTable createAlias(String alias) {
    return $OrderItemTableTable(attachedDatabase, alias);
  }
}

class OrderItemTableData extends i0.DataClass
    implements i0.Insertable<i2.OrderItemTableData> {
  final int id;
  final int quantity;
  final int? orderId;
  const OrderItemTableData(
      {required this.id, required this.quantity, this.orderId});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['quantity'] = i0.Variable<int>(quantity);
    if (!nullToAbsent || orderId != null) {
      map['order_id'] = i0.Variable<int>(orderId);
    }
    return map;
  }

  i2.OrderItemTableCompanion toCompanion(bool nullToAbsent) {
    return i2.OrderItemTableCompanion(
      id: i0.Value(id),
      quantity: i0.Value(quantity),
      orderId: orderId == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(orderId),
    );
  }

  factory OrderItemTableData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return OrderItemTableData(
      id: serializer.fromJson<int>(json['id']),
      quantity: serializer.fromJson<int>(json['quantity']),
      orderId: serializer.fromJson<int?>(json['orderId']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quantity': serializer.toJson<int>(quantity),
      'orderId': serializer.toJson<int?>(orderId),
    };
  }

  i2.OrderItemTableData copyWith(
          {int? id,
          int? quantity,
          i0.Value<int?> orderId = const i0.Value.absent()}) =>
      i2.OrderItemTableData(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        orderId: orderId.present ? orderId.value : this.orderId,
      );
  OrderItemTableData copyWithCompanion(i2.OrderItemTableCompanion data) {
    return OrderItemTableData(
      id: data.id.present ? data.id.value : this.id,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemTableData(')
          ..write('id: $id, ')
          ..write('quantity: $quantity, ')
          ..write('orderId: $orderId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, quantity, orderId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i2.OrderItemTableData &&
          other.id == this.id &&
          other.quantity == this.quantity &&
          other.orderId == this.orderId);
}

class OrderItemTableCompanion
    extends i0.UpdateCompanion<i2.OrderItemTableData> {
  final i0.Value<int> id;
  final i0.Value<int> quantity;
  final i0.Value<int?> orderId;
  const OrderItemTableCompanion({
    this.id = const i0.Value.absent(),
    this.quantity = const i0.Value.absent(),
    this.orderId = const i0.Value.absent(),
  });
  OrderItemTableCompanion.insert({
    this.id = const i0.Value.absent(),
    required int quantity,
    this.orderId = const i0.Value.absent(),
  }) : quantity = i0.Value(quantity);
  static i0.Insertable<i2.OrderItemTableData> custom({
    i0.Expression<int>? id,
    i0.Expression<int>? quantity,
    i0.Expression<int>? orderId,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (quantity != null) 'quantity': quantity,
      if (orderId != null) 'order_id': orderId,
    });
  }

  i2.OrderItemTableCompanion copyWith(
      {i0.Value<int>? id, i0.Value<int>? quantity, i0.Value<int?>? orderId}) {
    return i2.OrderItemTableCompanion(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      orderId: orderId ?? this.orderId,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (quantity.present) {
      map['quantity'] = i0.Variable<int>(quantity.value);
    }
    if (orderId.present) {
      map['order_id'] = i0.Variable<int>(orderId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemTableCompanion(')
          ..write('id: $id, ')
          ..write('quantity: $quantity, ')
          ..write('orderId: $orderId')
          ..write(')'))
        .toString();
  }
}
