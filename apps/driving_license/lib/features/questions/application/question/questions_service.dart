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
  const QuestionsService({
    required this.operatingMode,
    required this.questionsHandler,
    required this.userAnswersHandler,
  });

  final QuestionsServiceMode operatingMode;
  final QuestionsHandler questionsHandler;
  final UserAnswersHandler userAnswersHandler;

  factory QuestionsService.full({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
  }) {
    return QuestionsService(
      operatingMode: FullOperatingMode(),
      questionsHandler: FullQuestionsHandler(
        questionsRepository: questionsRepository,
      ),
      userAnswersHandler: DirectUserAnswersHandler(
        userAnswersRepository: userAnswersRepository,
      ),
    );
  }

  factory QuestionsService.chapter({
    required Chapter chapter,
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
  }) {
    return QuestionsService(
      operatingMode: ChapterOperatingMode(chapter),
      questionsHandler: ChapterQuestionsHandler(
        questionsRepository: questionsRepository,
        chapter: chapter,
      ),
      userAnswersHandler: DirectUserAnswersHandler(
        userAnswersRepository: userAnswersRepository,
      ),
    );
  }

  factory QuestionsService.danger({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
  }) {
    return QuestionsService(
      operatingMode: DangerOperatingMode(),
      questionsHandler: DangerQuestionsHandler(
        questionsRepository: questionsRepository,
      ),
      userAnswersHandler: DirectUserAnswersHandler(
        userAnswersRepository: userAnswersRepository,
      ),
    );
  }

  factory QuestionsService.difficult({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
    required InMemoryUserAnswersRepository inMemoryUserAnswersRepository,
    required UserAnswersMap userAnswersBeforeStart,
  }) {
    return QuestionsService(
      operatingMode: DifficultOperatingMode(),
      questionsHandler: DifficultQuestionsHandler(
        questionsRepository: questionsRepository,
      ),
      userAnswersHandler: HideUserAnswersHandler(
        userAnswersRepository: userAnswersRepository,
        inMemoryUserAnswersHandler: InMemoryUserAnswersHandler(
          inMemoryUserAnswersRepository: inMemoryUserAnswersRepository,
        ),
        userAnswersBeforeStart: userAnswersBeforeStart,
      ),
    );
  }

  factory QuestionsService.wrongAnswers({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
    required InMemoryUserAnswersRepository inMemoryUserAnswersRepository,
    required UserAnswersMap userAnswersBeforeStart,
  }) {
    return QuestionsService(
      operatingMode: WrongAnswersOperatingMode(),
      questionsHandler: CustomQuestionListQuestionHandler(
        questionsRepository: questionsRepository,
        sortedQuestionDbIndexes: userAnswersBeforeStart.keys.toList()..sort(),
      ),
      userAnswersHandler: HideUserAnswersHandler(
        userAnswersRepository: userAnswersRepository,
        inMemoryUserAnswersHandler: InMemoryUserAnswersHandler(
          inMemoryUserAnswersRepository: inMemoryUserAnswersRepository,
        ),
        userAnswersBeforeStart: userAnswersBeforeStart,
      ),
    );
  }

  factory QuestionsService.bookmarked({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
    required List<int> bookmarkedQuestionDbIndexes,
  }) {
    return QuestionsService(
      operatingMode: BookmarkOperatingMode(),
      questionsHandler: CustomQuestionListQuestionHandler(
        questionsRepository: questionsRepository,
        sortedQuestionDbIndexes: bookmarkedQuestionDbIndexes..sort(),
      ),
      userAnswersHandler: DirectUserAnswersHandler(
        userAnswersRepository: userAnswersRepository,
      ),
    );
  }
}

extension QuestionsServiceMethods on QuestionsService {
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
  InMemoryUserAnswersRepository get _inMemoryUserAnswersRepository =>
      ref.read(inMemoryUserAnswersRepositoryProvider);
  BookmarksRepository get _bookmarkedQuestionsRepository =>
      ref.read(bookmarksRepositoryProvider);

  @override
  QuestionsService build() {
    // Default to full handler (loads from 600 questions)
    return QuestionsService.full(
      questionsRepository: _questionsRepository,
      userAnswersRepository: _userAnswersRepository,
    );
  }

  void setupAllQuestions() {
    ref.invalidateSelf();
  }

  void setupChapterQuestions(Chapter chapter) {
    state = QuestionsService.chapter(
      chapter: chapter,
      questionsRepository: _questionsRepository,
      userAnswersRepository: _userAnswersRepository,
    );
  }

  void setupDangerQuestions() {
    state = QuestionsService.danger(
      questionsRepository: _questionsRepository,
      userAnswersRepository: _userAnswersRepository,
    );
  }

  void setupDifficultQuestions() async {
    final difficultQuestionsAnswers =
        await _userAnswersRepository.getAllDifficultQuestionsAnswers();

    if (ref.exists(inMemoryUserAnswersRepositoryProvider)) {
      ref.invalidate(inMemoryUserAnswersRepositoryProvider);
    }

    state = QuestionsService.difficult(
      questionsRepository: _questionsRepository,
      userAnswersRepository: _userAnswersRepository,
      inMemoryUserAnswersRepository: _inMemoryUserAnswersRepository,
      userAnswersBeforeStart: difficultQuestionsAnswers,
    );
  }

  Future<void> setupWrongAnswerQuestions() async {
    final wrongAnswers = await _userAnswersRepository.getAllWrongAnswers();

    if (ref.exists(inMemoryUserAnswersRepositoryProvider)) {
      ref.invalidate(inMemoryUserAnswersRepositoryProvider);
    }

    state = QuestionsService.wrongAnswers(
      questionsRepository: _questionsRepository,
      userAnswersRepository: _userAnswersRepository,
      inMemoryUserAnswersRepository: _inMemoryUserAnswersRepository,
      userAnswersBeforeStart: wrongAnswers,
    );
  }

  Future<void> setupBookmarkedQuestions() async {
    final bookmarks = await _bookmarkedQuestionsRepository.getAllBookmarks();
    final bookmarkQuestionDbIndexes =
        bookmarks.map((e) => e.questionDbIndex).toList();

    state = QuestionsService.bookmarked(
      questionsRepository: _questionsRepository,
      userAnswersRepository: _userAnswersRepository,
      bookmarkedQuestionDbIndexes: bookmarkQuestionDbIndexes,
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
