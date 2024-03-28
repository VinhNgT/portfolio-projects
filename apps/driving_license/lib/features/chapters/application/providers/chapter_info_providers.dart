import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/result/domain/test_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'chapter_info_providers.g.dart';

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
FutureOr<List<Chapter>> chaptersHasQuestion(
  ChaptersHasQuestionRef ref,
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
Stream<TestResult> chapterCompletionStatus(
  ChapterCompletionStatusRef ref,
  Chapter chapter,
) async* {
  final license = await ref.watch(userSelectedLicenseProvider.future);
  final userAnswersRepository = ref.watch(userAnswersRepositoryProvider);

  final chapterQuestionsCount =
      await ref.watch(chapterQuestionsCountProvider(chapter).future);
  final userAnswersCountStream = userAnswersRepository
      .watchAnswersCountByLicenseAndChapter(license, chapter);
  final wrongUserAnswersCountStream = userAnswersRepository
      .watchWrongAnswersCountByLicenseAndChapter(license, chapter);

  yield* Rx.combineLatest2(
    userAnswersCountStream,
    wrongUserAnswersCountStream,
    (int userAnswersCount, int wrongUserAnswersCount) {
      return TestResult(
        totalQuestions: chapterQuestionsCount,
        answeredQuestions: userAnswersCount,
        correctAnswers: userAnswersCount - wrongUserAnswersCount,
        wrongAnswers: wrongUserAnswersCount,
      );
    },
  );
}
