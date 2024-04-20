import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/chapters/domain/sub_chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_repository.g.dart';

abstract interface class QuestionsRepository {
  static int pageSize = 20;

  FutureOr<Question> getQuestionByDbIndex(int dbIndex);
  FutureOr<Question> getQuestion(
    License license,
    int index, {
    Chapter? chapter,
    bool filterDangerQuestions = false,
    bool filterDifficultQuestions = false,
  });

  FutureOr<int> getQuestionsCount(
    License license, {
    Chapter? chapter,
    bool filterDangerQuestions = false,
    bool filterDifficultQuestions = false,
  });

  FutureOr<List<Question>> getQuestionsPage(int pageNumber);
  FutureOr<List<Question>> getQuestionsPageByDbIndexes(
    Iterable<int> dbIndexes,
    int pageNumber,
  );

  FutureOr<List<Question>> getQuestionsPageByLicenseAndChapter(
    License license,
    Chapter chapter,
    int pageNumber,
  );

  FutureOr<Iterable<int>> getQuestionDbIndexesByLicenseAndChapter(
    License license,
    Chapter chapter, {
    bool skipIsDanger = false,
  });
  FutureOr<Iterable<int>> getQuestionDbIndexesByLicenseAndSubChapter(
    License license,
    SubChapter chapter, {
    bool skipIsDanger = false,
  });

  FutureOr<List<Question>> getIsDangerQuestionsPageByLicense(
    License license,
    int pageNumber,
  );
  FutureOr<Iterable<int>> getIsDangerQuestionDbIndexesByLicense(
    License license,
  );

  FutureOr<List<Question>> getIsDifficultQuestionsPageByLicense(
    License license,
    int pageNumber,
  );
}

@Riverpod(keepAlive: true)
QuestionsRepository questionsRepository(QuestionsRepositoryRef ref) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}
