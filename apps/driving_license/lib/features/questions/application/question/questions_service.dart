import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/application/question/questions_handler.dart';
import 'package:driving_license/features/questions/application/user_answer/user_answer_service.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_service.g.dart';

class QuestionsService {
  QuestionsService(this.questionsHandler);
  final QuestionsHandler questionsHandler;

  Future<Question> getQuestion(int questionIndex) async =>
      questionsHandler.getQuestion(questionIndex);

  Future<List<Question>> getQuestionsPage(int pageIndex) async =>
      questionsHandler.getQuestionsPage(pageIndex);

  Future<int> getQuestionCount() async => questionsHandler.getQuestionCount();
}

@Riverpod(keepAlive: true)
class QuestionsServiceController extends _$QuestionsServiceController {
  QuestionsRepository get _questionsRepository =>
      ref.read(questionsRepositoryProvider);

  UserAnswerService get _userAnswerService =>
      ref.read(userAnswerServiceProvider);

  @override
  QuestionsService build() {
    // Default to full handler (loads from 600 questions) unless specified
    // otherwise
    return QuestionsService(
      FullQuestionsHandler(questionsRepository: _questionsRepository),
    );
  }

  void setupAllQuestions() {
    state = QuestionsService(
      FullQuestionsHandler(questionsRepository: _questionsRepository),
    );
  }

  void setupChapterQuestions(Chapter chapter) {
    state = QuestionsService(
      ChapterQuestionsHandler(
        questionsRepository: _questionsRepository,
        chapter: chapter,
      ),
    );
  }

  Future<void> setupWrongAnswerQuestions() async {
    final wrongAnswers = await _userAnswerService.getAllWrongAnswers();
    state = QuestionsService(
      WrongAnswerQuestionsHandler(
        questionsRepository: _questionsRepository,
        wrongAnswers: wrongAnswers,
      ),
    );
  }
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
