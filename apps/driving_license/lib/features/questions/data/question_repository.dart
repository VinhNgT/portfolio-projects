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

@Riverpod(keepAlive: true)
QuestionRepository questionRepository(QuestionRepositoryRef ref) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}