// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:e_commerce/backend/database/drift_database_provider.dart' as i1;
import 'package:e_commerce/features/orders/data/drift_tables/order_table.drift.dart'
    as i2;
import 'package:e_commerce/features/orders/domain/order.dart' as i3;
import 'package:e_commerce/features/orders/data/drift_tables/order_table.dart'
    as i4;

typedef $$OrderTableTableCreateCompanionBuilder = i2.OrderTableCompanion
    Function({
  i0.Value<int> id,
  required String receiveAddress,
  required i3.OrderStatus status,
});
typedef $$OrderTableTableUpdateCompanionBuilder = i2.OrderTableCompanion
    Function({
  i0.Value<int> id,
  i0.Value<String> receiveAddress,
  i0.Value<i3.OrderStatus> status,
});

class $$OrderTableTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$OrderTableTable> {
  $$OrderTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get receiveAddress => $composableBuilder(
      column: $table.receiveAddress,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<i3.OrderStatus, i3.OrderStatus, String>
      get status => $composableBuilder(
          column: $table.status,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));
}

class $$OrderTableTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$OrderTableTable> {
  $$OrderTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get receiveAddress => $composableBuilder(
      column: $table.receiveAddress,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => i0.ColumnOrderings(column));
}

class $$OrderTableTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$OrderTableTable> {
  $$OrderTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get receiveAddress => $composableBuilder(
      column: $table.receiveAddress, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<i3.OrderStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$OrderTableTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.$OrderTableTable,
    i2.OrderTableData,
    i2.$$OrderTableTableFilterComposer,
    i2.$$OrderTableTableOrderingComposer,
    i2.$$OrderTableTableAnnotationComposer,
    $$OrderTableTableCreateCompanionBuilder,
    $$OrderTableTableUpdateCompanionBuilder,
    (
      i2.OrderTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i2.$OrderTableTable,
          i2.OrderTableData>
    ),
    i2.OrderTableData,
    i0.PrefetchHooks Function()> {
  $$OrderTableTableTableManager(
      i0.GeneratedDatabase db, i2.$OrderTableTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i2.$$OrderTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i2.$$OrderTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i2.$$OrderTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String> receiveAddress = const i0.Value.absent(),
            i0.Value<i3.OrderStatus> status = const i0.Value.absent(),
          }) =>
              i2.OrderTableCompanion(
            id: id,
            receiveAddress: receiveAddress,
            status: status,
          ),
          createCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            required String receiveAddress,
            required i3.OrderStatus status,
          }) =>
              i2.OrderTableCompanion.insert(
            id: id,
            receiveAddress: receiveAddress,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OrderTableTableProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i2.$OrderTableTable,
    i2.OrderTableData,
    i2.$$OrderTableTableFilterComposer,
    i2.$$OrderTableTableOrderingComposer,
    i2.$$OrderTableTableAnnotationComposer,
    $$OrderTableTableCreateCompanionBuilder,
    $$OrderTableTableUpdateCompanionBuilder,
    (
      i2.OrderTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i2.$OrderTableTable,
          i2.OrderTableData>
    ),
    i2.OrderTableData,
    i0.PrefetchHooks Function()>;
mixin $OrderTableDaoMixin on i0.DatabaseAccessor<i1.DriftLocalDatabase> {}

class $OrderTableTable extends i4.OrderTable
    with i0.TableInfo<$OrderTableTable, i2.OrderTableData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderTableTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const i0.VerificationMeta _receiveAddressMeta =
      const i0.VerificationMeta('receiveAddress');
  @override
  late final i0.GeneratedColumn<String> receiveAddress =
      i0.GeneratedColumn<String>('receive_address', aliasedName, false,
          type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _statusMeta =
      const i0.VerificationMeta('status');
  @override
  late final i0.GeneratedColumnWithTypeConverter<i3.OrderStatus, String>
      status = i0.GeneratedColumn<String>('status', aliasedName, false,
              type: i0.DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<i3.OrderStatus>(i2.$OrderTableTable.$converterstatus);
  @override
  List<i0.GeneratedColumn> get $columns => [id, receiveAddress, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_table';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i2.OrderTableData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('receive_address')) {
      context.handle(
          _receiveAddressMeta,
          receiveAddress.isAcceptableOrUnknown(
              data['receive_address']!, _receiveAddressMeta));
    } else if (isInserting) {
      context.missing(_receiveAddressMeta);
    }
    context.handle(_statusMeta, const i0.VerificationResult.success());
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i2.OrderTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i2.OrderTableData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      receiveAddress: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}receive_address'])!,
      status: i2.$OrderTableTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}status'])!),
    );
  }

  @override
  $OrderTableTable createAlias(String alias) {
    return $OrderTableTable(attachedDatabase, alias);
  }

  static i0.JsonTypeConverter2<i3.OrderStatus, String, String>
      $converterstatus =
      const i0.EnumNameConverter<i3.OrderStatus>(i3.OrderStatus.values);
}

class OrderTableData extends i0.DataClass
    implements i0.Insertable<i2.OrderTableData> {
  final int id;
  final String receiveAddress;
  final i3.OrderStatus status;
  const OrderTableData(
      {required this.id, required this.receiveAddress, required this.status});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['receive_address'] = i0.Variable<String>(receiveAddress);
    {
      map['status'] = i0.Variable<String>(
          i2.$OrderTableTable.$converterstatus.toSql(status));
    }
    return map;
  }

  i2.OrderTableCompanion toCompanion(bool nullToAbsent) {
    return i2.OrderTableCompanion(
      id: i0.Value(id),
      receiveAddress: i0.Value(receiveAddress),
      status: i0.Value(status),
    );
  }

  factory OrderTableData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return OrderTableData(
      id: serializer.fromJson<int>(json['id']),
      receiveAddress: serializer.fromJson<String>(json['receiveAddress']),
      status: i2.$OrderTableTable.$converterstatus
          .fromJson(serializer.fromJson<String>(json['status'])),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'receiveAddress': serializer.toJson<String>(receiveAddress),
      'status': serializer
          .toJson<String>(i2.$OrderTableTable.$converterstatus.toJson(status)),
    };
  }

  i2.OrderTableData copyWith(
          {int? id, String? receiveAddress, i3.OrderStatus? status}) =>
      i2.OrderTableData(
        id: id ?? this.id,
        receiveAddress: receiveAddress ?? this.receiveAddress,
        status: status ?? this.status,
      );
  OrderTableData copyWithCompanion(i2.OrderTableCompanion data) {
    return OrderTableData(
      id: data.id.present ? data.id.value : this.id,
      receiveAddress: data.receiveAddress.present
          ? data.receiveAddress.value
          : this.receiveAddress,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderTableData(')
          ..write('id: $id, ')
          ..write('receiveAddress: $receiveAddress, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, receiveAddress, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i2.OrderTableData &&
          other.id == this.id &&
          other.receiveAddress == this.receiveAddress &&
          other.status == this.status);
}

class OrderTableCompanion extends i0.UpdateCompanion<i2.OrderTableData> {
  final i0.Value<int> id;
  final i0.Value<String> receiveAddress;
  final i0.Value<i3.OrderStatus> status;
  const OrderTableCompanion({
    this.id = const i0.Value.absent(),
    this.receiveAddress = const i0.Value.absent(),
    this.status = const i0.Value.absent(),
  });
  OrderTableCompanion.insert({
    this.id = const i0.Value.absent(),
    required String receiveAddress,
    required i3.OrderStatus status,
  })  : receiveAddress = i0.Value(receiveAddress),
        status = i0.Value(status);
  static i0.Insertable<i2.OrderTableData> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? receiveAddress,
    i0.Expression<String>? status,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (receiveAddress != null) 'receive_address': receiveAddress,
      if (status != null) 'status': status,
    });
  }

  i2.OrderTableCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String>? receiveAddress,
      i0.Value<i3.OrderStatus>? status}) {
    return i2.OrderTableCompanion(
      id: id ?? this.id,
      receiveAddress: receiveAddress ?? this.receiveAddress,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (receiveAddress.present) {
      map['receive_address'] = i0.Variable<String>(receiveAddress.value);
    }
    if (status.present) {
      map['status'] = i0.Variable<String>(
          i2.$OrderTableTable.$converterstatus.toSql(status.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderTableCompanion(')
          ..write('id: $id, ')
          ..write('receiveAddress: $receiveAddress, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}
