import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';

abstract class UserAnswersHandler {
  Future<void> saveUserAnswer(Question question, int selectedAnswerIndex);
  Future<void> clearUserAnswer(Question question);
  Future<void> clearAllUserAnswers();
  Stream<int?> watchUserSelectedAnswerIndex(Question question);
  Future<UserAnswersMap> getAllWrongAnswers();
}

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
  Future<void> clearUserAnswer(Question question) {
    return userAnswersRepository.clearUserAnswer(question);
  }

  @override
  Future<void> clearAllUserAnswers() {
    return userAnswersRepository.clearAllUserAnswers();
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

class InMemoryUserAnswersHandler implements UserAnswersHandler {
  InMemoryUserAnswersHandler({
    required this.userAnswersRepository,
    required this.inMemoryUserAnswersRepository,
    required this.userAnswersBeforeStart,
  });

  final UserAnswersRepository userAnswersRepository;
  final UserAnswersRepository inMemoryUserAnswersRepository;
  final UserAnswersMap userAnswersBeforeStart;

  @override
  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) async {
    await userAnswersRepository.saveUserAnswer(question, selectedAnswerIndex);
    await inMemoryUserAnswersRepository.saveUserAnswer(
      question,
      selectedAnswerIndex,
    );
  }

  @override
  Future<void> clearUserAnswer(Question question) async {
    final userAnswerAtStart = userAnswersBeforeStart[question.questionDbIndex]!;

    // Restore the user's answer from the start of the session
    await userAnswersRepository.saveUserAnswer(
      question,
      userAnswerAtStart.selectedAnswerIndex,
    );
    await inMemoryUserAnswersRepository.clearUserAnswer(question);
  }

  @override
  Future<void> clearAllUserAnswers() async {
    // We don't need to implement this for now
    throw UnimplementedError('clearAllUserAnswers is not implemented');
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    return inMemoryUserAnswersRepository.watchUserSelectedAnswerIndex(question);
  }

  @override
  Future<UserAnswersMap> getAllWrongAnswers() {
    return userAnswersRepository.getAllWrongAnswers();
  }
}
