import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_repository.g.dart';

abstract class QuestionsRepository {
  static int pageSize = 20;

  FutureOr<Question> get(int index);
  FutureOr<Question> getByDbIndex(int dbIndex);
  FutureOr<int> getCount();

  FutureOr<List<Question>> getPage(int pageNumber);
  FutureOr<List<Question>> getPageByDbIndexes(
    Iterable<int> dbIndexes,
    int pageNumber,
  );

  FutureOr<Question> getByLicenseAndChapter(
    License license,
    Chapter chapter,
    int index,
  );
  FutureOr<List<Question>> getPageByLicenseAndChapter(
    License license,
    Chapter chapter,
    int pageNumber,
  );
  FutureOr<int> getCountByLicenseAndChapter(
    License license,
    Chapter chapter,
  );

  // Get questions by its danger status
  FutureOr<Question> getIsDangerByLicense(License license, int index);
  FutureOr<List<Question>> getIsDangerPageByLicense(
    License license,
    int pageNumber,
  );
  FutureOr<int> getIsDangerCountByLicense(License license);

  // Get questions by its difficulty status
  FutureOr<Question> getIsDifficultByLicense(
    License license,
    int index,
  );
  FutureOr<List<Question>> getIsDifficultPageByLicense(
    License license,
    int pageNumber,
  );
  FutureOr<int> getIsDifficultCountByLicense(License license);
}

@Riverpod(keepAlive: true)
QuestionsRepository questionsRepository(QuestionsRepositoryRef ref) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}
