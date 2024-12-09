// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:e_commerce/backend/cache/drift_cache_database.drift.dart' as i1;
import 'package:e_commerce/backend/cache/drift_cache_database.dart' as i2;

typedef $$CacheEntryTableTableCreateCompanionBuilder
    = i1.CacheEntryTableCompanion Function({
  required String queryKey,
  required String queryData,
  required int createdAtMs,
  i0.Value<int?> durationMs,
  i0.Value<int> rowid,
});
typedef $$CacheEntryTableTableUpdateCompanionBuilder
    = i1.CacheEntryTableCompanion Function({
  i0.Value<String> queryKey,
  i0.Value<String> queryData,
  i0.Value<int> createdAtMs,
  i0.Value<int?> durationMs,
  i0.Value<int> rowid,
});

class $$CacheEntryTableTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$CacheEntryTableTable> {
  $$CacheEntryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get queryKey => $composableBuilder(
      column: $table.queryKey, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get queryData => $composableBuilder(
      column: $table.queryData, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get createdAtMs => $composableBuilder(
      column: $table.createdAtMs,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get durationMs => $composableBuilder(
      column: $table.durationMs, builder: (column) => i0.ColumnFilters(column));
}

class $$CacheEntryTableTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$CacheEntryTableTable> {
  $$CacheEntryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get queryKey => $composableBuilder(
      column: $table.queryKey, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get queryData => $composableBuilder(
      column: $table.queryData,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get createdAtMs => $composableBuilder(
      column: $table.createdAtMs,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get durationMs => $composableBuilder(
      column: $table.durationMs,
      builder: (column) => i0.ColumnOrderings(column));
}

class $$CacheEntryTableTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$CacheEntryTableTable> {
  $$CacheEntryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get queryKey =>
      $composableBuilder(column: $table.queryKey, builder: (column) => column);

  i0.GeneratedColumn<String> get queryData =>
      $composableBuilder(column: $table.queryData, builder: (column) => column);

  i0.GeneratedColumn<int> get createdAtMs => $composableBuilder(
      column: $table.createdAtMs, builder: (column) => column);

  i0.GeneratedColumn<int> get durationMs => $composableBuilder(
      column: $table.durationMs, builder: (column) => column);
}

class $$CacheEntryTableTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.$CacheEntryTableTable,
    i1.CacheEntryTableData,
    i1.$$CacheEntryTableTableFilterComposer,
    i1.$$CacheEntryTableTableOrderingComposer,
    i1.$$CacheEntryTableTableAnnotationComposer,
    $$CacheEntryTableTableCreateCompanionBuilder,
    $$CacheEntryTableTableUpdateCompanionBuilder,
    (
      i1.CacheEntryTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i1.$CacheEntryTableTable,
          i1.CacheEntryTableData>
    ),
    i1.CacheEntryTableData,
    i0.PrefetchHooks Function()> {
  $$CacheEntryTableTableTableManager(
      i0.GeneratedDatabase db, i1.$CacheEntryTableTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$$CacheEntryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$$CacheEntryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => i1
              .$$CacheEntryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<String> queryKey = const i0.Value.absent(),
            i0.Value<String> queryData = const i0.Value.absent(),
            i0.Value<int> createdAtMs = const i0.Value.absent(),
            i0.Value<int?> durationMs = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CacheEntryTableCompanion(
            queryKey: queryKey,
            queryData: queryData,
            createdAtMs: createdAtMs,
            durationMs: durationMs,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String queryKey,
            required String queryData,
            required int createdAtMs,
            i0.Value<int?> durationMs = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.CacheEntryTableCompanion.insert(
            queryKey: queryKey,
            queryData: queryData,
            createdAtMs: createdAtMs,
            durationMs: durationMs,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CacheEntryTableTableProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.$CacheEntryTableTable,
    i1.CacheEntryTableData,
    i1.$$CacheEntryTableTableFilterComposer,
    i1.$$CacheEntryTableTableOrderingComposer,
    i1.$$CacheEntryTableTableAnnotationComposer,
    $$CacheEntryTableTableCreateCompanionBuilder,
    $$CacheEntryTableTableUpdateCompanionBuilder,
    (
      i1.CacheEntryTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i1.$CacheEntryTableTable,
          i1.CacheEntryTableData>
    ),
    i1.CacheEntryTableData,
    i0.PrefetchHooks Function()>;

abstract class $_DriftCachedQueryDatabase extends i0.GeneratedDatabase {
  $_DriftCachedQueryDatabase(i0.QueryExecutor e) : super(e);
  $_DriftCachedQueryDatabaseManager get managers =>
      $_DriftCachedQueryDatabaseManager(this);
  late final i1.$CacheEntryTableTable cacheEntryTable =
      i1.$CacheEntryTableTable(this);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [cacheEntryTable];
}

class $_DriftCachedQueryDatabaseManager {
  final $_DriftCachedQueryDatabase _db;
  $_DriftCachedQueryDatabaseManager(this._db);
  i1.$$CacheEntryTableTableTableManager get cacheEntryTable =>
      i1.$$CacheEntryTableTableTableManager(_db, _db.cacheEntryTable);
}

class $CacheEntryTableTable extends i2.CacheEntryTable
    with i0.TableInfo<$CacheEntryTableTable, i1.CacheEntryTableData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CacheEntryTableTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _queryKeyMeta =
      const i0.VerificationMeta('queryKey');
  @override
  late final i0.GeneratedColumn<String> queryKey = i0.GeneratedColumn<String>(
      'query_key', aliasedName, false,
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _queryDataMeta =
      const i0.VerificationMeta('queryData');
  @override
  late final i0.GeneratedColumn<String> queryData = i0.GeneratedColumn<String>(
      'query_data', aliasedName, false,
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _createdAtMsMeta =
      const i0.VerificationMeta('createdAtMs');
  @override
  late final i0.GeneratedColumn<int> createdAtMs = i0.GeneratedColumn<int>(
      'created_at_ms', aliasedName, false,
      type: i0.DriftSqlType.int, requiredDuringInsert: true);
  static const i0.VerificationMeta _durationMsMeta =
      const i0.VerificationMeta('durationMs');
  @override
  late final i0.GeneratedColumn<int> durationMs = i0.GeneratedColumn<int>(
      'duration_ms', aliasedName, true,
      type: i0.DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<i0.GeneratedColumn> get $columns =>
      [queryKey, queryData, createdAtMs, durationMs];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cache_entry_table';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i1.CacheEntryTableData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('query_key')) {
      context.handle(_queryKeyMeta,
          queryKey.isAcceptableOrUnknown(data['query_key']!, _queryKeyMeta));
    } else if (isInserting) {
      context.missing(_queryKeyMeta);
    }
    if (data.containsKey('query_data')) {
      context.handle(_queryDataMeta,
          queryData.isAcceptableOrUnknown(data['query_data']!, _queryDataMeta));
    } else if (isInserting) {
      context.missing(_queryDataMeta);
    }
    if (data.containsKey('created_at_ms')) {
      context.handle(
          _createdAtMsMeta,
          createdAtMs.isAcceptableOrUnknown(
              data['created_at_ms']!, _createdAtMsMeta));
    } else if (isInserting) {
      context.missing(_createdAtMsMeta);
    }
    if (data.containsKey('duration_ms')) {
      context.handle(
          _durationMsMeta,
          durationMs.isAcceptableOrUnknown(
              data['duration_ms']!, _durationMsMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {queryKey};
  @override
  i1.CacheEntryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CacheEntryTableData(
      queryKey: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}query_key'])!,
      queryData: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}query_data'])!,
      createdAtMs: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}created_at_ms'])!,
      durationMs: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}duration_ms']),
    );
  }

  @override
  $CacheEntryTableTable createAlias(String alias) {
    return $CacheEntryTableTable(attachedDatabase, alias);
  }
}

class CacheEntryTableData extends i0.DataClass
    implements i0.Insertable<i1.CacheEntryTableData> {
  final String queryKey;
  final String queryData;
  final int createdAtMs;
  final int? durationMs;
  const CacheEntryTableData(
      {required this.queryKey,
      required this.queryData,
      required this.createdAtMs,
      this.durationMs});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['query_key'] = i0.Variable<String>(queryKey);
    map['query_data'] = i0.Variable<String>(queryData);
    map['created_at_ms'] = i0.Variable<int>(createdAtMs);
    if (!nullToAbsent || durationMs != null) {
      map['duration_ms'] = i0.Variable<int>(durationMs);
    }
    return map;
  }

  i1.CacheEntryTableCompanion toCompanion(bool nullToAbsent) {
    return i1.CacheEntryTableCompanion(
      queryKey: i0.Value(queryKey),
      queryData: i0.Value(queryData),
      createdAtMs: i0.Value(createdAtMs),
      durationMs: durationMs == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(durationMs),
    );
  }

  factory CacheEntryTableData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CacheEntryTableData(
      queryKey: serializer.fromJson<String>(json['queryKey']),
      queryData: serializer.fromJson<String>(json['queryData']),
      createdAtMs: serializer.fromJson<int>(json['createdAtMs']),
      durationMs: serializer.fromJson<int?>(json['durationMs']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'queryKey': serializer.toJson<String>(queryKey),
      'queryData': serializer.toJson<String>(queryData),
      'createdAtMs': serializer.toJson<int>(createdAtMs),
      'durationMs': serializer.toJson<int?>(durationMs),
    };
  }

  i1.CacheEntryTableData copyWith(
          {String? queryKey,
          String? queryData,
          int? createdAtMs,
          i0.Value<int?> durationMs = const i0.Value.absent()}) =>
      i1.CacheEntryTableData(
        queryKey: queryKey ?? this.queryKey,
        queryData: queryData ?? this.queryData,
        createdAtMs: createdAtMs ?? this.createdAtMs,
        durationMs: durationMs.present ? durationMs.value : this.durationMs,
      );
  CacheEntryTableData copyWithCompanion(i1.CacheEntryTableCompanion data) {
    return CacheEntryTableData(
      queryKey: data.queryKey.present ? data.queryKey.value : this.queryKey,
      queryData: data.queryData.present ? data.queryData.value : this.queryData,
      createdAtMs:
          data.createdAtMs.present ? data.createdAtMs.value : this.createdAtMs,
      durationMs:
          data.durationMs.present ? data.durationMs.value : this.durationMs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CacheEntryTableData(')
          ..write('queryKey: $queryKey, ')
          ..write('queryData: $queryData, ')
          ..write('createdAtMs: $createdAtMs, ')
          ..write('durationMs: $durationMs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(queryKey, queryData, createdAtMs, durationMs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CacheEntryTableData &&
          other.queryKey == this.queryKey &&
          other.queryData == this.queryData &&
          other.createdAtMs == this.createdAtMs &&
          other.durationMs == this.durationMs);
}

class CacheEntryTableCompanion
    extends i0.UpdateCompanion<i1.CacheEntryTableData> {
  final i0.Value<String> queryKey;
  final i0.Value<String> queryData;
  final i0.Value<int> createdAtMs;
  final i0.Value<int?> durationMs;
  final i0.Value<int> rowid;
  const CacheEntryTableCompanion({
    this.queryKey = const i0.Value.absent(),
    this.queryData = const i0.Value.absent(),
    this.createdAtMs = const i0.Value.absent(),
    this.durationMs = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CacheEntryTableCompanion.insert({
    required String queryKey,
    required String queryData,
    required int createdAtMs,
    this.durationMs = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  })  : queryKey = i0.Value(queryKey),
        queryData = i0.Value(queryData),
        createdAtMs = i0.Value(createdAtMs);
  static i0.Insertable<i1.CacheEntryTableData> custom({
    i0.Expression<String>? queryKey,
    i0.Expression<String>? queryData,
    i0.Expression<int>? createdAtMs,
    i0.Expression<int>? durationMs,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (queryKey != null) 'query_key': queryKey,
      if (queryData != null) 'query_data': queryData,
      if (createdAtMs != null) 'created_at_ms': createdAtMs,
      if (durationMs != null) 'duration_ms': durationMs,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.CacheEntryTableCompanion copyWith(
      {i0.Value<String>? queryKey,
      i0.Value<String>? queryData,
      i0.Value<int>? createdAtMs,
      i0.Value<int?>? durationMs,
      i0.Value<int>? rowid}) {
    return i1.CacheEntryTableCompanion(
      queryKey: queryKey ?? this.queryKey,
      queryData: queryData ?? this.queryData,
      createdAtMs: createdAtMs ?? this.createdAtMs,
      durationMs: durationMs ?? this.durationMs,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (queryKey.present) {
      map['query_key'] = i0.Variable<String>(queryKey.value);
    }
    if (queryData.present) {
      map['query_data'] = i0.Variable<String>(queryData.value);
    }
    if (createdAtMs.present) {
      map['created_at_ms'] = i0.Variable<int>(createdAtMs.value);
    }
    if (durationMs.present) {
      map['duration_ms'] = i0.Variable<int>(durationMs.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CacheEntryTableCompanion(')
          ..write('queryKey: $queryKey, ')
          ..write('queryData: $queryData, ')
          ..write('createdAtMs: $createdAtMs, ')
          ..write('durationMs: $durationMs, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}
