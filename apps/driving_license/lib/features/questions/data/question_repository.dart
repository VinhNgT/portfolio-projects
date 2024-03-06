import 'package:driving_license/features/chapters/data/user_chapter_selection_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_repository.g.dart';

abstract class QuestionRepository {
  static int pageSize = 20;

  // Get questions by it index
  FutureOr<Question> getQuestion(int index);
  FutureOr<int> getQuestionCount();
  FutureOr<List<Question>> getQuestionsPage(int pageNumber);

  // Get questions by it index and chapter
  FutureOr<Question> getQuestionByChapter(Chapter chapter, int index);
  FutureOr<List<Question>> getQuestionsPageByChapter(
    Chapter chapter,
    int pageNumber,
  );
  FutureOr<int> getQuestionCountByChapter(Chapter chapter);
}

@riverpod
QuestionRepository questionRepository(QuestionRepositoryRef ref) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}

@riverpod
FutureOr<Question> questionFuture(QuestionFutureRef ref, int index) {
  final questionRepository = ref.watch(questionRepositoryProvider);
  final chapterRepository = ref.watch(userChapterSelectionRepositoryProvider);

  if (chapterRepository == null) {
    return questionRepository.getQuestion(index);
  }

  return questionRepository.getQuestionByChapter(chapterRepository, index);
}

@riverpod
FutureOr<List<Question>> questionsPageFuture(
  QuestionsPageFutureRef ref,
  int pageNumber,
) {
  final questionRepository = ref.watch(questionRepositoryProvider);
  final chapterRepository = ref.watch(userChapterSelectionRepositoryProvider);

  if (chapterRepository == null) {
    return questionRepository.getQuestionsPage(pageNumber);
  }

  return questionRepository.getQuestionsPageByChapter(
    chapterRepository,
    pageNumber,
  );
}

@riverpod
FutureOr<int> questionCountFuture(QuestionCountFutureRef ref) {
  final questionRepository = ref.watch(questionRepositoryProvider);
  final chapterRepository = ref.watch(userChapterSelectionRepositoryProvider);

  if (chapterRepository == null) {
    return questionRepository.getQuestionCount();
  }

  return questionRepository.getQuestionCountByChapter(chapterRepository);
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
