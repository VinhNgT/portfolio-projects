import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_repository.g.dart';

abstract class QuestionsRepository {
  static int pageSize = 20;

  FutureOr<Question> getQuestion(int index);
  FutureOr<Question> getQuestionByDbIndex(int dbIndex);
  FutureOr<int> getQuestionsCount();

  FutureOr<List<Question>> getQuestionsPage(int pageNumber);
  FutureOr<List<Question>> getQuestionsPageByDbIndexes(
    Iterable<int> dbIndexes,
    int pageNumber,
  );

  FutureOr<Question> getQuestionByLicenseAndChapter(
    License license,
    Chapter chapter,
    int index,
  );
  FutureOr<List<Question>> getQuestionsPageByLicenseAndChapter(
    License license,
    Chapter chapter,
    int pageNumber,
  );
  FutureOr<int> getQuestionsCountByLicenseAndChapter(
    License license,
    Chapter chapter,
  );
  FutureOr<Iterable<int>> getQuestionDbIndexesByLicenseAndChapter(
    License license,
    Chapter chapter,
  );

  // Get questions by its danger status
  FutureOr<Question> getIsDangerQuestionByLicense(License license, int index);
  FutureOr<List<Question>> getIsDangerQuestionsPageByLicense(
    License license,
    int pageNumber,
  );
  FutureOr<int> getIsDangerQuestionsCountByLicense(License license);

  // Get questions by its difficulty status
  FutureOr<Question> getIsDifficultQuestionByLicense(
    License license,
    int index,
  );
  FutureOr<List<Question>> getIsDifficultQuestionsPageByLicense(
    License license,
    int pageNumber,
  );
  FutureOr<int> getIsDifficultQuestionsCountByLicense(License license);
}

@Riverpod(keepAlive: true)
QuestionsRepository questionsRepository(QuestionsRepositoryRef ref) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}
