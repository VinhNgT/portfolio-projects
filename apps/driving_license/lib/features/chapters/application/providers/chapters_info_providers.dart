import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/user_answers_summary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chapters_info_providers.g.dart';

@riverpod
FutureOr<int> chapterQuestionsCount(
  ChapterQuestionsCountRef ref,
  Chapter chapter,
) async {
  final license = await ref.watch(userSelectedLicenseProvider.future);
  final questionsRepository = ref.watch(questionsRepositoryProvider);

  return questionsRepository.getQuestionsCountByLicenseAndChapter(
    license,
    chapter,
  );
}

@riverpod
FutureOr<List<Chapter>> notEmptyChapters(
  NotEmptyChaptersRef ref,
) async {
  final chaptersQuestionsCount = await Future.wait(
    Chapter.values.map(
      (chapter) => ref.watch(chapterQuestionsCountProvider(chapter).future),
    ),
  );

  return Chapter.values.where((chapter) {
    final chapterQuestionsCount = chaptersQuestionsCount[chapter.index];
    return chapterQuestionsCount > 0;
  }).toList();
}

@riverpod
Stream<({int questionsCount, UserAnswersSummary summary})>
    chapterCompletionStatus(
  ChapterCompletionStatusRef ref,
  Chapter chapter,
) async* {
  final license = await ref.watch(userSelectedLicenseProvider.future);
  final userAnswersRepository = ref.watch(userAnswersRepositoryProvider);

  final chapterQuestionsCount =
      await ref.watch(chapterQuestionsCountProvider(chapter).future);
  final userAnswersSummary =
      userAnswersRepository.watchUserAnswersSummary(license, chapter: chapter);

  yield* userAnswersSummary.map((summary) {
    return (
      questionsCount: chapterQuestionsCount,
      summary: summary,
    );
  });
}

@riverpod
FutureOr<int?> chapterFirstUnansweredQuestionIndex(
  ChapterFirstUnansweredQuestionIndexRef ref,
  Chapter chapter,
) async {
  final lisense = await ref.watch(userSelectedLicenseProvider.future);
  final userAnswersRepository = ref.watch(userAnswersRepositoryProvider);
  final questionsRepository = ref.watch(questionsRepositoryProvider);

  final allQuestionsDbIndexes =
      await questionsRepository.getQuestionDbIndexesByLicenseAndChapter(
    lisense,
    chapter,
  );

  final firstUnansweredLocation = await userAnswersRepository
      .getFirstUnansweredPositionInList(allQuestionsDbIndexes);

  return firstUnansweredLocation;
}
