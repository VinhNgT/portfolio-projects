import 'dart:async';
import 'dart:convert';

import 'package:cached_query/cached_query.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'drift_cache_database.g.dart';

class CacheEntryTable extends Table {
  TextColumn get queryKey => text()();
  TextColumn get queryData => text()();
  IntColumn get createdAtMs => integer()();
  IntColumn get durationMs => integer().nullable()();

  @override
  Set<Column> get primaryKey => {queryKey};
}

@DriftDatabase(tables: [CacheEntryTable])
class _DriftCachedQueryDatabase extends _$_DriftCachedQueryDatabase {
  _DriftCachedQueryDatabase() : super(_openConnection());

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'cached_query');
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (m, from, to) async {
        if (to != schemaVersion) {
          return;
        }

        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
          await m.createTable(table);
        }
      },
    );
  }
}

class DriftCachedStorage implements StorageInterface {
  final _DriftCachedQueryDatabase _db = _DriftCachedQueryDatabase();

  @override
  void put(StoredQuery query) async {
    try {
      final payload = jsonEncode(query.data);
      await _db.into(_db.cacheEntryTable).insert(
            CacheEntryTableCompanion(
              queryKey: Value(query.key),
              queryData: Value(payload),
              createdAtMs: Value(query.createdAt.millisecondsSinceEpoch),
              durationMs: Value(query.storageDuration?.inMilliseconds),
            ),
            mode: InsertMode.insertOrReplace,
          );
    } catch (e) {
      throw Exception(
        '''
Error inserting into the Database.
It is likely that the data in this query is not directly serializable and it does not have a `.toJson()` method

${e.toString()}
''',
      );
    }
  }

  @override
  FutureOr<StoredQuery?> get(String key) {
    final query = _db.select(_db.cacheEntryTable)
      ..where((tbl) => tbl.queryKey.equals(key));

    return query.map((row) {
      return StoredQuery(
        key: row.queryKey,
        data: jsonDecode(row.queryData),
        createdAt: DateTime.fromMillisecondsSinceEpoch(row.createdAtMs),
        storageDuration: row.durationMs != null
            ? Duration(milliseconds: row.durationMs!)
            : null,
      );
    }).getSingleOrNull();
  }

  @override
  void delete(String key) {
    _db.delete(_db.cacheEntryTable)
      ..where((tbl) => tbl.queryKey.equals(key))
      ..go();
  }

  @override
  void deleteAll() {
    _db.delete(_db.cacheEntryTable).go();
  }

  @override
  void close() {
    _db.close();
  }
}
