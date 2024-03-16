import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class UserAnswersRepository {
  FutureOr<void> saveUserAnswer(Question question, int selectedAnswerIndex);
  FutureOr<void> deleteUserAnswer(Question question);
  FutureOr<void> deleteAllUserAnswers();
  Stream<int?> watchUserSelectedAnswerIndex(Question question);
  FutureOr<List<UserAnswer>> getAllWrongAnswers();
}
