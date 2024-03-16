import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';

abstract class UserAnswersRepository {
  Future<void> saveUserAnswer(Question question, int selectedAnswerIndex);
  Future<void> deleteUserAnswer(Question question);
  Future<void> deleteAllUserAnswers();
  Stream<int?> watchUserSelectedAnswerIndex(Question question);
  Future<List<UserAnswer>> getAllWrongAnswers();
}
