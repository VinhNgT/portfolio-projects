import 'package:driving_license/features/chapters/data/user_chapter_selection_repository.dart';
import 'package:driving_license/features/questions/data/question_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_service.g.dart';

class QuestionService {
  QuestionService(this.ref);
  final Ref ref;

  QuestionRepository get questionRepository =>
      ref.read(questionRepositoryProvider);

  Future<Question> getQuestion(
    Chapter? chapter,
    int chapterQuestionIndex,
  ) async {
    if (chapter == null) {
      return questionRepository.getQuestion(chapterQuestionIndex);
    }
    return questionRepository.getQuestionByChapter(
      chapter,
      chapterQuestionIndex,
    );
  }

  Future<List<Question>> getQuestionsPage(
    Chapter? chapter,
    int pageNumber,
  ) async {
    if (chapter == null) {
      return questionRepository.getQuestionsPage(pageNumber);
    }
    return questionRepository.getQuestionsPageByChapter(chapter, pageNumber);
  }

  Future<int> getQuestionCount(Chapter? chapter) async {
    if (chapter == null) {
      return questionRepository.getQuestionCount();
    }
    return questionRepository.getQuestionCountByChapter(chapter);
  }
}

@Riverpod(keepAlive: true)
QuestionService questionService(QuestionServiceRef ref) {
  return QuestionService(ref);
}

@riverpod
FutureOr<Question> questionFuture(QuestionFutureRef ref, int index) async {
  final pageNumber = index ~/ QuestionRepository.pageSize;

  // Typically, when questionPreloadPagesFuture is used, the page
  // (questionsPageFutureProvider(pageNumber)) which contains the question
  // is already loaded, so we can just get the question from it directly without
  // making additional requests to the database.
  if (ref.exists(questionsPageFutureProvider(pageNumber))) {
    final questionPage =
        await ref.watch(questionsPageFutureProvider(pageNumber).future);

    // debugPrint('Fetching question from cache...');
    return questionPage[index % QuestionRepository.pageSize];
  }

  final questionService = ref.watch(questionServiceProvider);
  final userChapterSelection =
      ref.watch(userChapterSelectionRepositoryProvider);

  // debugPrint('Fetching question from database...');
  return questionService.getQuestion(userChapterSelection, index);
}

@riverpod
FutureOr<List<Question>> questionsPageFuture(
  QuestionsPageFutureRef ref,
  int pageNumber,
) {
  final questionService = ref.watch(questionServiceProvider);
  final userChapterSelection =
      ref.watch(userChapterSelectionRepositoryProvider);

  return questionService.getQuestionsPage(userChapterSelection, pageNumber);
}

@riverpod
FutureOr<int> questionCountFuture(QuestionCountFutureRef ref) {
  final questionService = ref.watch(questionServiceProvider);
  final userChapterSelection =
      ref.watch(userChapterSelectionRepositoryProvider);

  return questionService.getQuestionCount(userChapterSelection);
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
  int index,
) async {
  final pageNumber = index ~/ QuestionRepository.pageSize;
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
  if (pageNumber < questionCount ~/ QuestionRepository.pageSize) {
    ref.listen(
      questionsPageFutureProvider(pageNumber + 1),
      (_, __) {},
    );
  }

  // Return the question
  return questionPage[index % QuestionRepository.pageSize];
}
