import 'package:driving_license/features/questions/data/user_answer/in_memory_user_answers_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answers_map.dart';
import 'package:flutter/material.dart';

@immutable
sealed class UserAnswersHandler {
  const UserAnswersHandler();

  Future<void> saveUserAnswer(Question question, int selectedAnswerIndex);
  Future<void> clearUserAnswer(Question question);
  Future<void> clearAllUserAnswers();
  Stream<int?> watchUserSelectedAnswerIndex(Question question);
  Future<UserAnswersMap> getAnswersByQuestionDbIndexes(
    Iterable<int> dbIndexes,
  );
}

class DirectUserAnswersHandler extends UserAnswersHandler {
  final UserAnswersRepository userAnswersRepository;

  const DirectUserAnswersHandler({
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
    return userAnswersRepository.clearDatabase();
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    return userAnswersRepository.watchUserSelectedAnswerIndex(question);
  }

  @override
  Future<UserAnswersMap> getAnswersByQuestionDbIndexes(
    Iterable<int> dbIndexes,
  ) {
    return userAnswersRepository.getAnswersByQuestionDbIndexes(dbIndexes);
  }
}

class InMemoryUserAnswersHandler extends UserAnswersHandler {
  final InMemoryUserAnswersRepository inMemoryUserAnswersRepository;

  const InMemoryUserAnswersHandler({
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
    return inMemoryUserAnswersRepository.clearDatabase();
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    return inMemoryUserAnswersRepository.watchUserSelectedAnswerIndex(question);
  }

  @override
  Future<UserAnswersMap> getAnswersByQuestionDbIndexes(
    Iterable<int> dbIndexes,
  ) {
    return inMemoryUserAnswersRepository
        .getAnswersByQuestionDbIndexes(dbIndexes);
  }
}

class HideUserAnswersHandler extends UserAnswersHandler {
  final UserAnswersRepository userAnswersRepository;
  final InMemoryUserAnswersHandler inMemoryUserAnswersHandler;
  final UserAnswersMap userAnswersBeforeStart;

  const HideUserAnswersHandler({
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

  @override
  Future<UserAnswersMap> getAnswersByQuestionDbIndexes(
    Iterable<int> dbIndexes,
  ) {
    return inMemoryUserAnswersHandler.getAnswersByQuestionDbIndexes(dbIndexes);
  }
}
