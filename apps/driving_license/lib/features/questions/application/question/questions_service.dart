import 'package:driving_license/features/bookmark/data/bookmarks_repository.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/application/question/questions_handler.dart';
import 'package:driving_license/features/questions/application/question/questions_service_mode.dart';
import 'package:driving_license/features/questions/application/user_answer/user_answers_handler.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/in_memory_user_answers_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_service.g.dart';

class QuestionsService {
  QuestionsService({
    required this.operatingMode,
    required this.questionsHandler,
    required this.userAnswersHandler,
  }) {
    // debugPrint(
    //   'QuestionsService started: ${operatingMode.description}',
    // );
  }
  final QuestionsServiceMode operatingMode;
  final QuestionsHandler questionsHandler;
  final UserAnswersHandler userAnswersHandler;

  Future<Question> getQuestion(int questionIndex) async =>
      questionsHandler.getQuestion(questionIndex);

  Future<List<Question>> getQuestionsPage(int pageIndex) async =>
      questionsHandler.getQuestionsPage(pageIndex);

  Future<int> getQuestionCount() async => questionsHandler.getQuestionCount();

  Future<void> saveUserAnswer(Question question, int selectedAnswerIndex) =>
      userAnswersHandler.saveUserAnswer(question, selectedAnswerIndex);

  Future<void> clearUserAnswer(Question question) =>
      userAnswersHandler.clearUserAnswer(question);

  Future<void> clearAllUserAnswers() =>
      userAnswersHandler.clearAllUserAnswers();

  Stream<int?> watchUserSelectedAnswerIndex(Question question) =>
      userAnswersHandler.watchUserSelectedAnswerIndex(question);
}

@Riverpod(keepAlive: true)
class QuestionsServiceController extends _$QuestionsServiceController {
  QuestionsRepository get _questionsRepository =>
      ref.read(questionsRepositoryProvider);
  UserAnswersRepository get _userAnswersRepository =>
      ref.read(userAnswersRepositoryProvider);
  UserAnswersRepository get _inMemoryUserAnswersRepository =>
      ref.read(inMemoryUserAnswersRepositoryProvider);
  BookmarksRepository get _bookmarkedQuestionsRepository =>
      ref.read(bookmarksRepositoryProvider);

  @override
  QuestionsService build() {
    // Default to full handler (loads from 600 questions)
    return QuestionsService(
      operatingMode: FullOperatingMode(),
      questionsHandler:
          FullQuestionsHandler(questionsRepository: _questionsRepository),
      userAnswersHandler: DirectUserAnswersHandler(
        userAnswersRepository: _userAnswersRepository,
      ),
    );
  }

  void setupAllQuestions() {
    ref.invalidateSelf();
  }

  void setupChapterQuestions(Chapter chapter) {
    state = QuestionsService(
      operatingMode: ChapterOperatingMode(chapter),
      questionsHandler: ChapterQuestionsHandler(
        questionsRepository: _questionsRepository,
        chapter: chapter,
      ),
      userAnswersHandler: DirectUserAnswersHandler(
        userAnswersRepository: _userAnswersRepository,
      ),
    );
  }

  void setupDangerQuestions() {
    state = QuestionsService(
      operatingMode: DangerOperatingMode(),
      questionsHandler: DangerQuestionsHandler(
        questionsRepository: _questionsRepository,
      ),
      userAnswersHandler: DirectUserAnswersHandler(
        userAnswersRepository: _userAnswersRepository,
      ),
    );
  }

  void setupDifficultQuestions() {
    state = QuestionsService(
      operatingMode: DifficultOperatingMode(),
      questionsHandler: DifficultQuestionsHandler(
        questionsRepository: _questionsRepository,
      ),
      userAnswersHandler: DirectUserAnswersHandler(
        userAnswersRepository: _userAnswersRepository,
      ),
    );
  }

  Future<void> setupWrongAnswerQuestions() async {
    final wrongAnswers = await _userAnswersRepository.getAllWrongAnswers();
    final wrongAnswerQuestionDbIndexes = wrongAnswers.keys.toList()..sort();

    if (ref.exists(inMemoryUserAnswersRepositoryProvider)) {
      ref.invalidate(inMemoryUserAnswersRepositoryProvider);
    }

    state = QuestionsService(
      operatingMode: WrongAnswersOperatingMode(),
      questionsHandler: CustomQuestionListQuestionHandler(
        questionsRepository: _questionsRepository,
        sortedQuestionDbIndexes: wrongAnswerQuestionDbIndexes,
      ),
      userAnswersHandler: InMemoryUserAnswersHandler(
        userAnswersRepository: _userAnswersRepository,
        inMemoryUserAnswersRepository: _inMemoryUserAnswersRepository,
        userAnswersBeforeStart: wrongAnswers,
      ),
    );
  }

  Future<void> setupBookmarkedQuestions() async {
    final bookmarks = await _bookmarkedQuestionsRepository.getAllBookmarks();
    final bookmarkQuestionDbIndexes =
        bookmarks.map((e) => e.questionDbIndex).toList();

    state = QuestionsService(
      operatingMode: BookmarkOperatingMode(),
      questionsHandler: CustomQuestionListQuestionHandler(
        questionsRepository: _questionsRepository,
        sortedQuestionDbIndexes: bookmarkQuestionDbIndexes,
      ),
      userAnswersHandler: DirectUserAnswersHandler(
        userAnswersRepository: _userAnswersRepository,
      ),
    );
  }
}

@riverpod
QuestionsServiceMode questionsServiceMode(
  QuestionsServiceModeRef ref,
) {
  final questionsService = ref.watch(questionsServiceControllerProvider);
  return questionsService.operatingMode;
}

@riverpod
FutureOr<Question> questionFuture(
  QuestionFutureRef ref,
  int questionIndex,
) async {
  final pageNumber = questionIndex ~/ QuestionsRepository.pageSize;

  // Typically, when questionPreloadPagesFuture is used, the page
  // (questionsPageFutureProvider(pageNumber)) which contains the question
  // is already loaded, so we can just get the question from it directly without
  // making additional requests to the database.
  if (ref.exists(questionsPageFutureProvider(pageNumber))) {
    final questionPage =
        await ref.watch(questionsPageFutureProvider(pageNumber).future);

    // debugPrint('Fetching question from cache...');
    return questionPage[questionIndex % QuestionsRepository.pageSize];
  }

  // debugPrint('Fetching question from database...');
  final questionsService = ref.watch(questionsServiceControllerProvider);
  return questionsService.getQuestion(questionIndex);
}

@riverpod
FutureOr<List<Question>> questionsPageFuture(
  QuestionsPageFutureRef ref,
  int pageIndex,
) {
  final questionsService = ref.watch(questionsServiceControllerProvider);
  return questionsService.getQuestionsPage(pageIndex);
}

@riverpod
FutureOr<int> questionCountFuture(QuestionCountFutureRef ref) {
  final questionsService = ref.watch(questionsServiceControllerProvider);
  return questionsService.getQuestionCount();
}

// Leverage Riverpod caching system to build "lazy-load/pagination" data
// getting mechanism.
//
// This is useful when we have a large number of questions and we don't want to
// load all of them at once.
//
// When combined with ListView.builder, it is much faster compared to loading
// individual questions (questionFutureProvider) by loading them in pages. It
// also preloads the next and previous pages to make the user experience
// smoother.
//
// Note that it should be used only in the ListView.builder, if you want to load
// one question only, use questionFutureProvider instead to save memory.
@riverpod
FutureOr<Question> questionPreloadPagesFuture(
  QuestionPreloadPagesFutureRef ref,
  int questionIndex,
) async {
  final pageNumber = questionIndex ~/ QuestionsRepository.pageSize;
  final questionPage =
      await ref.watch(questionsPageFutureProvider(pageNumber).future);
  final questionCount = await ref.watch(questionCountFutureProvider.future);

  // Preload database data of the previous page
  if (pageNumber > 0) {
    ref.listen(
      questionsPageFutureProvider(pageNumber - 1),
      (_, __) {},
    );
  }

  // Preload database data of the next page
  if (pageNumber < questionCount ~/ QuestionsRepository.pageSize) {
    ref.listen(
      questionsPageFutureProvider(pageNumber + 1),
      (_, __) {},
    );
  }

  // Return the question
  return questionPage[questionIndex % QuestionsRepository.pageSize];
}

@riverpod
Stream<int?> userSelectedAnswerIndex(
  UserSelectedAnswerIndexRef ref,
  Question question,
) {
  final questionsService = ref.watch(questionsServiceControllerProvider);
  return questionsService.watchUserSelectedAnswerIndex(question);
}
