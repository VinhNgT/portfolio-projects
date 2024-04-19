import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answers_map.dart';
import 'package:driving_license/features/questions/domain/user_answers_summary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_answers_repository.g.dart';

abstract interface class UserAnswersRepository {
  Future<void> saveAnswer(Question question, int selectedAnswerIndex);
  Future<void> clearAnswer(Question question);
  Future<void> clearAllAnswers();
  Future<void> clearAllAnswersByLicenseAndChapter(
    License license,
    Chapter chapter,
  );
  Stream<int?> watchUserSelectedAnswerIndex(Question question);
  Future<UserAnswersMap> getAllWrongAnswersByLicense(License license);
  Future<UserAnswersMap> getAllDifficultQuestionAnswersByLicense(
    License license,
  );
  Stream<UserAnswersSummary> watchUserAnswersSummary(
    License license, [
    Chapter? chapter,
    bool filterIsDanger = false,
  ]);
  Future<int?> getFirstUnansweredPositionInList(Iterable<int> dbIndexes);
  Future<UserAnswersMap> getAnswersByQuestionDbIndexes(
    Iterable<int> dbIndexes,
  );
}

@Riverpod(keepAlive: true)
UserAnswersRepository userAnswersRepository(
  UserAnswersRepositoryRef ref,
) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}
