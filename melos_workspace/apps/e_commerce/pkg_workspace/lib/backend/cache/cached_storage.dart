import 'dart:async';

import 'package:cached_query/cached_query.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class SembastCachedStorage implements StorageInterface {
  SembastCachedStorage(this.db);

  final Database db;
  final store = stringMapStoreFactory.store('cache');

  @factory
  static Future<SembastCachedStorage> makeDefault() async {
    return SembastCachedStorage(await _createDatabase('cache.db'));
  }

  static Future<Database> _createDatabase(String filename) async {
    final appDocDir = await getApplicationCacheDirectory();
    return databaseFactoryIo.openDatabase(join(appDocDir.path, filename));
  }

  @override
  FutureOr<StoredQuery?> get(String key) async {
    final query = await store.record(key).get(db);

    if (query == null) {
      return null;
    }

    return StoredQuery(
      key: query['queryKey'] as String,
      data: query['queryData'],
      createdAt:
          DateTime.fromMillisecondsSinceEpoch(query['createdAtMs'] as int),
      storageDuration: query['durationMs'] != null
          ? Duration(milliseconds: query['durationMs'] as int)
          : null,
    );
  }

  @override
  void put(StoredQuery query) {
    try {
      store.record(query.key).put(
        db,
        {
          'queryKey': query.key,
          'queryData': query.data,
          'createdAtMs': query.createdAt.millisecondsSinceEpoch,
          'durationMs': query.storageDuration?.inMilliseconds,
        },
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
  void delete(String key) {
    store.record(key).delete(db);
  }

  @override
  void deleteAll() {
    store.drop(db);
  }

  @override
  void close() {
    db.close();
  }
}
