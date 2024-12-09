// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:e_commerce/backend/database/drift_database_provider.dart' as i1;
import 'package:e_commerce/features/cart/data/drift_tables/cart_table.drift.dart'
    as i2;
import 'package:e_commerce/features/cart/data/drift_tables/cart_table.dart'
    as i3;

typedef $$CartTableTableCreateCompanionBuilder = i2.CartTableCompanion
    Function({
  i0.Value<int> id,
});
typedef $$CartTableTableUpdateCompanionBuilder = i2.CartTableCompanion
    Function({
  i0.Value<int> id,
});

class $$CartTableTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$CartTableTable> {
  $$CartTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));
}

class $$CartTableTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$CartTableTable> {
  $$CartTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));
}

class $$CartTableTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$CartTableTable> {
  $$CartTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);
}

class $$CartTableTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.$CartTableTable,
    i2.CartTableData,
    i2.$$CartTableTableFilterComposer,
    i2.$$CartTableTableOrderingComposer,
    i2.$$CartTableTableAnnotationComposer,
    $$CartTableTableCreateCompanionBuilder,
    $$CartTableTableUpdateCompanionBuilder,
    (
      i2.CartTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i2.$CartTableTable,
          i2.CartTableData>
    ),
    i2.CartTableData,
    i0.PrefetchHooks Function()> {
  $$CartTableTableTableManager(
      i0.GeneratedDatabase db, i2.$CartTableTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i2.$$CartTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i2.$$CartTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i2.$$CartTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
          }) =>
              i2.CartTableCompanion(
            id: id,
          ),
          createCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
          }) =>
              i2.CartTableCompanion.insert(
            id: id,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CartTableTableProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i2.$CartTableTable,
    i2.CartTableData,
    i2.$$CartTableTableFilterComposer,
    i2.$$CartTableTableOrderingComposer,
    i2.$$CartTableTableAnnotationComposer,
    $$CartTableTableCreateCompanionBuilder,
    $$CartTableTableUpdateCompanionBuilder,
    (
      i2.CartTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i2.$CartTableTable,
          i2.CartTableData>
    ),
    i2.CartTableData,
    i0.PrefetchHooks Function()>;
mixin $CartTableDaoMixin on i0.DatabaseAccessor<i1.DriftLocalDatabase> {}

class $CartTableTable extends i3.CartTable
    with i0.TableInfo<$CartTableTable, i2.CartTableData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartTableTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  List<i0.GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_table';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i2.CartTableData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i2.CartTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i2.CartTableData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $CartTableTable createAlias(String alias) {
    return $CartTableTable(attachedDatabase, alias);
  }
}

class CartTableData extends i0.DataClass
    implements i0.Insertable<i2.CartTableData> {
  final int id;
  const CartTableData({required this.id});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    return map;
  }

  i2.CartTableCompanion toCompanion(bool nullToAbsent) {
    return i2.CartTableCompanion(
      id: i0.Value(id),
    );
  }

  factory CartTableData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CartTableData(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  i2.CartTableData copyWith({int? id}) => i2.CartTableData(
        id: id ?? this.id,
      );
  CartTableData copyWithCompanion(i2.CartTableCompanion data) {
    return CartTableData(
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartTableData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i2.CartTableData && other.id == this.id);
}

class CartTableCompanion extends i0.UpdateCompanion<i2.CartTableData> {
  final i0.Value<int> id;
  const CartTableCompanion({
    this.id = const i0.Value.absent(),
  });
  CartTableCompanion.insert({
    this.id = const i0.Value.absent(),
  });
  static i0.Insertable<i2.CartTableData> custom({
    i0.Expression<int>? id,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  i2.CartTableCompanion copyWith({i0.Value<int>? id}) {
    return i2.CartTableCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartTableCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}
