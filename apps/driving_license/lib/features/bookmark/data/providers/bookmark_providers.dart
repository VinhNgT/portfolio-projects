import 'package:driving_license/features/bookmark/data/bookmarks_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmark_providers.g.dart';

@riverpod
Stream<bool> isBookmarkedStream(
  IsBookmarkedStreamRef ref,
  Question question,
) {
  final bookmarksRepository = ref.watch(bookmarksRepositoryProvider);
  return bookmarksRepository.watchIsBookmarked(question);
}
