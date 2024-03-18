import 'package:driving_license/features/bookmark/data/bookmarks_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmark_button_controller.g.dart';

@riverpod
class BookmarkButtonController extends _$BookmarkButtonController {
  @override
  FutureOr<void> build() {}

  BookmarksRepository get _bookmarksRepository =>
      ref.read(bookmarksRepositoryProvider);

  Future<void> bookmarkQuestion(Question question) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _bookmarksRepository.saveBookmark(question),
    );
  }

  Future<void> unbookmarkQuestion(Question question) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _bookmarksRepository.removeBookmark(question),
    );
  }
}
