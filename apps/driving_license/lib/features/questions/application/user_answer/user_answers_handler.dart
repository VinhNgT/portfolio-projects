import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';

abstract class UserAnswersHandler implements UserAnswersRepository {}

class DirectUserAnswersHandler implements UserAnswersHandler {
  DirectUserAnswersHandler({required this.userAnswersRepository});
  final UserAnswersRepository userAnswersRepository;

  @override
  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) {
    return userAnswersRepository.saveUserAnswer(question, selectedAnswerIndex);
  }

  @override
  Future<void> deleteUserAnswer(Question question) {
    return userAnswersRepository.deleteUserAnswer(question);
  }

  @override
  Future<void> deleteAllUserAnswers() {
    return userAnswersRepository.deleteAllUserAnswers();
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    return userAnswersRepository.watchUserSelectedAnswerIndex(question);
  }

  @override
  Future<List<UserAnswer>> getAllWrongAnswers() {
    return userAnswersRepository.getAllWrongAnswers();
  }
}

class WrongUserAnswersHandler implements UserAnswersHandler {
  WrongUserAnswersHandler({
    required this.userAnswersRepository,
    required this.tempUserAnswersRepository,
  });
  final UserAnswersRepository userAnswersRepository;
  final UserAnswersRepository tempUserAnswersRepository;

  @override
  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) async {
    await userAnswersRepository.saveUserAnswer(question, selectedAnswerIndex);
    await tempUserAnswersRepository.saveUserAnswer(
      question,
      selectedAnswerIndex,
    );
  }

  @override
  Future<void> deleteUserAnswer(Question question) {
    return tempUserAnswersRepository.deleteUserAnswer(question);
  }

  @override
  Future<void> deleteAllUserAnswers() {
    return tempUserAnswersRepository.deleteAllUserAnswers();
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    return tempUserAnswersRepository.watchUserSelectedAnswerIndex(question);
  }

  @override
  Future<List<UserAnswer>> getAllWrongAnswers() {
    return userAnswersRepository.getAllWrongAnswers();
  }
}
