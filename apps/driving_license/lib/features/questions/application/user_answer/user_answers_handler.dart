import 'package:driving_license/features/questions/data/user_answer/in_memory_user_answers_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';

sealed class UserAnswersHandler {
  Future<void> saveUserAnswer(Question question, int selectedAnswerIndex);
  Future<void> clearUserAnswer(Question question);
  Future<void> clearAllUserAnswers();
  Stream<int?> watchUserSelectedAnswerIndex(Question question);
}

class DirectUserAnswersHandler implements UserAnswersHandler {
  final UserAnswersRepository userAnswersRepository;

  DirectUserAnswersHandler({
    required this.userAnswersRepository,
  });

  @override
  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) {
    return userAnswersRepository.saveAnswer(question, selectedAnswerIndex);
  }

  @override
  Future<void> clearUserAnswer(Question question) {
    return userAnswersRepository.clearAnswer(question);
  }

  @override
  Future<void> clearAllUserAnswers() {
    return userAnswersRepository.clearAllAnswers();
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    return userAnswersRepository.watchUserSelectedAnswerIndex(question);
  }
}

class InMemoryUserAnswersHandler implements UserAnswersHandler {
  final InMemoryUserAnswersRepository inMemoryUserAnswersRepository;

  InMemoryUserAnswersHandler({
    required this.inMemoryUserAnswersRepository,
  });

  @override
  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) {
    return inMemoryUserAnswersRepository.saveAnswer(
      question,
      selectedAnswerIndex,
    );
  }

  @override
  Future<void> clearUserAnswer(Question question) {
    return inMemoryUserAnswersRepository.clearAnswer(question);
  }

  @override
  Future<void> clearAllUserAnswers() {
    return inMemoryUserAnswersRepository.clearAllAnswers();
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    return inMemoryUserAnswersRepository.watchUserSelectedAnswerIndex(question);
  }
}

class HideUserAnswersHandler implements UserAnswersHandler {
  final UserAnswersRepository userAnswersRepository;
  final InMemoryUserAnswersHandler inMemoryUserAnswersHandler;
  final UserAnswersMap userAnswersBeforeStart;

  HideUserAnswersHandler({
    required this.userAnswersRepository,
    required this.inMemoryUserAnswersHandler,
    required this.userAnswersBeforeStart,
  });

  @override
  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) async {
    await userAnswersRepository.saveAnswer(question, selectedAnswerIndex);
    await inMemoryUserAnswersHandler.saveUserAnswer(
      question,
      selectedAnswerIndex,
    );
  }

  @override
  Future<void> clearUserAnswer(Question question) async {
    final userAnswerAtStart = userAnswersBeforeStart[question.questionDbIndex]!;

    // Restore the user's answer from the start of the session
    await userAnswersRepository.saveAnswer(
      question,
      userAnswerAtStart.selectedAnswerIndex,
    );
    await inMemoryUserAnswersHandler.clearUserAnswer(question);
  }

  @override
  Future<void> clearAllUserAnswers() async {
    // We don't need to implement this for now
    throw UnimplementedError('clearAllUserAnswers is not implemented');
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    return inMemoryUserAnswersHandler.watchUserSelectedAnswerIndex(question);
  }
}
