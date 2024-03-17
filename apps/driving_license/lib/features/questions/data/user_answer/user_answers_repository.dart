import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_answers_repository.g.dart';

abstract class UserAnswersRepository {
  Future<void> saveUserAnswer(Question question, int selectedAnswerIndex);
  Future<void> deleteUserAnswer(Question question);
  Future<void> deleteAllUserAnswers();
  Stream<int?> watchUserSelectedAnswerIndex(Question question);
  Future<List<UserAnswer>> getAllWrongAnswers();
}

@Riverpod(keepAlive: true)
UserAnswersRepository userAnswersRepository(
  UserAnswersRepositoryRef ref,
) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}