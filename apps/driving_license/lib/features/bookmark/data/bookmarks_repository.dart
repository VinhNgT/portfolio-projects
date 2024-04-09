import 'package:driving_license/features/bookmark/domain/bookmark.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmarks_repository.g.dart';

abstract interface class BookmarksRepository {
  Future<void> saveBookmark(Question question);
  Future<void> removeBookmark(Question question);
  Future<List<Bookmark>> getAllBookmarksByLicense(License license);
  Future<void> clearAllBookmarks();
  Stream<bool> watchIsBookmarked(Question question);
}

@Riverpod(keepAlive: true)
BookmarksRepository bookmarksRepository(
  BookmarksRepositoryRef ref,
) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}
