// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:e_commerce/backend/database/drift_database_provider.dart' as i1;
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.drift.dart'
    as i2;
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.dart'
    as i3;
import 'package:drift/src/runtime/query_builder/query_builder.dart' as i4;

typedef $$OrderItemTableTableCreateCompanionBuilder = i2.OrderItemTableCompanion
    Function({
  i0.Value<int> id,
  required int quantity,
});
typedef $$OrderItemTableTableUpdateCompanionBuilder = i2.OrderItemTableCompanion
    Function({
  i0.Value<int> id,
  i0.Value<int> quantity,
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
    i0.PrefetchHooks Function()> {
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
          }) =>
              i2.OrderItemTableCompanion(
            id: id,
            quantity: quantity,
          ),
          createCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            required int quantity,
          }) =>
              i2.OrderItemTableCompanion.insert(
            id: id,
            quantity: quantity,
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
    i0.PrefetchHooks Function()>;
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
  @override
  List<i0.GeneratedColumn> get $columns => [id, quantity];
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
  const OrderItemTableData({required this.id, required this.quantity});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['quantity'] = i0.Variable<int>(quantity);
    return map;
  }

  i2.OrderItemTableCompanion toCompanion(bool nullToAbsent) {
    return i2.OrderItemTableCompanion(
      id: i0.Value(id),
      quantity: i0.Value(quantity),
    );
  }

  factory OrderItemTableData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return OrderItemTableData(
      id: serializer.fromJson<int>(json['id']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  i2.OrderItemTableData copyWith({int? id, int? quantity}) =>
      i2.OrderItemTableData(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
      );
  OrderItemTableData copyWithCompanion(i2.OrderItemTableCompanion data) {
    return OrderItemTableData(
      id: data.id.present ? data.id.value : this.id,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemTableData(')
          ..write('id: $id, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i2.OrderItemTableData &&
          other.id == this.id &&
          other.quantity == this.quantity);
}

class OrderItemTableCompanion
    extends i0.UpdateCompanion<i2.OrderItemTableData> {
  final i0.Value<int> id;
  final i0.Value<int> quantity;
  const OrderItemTableCompanion({
    this.id = const i0.Value.absent(),
    this.quantity = const i0.Value.absent(),
  });
  OrderItemTableCompanion.insert({
    this.id = const i0.Value.absent(),
    required int quantity,
  }) : quantity = i0.Value(quantity);
  static i0.Insertable<i2.OrderItemTableData> custom({
    i0.Expression<int>? id,
    i0.Expression<int>? quantity,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (quantity != null) 'quantity': quantity,
    });
  }

  i2.OrderItemTableCompanion copyWith(
      {i0.Value<int>? id, i0.Value<int>? quantity}) {
    return i2.OrderItemTableCompanion(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemTableCompanion(')
          ..write('id: $id, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
}
