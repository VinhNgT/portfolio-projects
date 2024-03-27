import 'package:driving_license/features/chapters/application/chapter_progress_service.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/result/domain/test_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chapter_progress_providers.g.dart';

@riverpod
Stream<TestResult> chapterCompletionStatus(
  ChapterCompletionStatusRef ref,
  Chapter chapter,
) async* {
  final chapterProgressService =
      await ref.watch(chapterProgressServiceProvider(chapter).future);

  yield* chapterProgressService.watchChapterCompletionStatus();
}
