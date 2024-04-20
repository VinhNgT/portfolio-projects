import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answers_map.dart';
import 'package:driving_license/features/questions/domain/user_answers_summary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_answers_repository.g.dart';

abstract interface class UserAnswersRepository {
  FutureOr<void> saveAnswer(Question question, int selectedAnswerIndex);

  FutureOr<void> clearAnswer(Question question);
  FutureOr<void> clearAllAnswers(
    License license, {
    Chapter? chapter,
  });
  FutureOr<void> clearDatabase();

  Stream<int?> watchUserSelectedAnswerIndex(Question question);
  FutureOr<UserAnswersMap> getAllAnswers(
    License license, {
    Chapter? chapter,
    bool filterWrongAnswers = false,
    bool filterDangerAnswers = false,
    bool filterDifficultAnswers = false,
  });
  Stream<UserAnswersSummary> watchUserAnswersSummary(
    License license, {
    Chapter? chapter,
    bool filterDangerAnswers = false,
  });

  FutureOr<int?> getFirstUnansweredPositionInList(Iterable<int> dbIndexes);
  FutureOr<UserAnswersMap> getAnswersByQuestionDbIndexes(
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
