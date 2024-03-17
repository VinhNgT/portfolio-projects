import 'package:driving_license/features/bookmark/data/sembast_bookmarks_repository.dart';
import 'package:driving_license/features/bookmark/domain/bookmark.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmarks_repository.g.dart';

abstract class BookmarksRepository {
  Future<void> saveBookmark(Question question);
  Future<void> removeBookmark(Question question);
  Future<Set<Bookmark>> getAllBookmarks();
  Future<void> clearAllBookmarks();
  Future<bool> isBookmarked(Question question);
}

@Riverpod(keepAlive: true)
BookmarksRepository bookmarksRepository(
  BookmarksRepositoryRef ref,
) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}
