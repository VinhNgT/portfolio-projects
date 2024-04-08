import 'package:driving_license/features/bookmark/data/bookmarks_repository.dart';
import 'package:driving_license/features/bookmark/domain/bookmark.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastBookmarksRepository implements BookmarksRepository {
  SembastBookmarksRepository(this.db);

  final Database db;
  final allBookmarksStore = intMapStoreFactory.store('bookmarks');

  @factory
  static Future<SembastBookmarksRepository> makeDefault() async {
    return SembastBookmarksRepository(
      await _createDatabase('bookmarks.db'),
    );
  }

  static Future<Database> _createDatabase(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase(join(appDocDir.path, filename));
  }

  @override
  Future<void> saveBookmark(Question question) async {
    final bookmark = Bookmark(
      questionDbIndex: question.questionDbIndex,
      questionMetadata: question.metadata,
    );
    await allBookmarksStore
        .record(question.questionDbIndex)
        .put(db, bookmark.toJson());
  }

  @override
  Future<void> removeBookmark(Question question) async {
    await allBookmarksStore.record(question.questionDbIndex).delete(db);
  }

  @override
  Future<List<Bookmark>> getAllBookmarksByLicense(License license) async {
    final snapshots = await allBookmarksStore.find(
      db,
      finder: Finder(
        filter: _licenseFilter(license),
        sortOrders: [
          SortOrder(Field.key),
        ],
      ),
    );

    return snapshots.map((snapshot) {
      return Bookmark.fromJson(snapshot.value);
    }).toList();
  }

  @override
  Future<void> clearAllBookmarks() async {
    await allBookmarksStore.delete(db);
  }

  @override
  Stream<bool> watchIsBookmarked(Question question) {
    return allBookmarksStore
        .query(
          finder: Finder(filter: Filter.byKey(question.questionDbIndex)),
        )
        .onSnapshots(db)
        .map((snapshots) => snapshots.isNotEmpty);
  }
}

extension _FilterExtenstion on SembastBookmarksRepository {
  Filter _licenseFilter(License license) {
    if (license == License.all) {
      return Filter.custom((_) => true);
    }

    return Filter.matches(
      'questionMetadata.includedLicenses',
      license.name,
      anyInList: true,
    );
  }
}
