import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_repository.g.dart';

typedef QuestionDbIndex = int;

abstract class QuestionsRepository {
  static int pageSize = 20;

  // Get questions by its index
  FutureOr<Question> getQuestion(int index);
  FutureOr<int> getQuestionCount();
  FutureOr<List<Question>> getQuestionsPage(int pageNumber);

  // Get questions by its index and chapter
  FutureOr<Question> getQuestionByChapter(Chapter chapter, int index);
  FutureOr<List<Question>> getQuestionsPageByChapter(
    Chapter chapter,
    int pageNumber,
  );
  FutureOr<int> getQuestionCountByChapter(Chapter chapter);
  FutureOr<List<QuestionDbIndex>> getAllQuestionDbIndexesByChapter(
    Chapter chapter,
  );

  // Get questions by its DB index
  FutureOr<Question> getQuestionByDbIndex(int dbIndex);
  FutureOr<List<Question>> getQuestionsPageByDbIndexes(
    List<int> dbIndexes,
    int pageNumber,
  );
}

@Riverpod(keepAlive: true)
QuestionsRepository questionsRepository(QuestionsRepositoryRef ref) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}

@riverpod
FutureOr<List<QuestionDbIndex>> allQuestionDbIndexesByChapter(
  AllQuestionDbIndexesByChapterRef ref,
  Chapter chapter,
) {
  final questionsRepository = ref.watch(questionsRepositoryProvider);
  return questionsRepository.getAllQuestionDbIndexesByChapter(chapter);
}
