import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';

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
  Future<UserAnswersMap> getAllWrongAnswers() {
    return userAnswersRepository.getAllWrongAnswers();
  }
}

class WrongUserAnswersHandler implements UserAnswersHandler {
  WrongUserAnswersHandler({
    required this.userAnswersRepository,
    required this.tempUserAnswersRepository,
    required this.wrongAnswersBeforeStart,
  });

  final UserAnswersRepository userAnswersRepository;
  final UserAnswersRepository tempUserAnswersRepository;
  final UserAnswersMap wrongAnswersBeforeStart;

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
  Future<void> deleteUserAnswer(Question question) async {
    final userAnswerAtStart =
        wrongAnswersBeforeStart[question.questionDbIndex]!;

    // Restore the user's answer from the start of the test
    await userAnswersRepository.saveUserAnswer(
      question,
      userAnswerAtStart.selectedAnswerIndex,
    );
    await tempUserAnswersRepository.deleteUserAnswer(question);
  }

  @override
  Future<void> deleteAllUserAnswers() async {
    // We don't need to implement this for now
    throw UnimplementedError('deleteAllUserAnswers is not implemented');
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    return tempUserAnswersRepository.watchUserSelectedAnswerIndex(question);
  }

  @override
  Future<UserAnswersMap> getAllWrongAnswers() {
    return userAnswersRepository.getAllWrongAnswers();
  }
}
