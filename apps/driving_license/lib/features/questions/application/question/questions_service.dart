import 'package:driving_license/features/bookmark/data/bookmarks_repository.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/application/question/questions_handler.dart';
import 'package:driving_license/features/questions/application/question/questions_service_config.dart';
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

  static Future<QuestionsService> createService(
    QuestionsServiceConfig config,
  ) async {
    switch (config.operatingMode) {
      case final FullOperatingMode _:
        return QuestionsService._full(
          questionsRepository: config.questionsRepository,
          userAnswersRepository: config.userAnswersRepository,
        );

      case ChapterOperatingMode(:final chapter):
        return QuestionsService._chapter(
          questionsRepository: config.questionsRepository,
          userAnswersRepository: config.userAnswersRepository,
          license: config.license,
          chapter: chapter,
        );

      case final DangerOperatingMode _:
        return QuestionsService._danger(
          questionsRepository: config.questionsRepository,
          userAnswersRepository: config.userAnswersRepository,
          license: config.license,
        );

      case final DifficultOperatingMode _:
        final difficultQuestionUserAnswers = await config.userAnswersRepository
            .getAllDifficultQuestionAnswersByLicense(config.license);

        return QuestionsService._difficult(
          questionsRepository: config.questionsRepository,
          userAnswersRepository: config.userAnswersRepository,
          inMemoryUserAnswersRepository: config.inMemoryUserAnswersRepository,
          difficultQuestionUserAnswers: difficultQuestionUserAnswers,
          license: config.license,
        );

      case final WrongAnswersOperatingMode _:
        final wrongUserAnswers = await config.userAnswersRepository
            .getAllWrongAnswersByLicense(config.license);

        return QuestionsService._wrongAnswers(
          questionsRepository: config.questionsRepository,
          userAnswersRepository: config.userAnswersRepository,
          inMemoryUserAnswersRepository: config.inMemoryUserAnswersRepository,
          wrongUserAnswers: wrongUserAnswers,
        );

      case final BookmarkOperatingMode _:
        final bookmarks = await config.bookmarksRepository
            .getAllBookmarksByLicense(config.license);
        final bookmarkQuestionDbIndexes =
            bookmarks.map((e) => e.questionDbIndex).toList();

        return QuestionsService._bookmarked(
          questionsRepository: config.questionsRepository,
          userAnswersRepository: config.userAnswersRepository,
          bookmarkedQuestionDbIndexes: bookmarkQuestionDbIndexes,
        );
    }
  }

  factory QuestionsService._full({
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

  factory QuestionsService._chapter({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
    required License license,
    required Chapter chapter,
  }) {
    return QuestionsService(
      operatingMode: ChapterOperatingMode(chapter),
      questionsHandler: ChapterQuestionsHandler(
        questionsRepository: questionsRepository,
        license: license,
        chapter: chapter,
      ),
      userAnswersHandler: DirectUserAnswersHandler(
        userAnswersRepository: userAnswersRepository,
      ),
    );
  }

  factory QuestionsService._danger({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
    required License license,
  }) {
    return QuestionsService(
      operatingMode: DangerOperatingMode(),
      questionsHandler: DangerQuestionsHandler(
        questionsRepository: questionsRepository,
        license: license,
      ),
      userAnswersHandler: DirectUserAnswersHandler(
        userAnswersRepository: userAnswersRepository,
      ),
    );
  }

  factory QuestionsService._difficult({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
    required InMemoryUserAnswersRepository inMemoryUserAnswersRepository,
    required UserAnswersMap difficultQuestionUserAnswers,
    required License license,
  }) {
    return QuestionsService(
      operatingMode: DifficultOperatingMode(),
      questionsHandler: DifficultQuestionsHandler(
        questionsRepository: questionsRepository,
        license: license,
      ),
      userAnswersHandler: HideUserAnswersHandler(
        userAnswersRepository: userAnswersRepository,
        inMemoryUserAnswersHandler: InMemoryUserAnswersHandler(
          inMemoryUserAnswersRepository: inMemoryUserAnswersRepository,
        ),
        userAnswersBeforeStart: difficultQuestionUserAnswers,
      ),
    );
  }

  factory QuestionsService._wrongAnswers({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
    required InMemoryUserAnswersRepository inMemoryUserAnswersRepository,
    required UserAnswersMap wrongUserAnswers,
  }) {
    return QuestionsService(
      operatingMode: WrongAnswersOperatingMode(),
      questionsHandler: CustomQuestionListQuestionHandler(
        questionsRepository: questionsRepository,
        sortedQuestionDbIndexes: wrongUserAnswers.keys.toList()..sort(),
      ),
      userAnswersHandler: HideUserAnswersHandler(
        userAnswersRepository: userAnswersRepository,
        inMemoryUserAnswersHandler: InMemoryUserAnswersHandler(
          inMemoryUserAnswersRepository: inMemoryUserAnswersRepository,
        ),
        userAnswersBeforeStart: wrongUserAnswers,
      ),
    );
  }

  factory QuestionsService._bookmarked({
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
  QuestionsServiceMode _serviceMode = FullOperatingMode();

  @override
  FutureOr<QuestionsService> build() async {
    final license = await ref.watch(userSelectedLicenseProvider.future);
    final questionsRepository = ref.watch(questionsRepositoryProvider);
    final bookmarksRepository = ref.watch(bookmarksRepositoryProvider);
    final userAnswersRepository = ref.watch(userAnswersRepositoryProvider);
    final inMemoryUserAnswersRepository =
        ref.refresh(inMemoryUserAnswersRepositoryProvider);

    final config = QuestionsServiceConfig(
      operatingMode: _serviceMode,
      license: license,
      questionsRepository: questionsRepository,
      bookmarksRepository: bookmarksRepository,
      userAnswersRepository: userAnswersRepository,
      inMemoryUserAnswersRepository: inMemoryUserAnswersRepository,
    );

    return QuestionsService.createService(config);
  }

  void setupAllQuestions() {
    _serviceMode = FullOperatingMode();
    ref.invalidateSelf();
  }

  void setupChapterQuestions(Chapter chapter) {
    _serviceMode = ChapterOperatingMode(chapter);
    ref.invalidateSelf();
  }

  void setupDangerQuestions() {
    _serviceMode = DangerOperatingMode();
    ref.invalidateSelf();
  }

  void setupDifficultQuestions() async {
    _serviceMode = DifficultOperatingMode();
    ref.invalidateSelf();
  }

  void setupWrongAnswerQuestions() async {
    _serviceMode = WrongAnswersOperatingMode();
    ref.invalidateSelf();
  }

  void setupBookmarkedQuestions() async {
    _serviceMode = BookmarkOperatingMode();
    ref.invalidateSelf();
  }
}

@riverpod
FutureOr<QuestionsServiceMode> questionsServiceMode(
  QuestionsServiceModeRef ref,
) async {
  final questionsService =
      await ref.watch(questionsServiceControllerProvider.future);
  return questionsService.operatingMode;
}
