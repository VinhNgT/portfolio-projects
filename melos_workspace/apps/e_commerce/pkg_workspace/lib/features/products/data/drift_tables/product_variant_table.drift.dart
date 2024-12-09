// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:e_commerce/backend/database/drift_database_provider.dart' as i1;
import 'package:e_commerce/features/products/data/drift_tables/product_variant_table.drift.dart'
    as i2;
import 'package:e_commerce/features/products/data/drift_tables/product_variant_table.dart'
    as i3;
import 'package:e_commerce/features/products/data/drift_tables/product_variant_group_table.drift.dart'
    as i4;
import 'package:drift/internal/modular.dart' as i5;

typedef $$ProductVariantTableTableCreateCompanionBuilder
    = i2.ProductVariantTableCompanion Function({
  i0.Value<int> id,
  required String name,
  required int groupId,
});
typedef $$ProductVariantTableTableUpdateCompanionBuilder
    = i2.ProductVariantTableCompanion Function({
  i0.Value<int> id,
  i0.Value<String> name,
  i0.Value<int> groupId,
});

class $$ProductVariantTableTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$ProductVariantTableTable> {
  $$ProductVariantTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => i0.ColumnFilters(column));

  i4.$$ProductVariantGroupTableTableFilterComposer get groupId {
    final i4.$$ProductVariantGroupTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.groupId,
            referencedTable: i5.ReadDatabaseContainer($db)
                .resultSet<i4.$ProductVariantGroupTableTable>(
                    'product_variant_group_table'),
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                i4.$$ProductVariantGroupTableTableFilterComposer(
                  $db: $db,
                  $table: i5.ReadDatabaseContainer($db)
                      .resultSet<i4.$ProductVariantGroupTableTable>(
                          'product_variant_group_table'),
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$ProductVariantTableTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$ProductVariantTableTable> {
  $$ProductVariantTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => i0.ColumnOrderings(column));

  i4.$$ProductVariantGroupTableTableOrderingComposer get groupId {
    final i4.$$ProductVariantGroupTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.groupId,
            referencedTable: i5.ReadDatabaseContainer($db)
                .resultSet<i4.$ProductVariantGroupTableTable>(
                    'product_variant_group_table'),
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                i4.$$ProductVariantGroupTableTableOrderingComposer(
                  $db: $db,
                  $table: i5.ReadDatabaseContainer($db)
                      .resultSet<i4.$ProductVariantGroupTableTable>(
                          'product_variant_group_table'),
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$ProductVariantTableTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$ProductVariantTableTable> {
  $$ProductVariantTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  i4.$$ProductVariantGroupTableTableAnnotationComposer get groupId {
    final i4.$$ProductVariantGroupTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.groupId,
            referencedTable: i5.ReadDatabaseContainer($db)
                .resultSet<i4.$ProductVariantGroupTableTable>(
                    'product_variant_group_table'),
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                i4.$$ProductVariantGroupTableTableAnnotationComposer(
                  $db: $db,
                  $table: i5.ReadDatabaseContainer($db)
                      .resultSet<i4.$ProductVariantGroupTableTable>(
                          'product_variant_group_table'),
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$ProductVariantTableTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.$ProductVariantTableTable,
    i2.ProductVariantTableData,
    i2.$$ProductVariantTableTableFilterComposer,
    i2.$$ProductVariantTableTableOrderingComposer,
    i2.$$ProductVariantTableTableAnnotationComposer,
    $$ProductVariantTableTableCreateCompanionBuilder,
    $$ProductVariantTableTableUpdateCompanionBuilder,
    (
      i2.ProductVariantTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i2.$ProductVariantTableTable,
          i2.ProductVariantTableData>
    ),
    i2.ProductVariantTableData,
    i0.PrefetchHooks Function({bool groupId})> {
  $$ProductVariantTableTableTableManager(
      i0.GeneratedDatabase db, i2.$ProductVariantTableTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => i2
              .$$ProductVariantTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i2.$$ProductVariantTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              i2.$$ProductVariantTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String> name = const i0.Value.absent(),
            i0.Value<int> groupId = const i0.Value.absent(),
          }) =>
              i2.ProductVariantTableCompanion(
            id: id,
            name: name,
            groupId: groupId,
          ),
          createCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            required String name,
            required int groupId,
          }) =>
              i2.ProductVariantTableCompanion.insert(
            id: id,
            name: name,
            groupId: groupId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductVariantTableTableProcessedTableManager
    = i0.ProcessedTableManager<
        i0.GeneratedDatabase,
        i2.$ProductVariantTableTable,
        i2.ProductVariantTableData,
        i2.$$ProductVariantTableTableFilterComposer,
        i2.$$ProductVariantTableTableOrderingComposer,
        i2.$$ProductVariantTableTableAnnotationComposer,
        $$ProductVariantTableTableCreateCompanionBuilder,
        $$ProductVariantTableTableUpdateCompanionBuilder,
        (
          i2.ProductVariantTableData,
          i0.BaseReferences<i0.GeneratedDatabase, i2.$ProductVariantTableTable,
              i2.ProductVariantTableData>
        ),
        i2.ProductVariantTableData,
        i0.PrefetchHooks Function({bool groupId})>;
mixin $ProductVariantTableDaoMixin
    on i0.DatabaseAccessor<i1.DriftLocalDatabase> {}

class $ProductVariantTableTable extends i3.ProductVariantTable
    with i0.TableInfo<$ProductVariantTableTable, i2.ProductVariantTableData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductVariantTableTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const i0.VerificationMeta _nameMeta =
      const i0.VerificationMeta('name');
  @override
  late final i0.GeneratedColumn<String> name = i0.GeneratedColumn<String>(
      'name', aliasedName, false,
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _groupIdMeta =
      const i0.VerificationMeta('groupId');
  @override
  late final i0.GeneratedColumn<int> groupId = i0.GeneratedColumn<int>(
      'group_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'REFERENCES product_variant_group_table (id) ON DELETE CASCADE'));
  @override
  List<i0.GeneratedColumn> get $columns => [id, name, groupId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_variant_table';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i2.ProductVariantTableData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i2.ProductVariantTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i2.ProductVariantTableData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}name'])!,
      groupId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}group_id'])!,
    );
  }

  @override
  $ProductVariantTableTable createAlias(String alias) {
    return $ProductVariantTableTable(attachedDatabase, alias);
  }
}

class ProductVariantTableData extends i0.DataClass
    implements i0.Insertable<i2.ProductVariantTableData> {
  final int id;
  final String name;
  final int groupId;
  const ProductVariantTableData(
      {required this.id, required this.name, required this.groupId});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['name'] = i0.Variable<String>(name);
    map['group_id'] = i0.Variable<int>(groupId);
    return map;
  }

  i2.ProductVariantTableCompanion toCompanion(bool nullToAbsent) {
    return i2.ProductVariantTableCompanion(
      id: i0.Value(id),
      name: i0.Value(name),
      groupId: i0.Value(groupId),
    );
  }

  factory ProductVariantTableData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ProductVariantTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      groupId: serializer.fromJson<int>(json['groupId']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'groupId': serializer.toJson<int>(groupId),
    };
  }

  i2.ProductVariantTableData copyWith({int? id, String? name, int? groupId}) =>
      i2.ProductVariantTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        groupId: groupId ?? this.groupId,
      );
  ProductVariantTableData copyWithCompanion(
      i2.ProductVariantTableCompanion data) {
    return ProductVariantTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductVariantTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('groupId: $groupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, groupId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i2.ProductVariantTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.groupId == this.groupId);
}

class ProductVariantTableCompanion
    extends i0.UpdateCompanion<i2.ProductVariantTableData> {
  final i0.Value<int> id;
  final i0.Value<String> name;
  final i0.Value<int> groupId;
  const ProductVariantTableCompanion({
    this.id = const i0.Value.absent(),
    this.name = const i0.Value.absent(),
    this.groupId = const i0.Value.absent(),
  });
  ProductVariantTableCompanion.insert({
    this.id = const i0.Value.absent(),
    required String name,
    required int groupId,
  })  : name = i0.Value(name),
        groupId = i0.Value(groupId);
  static i0.Insertable<i2.ProductVariantTableData> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? name,
    i0.Expression<int>? groupId,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (groupId != null) 'group_id': groupId,
    });
  }

  i2.ProductVariantTableCompanion copyWith(
      {i0.Value<int>? id, i0.Value<String>? name, i0.Value<int>? groupId}) {
    return i2.ProductVariantTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      groupId: groupId ?? this.groupId,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = i0.Variable<String>(name.value);
    }
    if (groupId.present) {
      map['group_id'] = i0.Variable<int>(groupId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductVariantTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('groupId: $groupId')
          ..write(')'))
        .toString();
  }
}
