import 'package:driving_license/features/questions/data/question/questions_repository.dart';
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
  Future<void> saveUserAnswer(Question question, int selectedAnswerIndex);
  Future<void> clearUserAnswer(Question question);
  Future<void> clearAllUserAnswers();
  Stream<int?> watchUserSelectedAnswerIndex(Question question);
  Future<UserAnswersMap> getAllWrongAnswers();
  Stream<int> watchCorrectAnswersCount(List<int> questionDbIndexes);
}

@Riverpod(keepAlive: true)
UserAnswersRepository userAnswersRepository(
  UserAnswersRepositoryRef ref,
) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}
