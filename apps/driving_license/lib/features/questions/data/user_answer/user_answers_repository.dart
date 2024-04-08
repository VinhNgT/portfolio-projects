import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_answers_repository.g.dart';

/// A typedef representing a map of user answers.
///
/// The keys of the map are integers representing question DB IDs,
/// and the values are [UserAnswer] objects representing the user's answer
/// for each question.
typedef UserAnswersMap = Map<int, UserAnswer>;

abstract class UserAnswersRepository {
  Future<void> saveAnswer(Question question, int selectedAnswerIndex);
  Future<void> clearAnswer(Question question);
  Future<void> clearAllAnswers();
  Stream<int?> watchUserSelectedAnswerIndex(Question question);
  Future<UserAnswersMap> getAllWrongAnswersByLicense(License license);
  Future<UserAnswersMap> getAllDifficultQuestionAnswersByLicense(
    License license,
  );
  Stream<int> watchAnswersCountByLicenseAndChapter(
    License license,
    Chapter chapter,
  );
  Stream<int> watchWrongAnswersCountByLicenseAndChapter(
    License license,
    Chapter chapter,
  );
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
