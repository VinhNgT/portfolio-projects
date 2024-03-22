import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_repository.g.dart';

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
  FutureOr<List<int>> getQuestionDbIndexesByChapter(Chapter chapter);

  // Get questions by its danger status
  FutureOr<Question> getIsDangerQuestion(int index);
  FutureOr<List<Question>> getIsDangerQuestionsPage(int pageNumber);
  FutureOr<int> getIsDangerQuestionsCount();
  FutureOr<List<int>> getIsDangerDbQuestionIndexes();

  // Get questions by its difficulty status
  FutureOr<Question> getIsDifficultQuestion(int index);
  FutureOr<List<Question>> getIsDifficultQuestionsPage(int pageNumber);
  FutureOr<int> getIsDifficultQuestionsCount();
  FutureOr<List<int>> getIsDifficultDbQuestionIndexes();

  // Get questions by its DB index
  FutureOr<Question> getQuestionByDbIndex(int dbIndex);
  FutureOr<List<Question>> getQuestionsPageByDbIndexes(
    Iterable<int> dbIndexes,
    int pageNumber,
  );
}

@Riverpod(keepAlive: true)
QuestionsRepository questionsRepository(QuestionsRepositoryRef ref) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}
