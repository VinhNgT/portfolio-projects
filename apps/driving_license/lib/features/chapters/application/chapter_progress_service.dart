import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/result/domain/test_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'chapter_progress_service.g.dart';

class ChapterProgressService {
  final Chapter chapter;
  final UserAnswersRepository userAnswersRepository;
  final QuestionsRepository questionsRepository;
  final SharedPreferences prefs;

  ChapterProgressService({
    required this.chapter,
    required this.userAnswersRepository,
    required this.questionsRepository,
    required this.prefs,
  });

  Stream<TestResult> watchChapterCompletionStatus() async* {
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

  Future<void> saveLastQuestionPageIndexVisited(int questionPageIndex) async {
    await prefs.setInt(
      'chapter_last_question_${chapter.name}',
      questionPageIndex,
    );
  }

  Future<int> getLastQuestionPageIndexVisited() async {
    return prefs.getInt('chapter_last_question_${chapter.name}') ?? 0;
  }
}

@riverpod
FutureOr<ChapterProgressService> chapterProgressService(
  ChapterProgressServiceRef ref,
  Chapter chapter,
) async {
  final userAnswersRepository = ref.watch(userAnswersRepositoryProvider);
  final questionsRepository = ref.watch(questionsRepositoryProvider);
  final prefs = await SharedPreferences.getInstance();

  return ChapterProgressService(
    chapter: chapter,
    userAnswersRepository: userAnswersRepository,
    questionsRepository: questionsRepository,
    prefs: prefs,
  );
}
