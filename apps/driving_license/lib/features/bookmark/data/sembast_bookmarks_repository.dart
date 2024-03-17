import 'package:driving_license/features/bookmark/data/bookmarks_repository.dart';
import 'package:driving_license/features/bookmark/domain/bookmark.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastBookmarksRepository implements BookmarksRepository {
  SembastBookmarksRepository(this.db);

  final Database db;
  final allAnswersStore = intMapStoreFactory.store('bookmarks');

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
    final bookmark = Bookmark(questionDbIndex: question.questionDbIndex);
    await allAnswersStore
        .record(question.questionDbIndex)
        .put(db, bookmark.toJson());
  }

  @override
  Future<void> removeBookmark(Question question) async {
    await allAnswersStore.record(question.questionDbIndex).delete(db);
  }

  @override
  Future<Set<Bookmark>> getAllBookmarks() async {
    final snapshots = await allAnswersStore.find(db);
    return snapshots
        .map((snapshot) => Bookmark.fromJson(snapshot.value))
        .toSet();
  }

  @override
  Future<void> clearAllBookmarks() async {
    await allAnswersStore.delete(db);
  }

  @override
  Future<bool> isBookmarked(Question question) async {
    final record = allAnswersStore.record(question.questionDbIndex);
    return record.exists(db);
  }
}
