import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/result/domain/test_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'chapter_completion_status_provider.g.dart';

@riverpod
Stream<TestResult> chapterCompletionStatus(
  ChapterCompletionStatusRef ref,
  Chapter chapter,
) async* {
  final userAnswersRepository = ref.watch(userAnswersRepositoryProvider);
  final questionsRepository = ref.watch(questionsRepositoryProvider);

  final chapterQuestionsCount =
      await questionsRepository.getQuestionCountByChapter(chapter);
  final userAnswersCountStream =
      userAnswersRepository.watchChapterAnswersCount(chapter);
  final wrongUserAnswersCountStream =
      userAnswersRepository.watchChapterWrongAnswersCount(chapter);

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
