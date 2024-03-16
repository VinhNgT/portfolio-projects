import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_repository.g.dart';

abstract class QuestionsRepository {
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

  // Get questions by it DB index
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
