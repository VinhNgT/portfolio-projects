import 'dart:async';

import 'package:collection/collection.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';

sealed class QuestionsHandler {
  FutureOr<Question> getQuestion(int questionIndex);
  FutureOr<List<Question>> getQuestionsPage(int pageIndex);
  FutureOr<int> getQuestionCount();
}

class FullQuestionsHandler implements QuestionsHandler {
  final QuestionsRepository questionsRepository;
  FullQuestionsHandler({required this.questionsRepository});

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository.getQuestion(License.all, questionIndex);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getQuestionsPage(pageIndex);
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getQuestionsCount(License.all);
  }
}

class ChapterQuestionsHandler implements QuestionsHandler {
  final QuestionsRepository questionsRepository;
  final License license;
  final Chapter chapter;

  ChapterQuestionsHandler({
    required this.questionsRepository,
    required this.license,
    required this.chapter,
  });

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository.getQuestion(
      license,
      questionIndex,
      chapter: chapter,
    );
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getQuestionsPageByLicenseAndChapter(
      license,
      chapter,
      pageIndex,
    );
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getQuestionsCount(
      license,
      chapter: chapter,
    );
  }
}

class DangerQuestionsHandler implements QuestionsHandler {
  final QuestionsRepository questionsRepository;
  final License license;

  DangerQuestionsHandler({
    required this.questionsRepository,
    required this.license,
  });

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository.getQuestion(
      license,
      questionIndex,
      filterDangerQuestions: true,
    );
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getIsDangerQuestionsPageByLicense(
      license,
      pageIndex,
    );
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getQuestionsCount(
      license,
      filterDangerQuestions: true,
    );
  }
}

class DifficultQuestionsHandler implements QuestionsHandler {
  final QuestionsRepository questionsRepository;
  final License license;

  DifficultQuestionsHandler({
    required this.questionsRepository,
    required this.license,
  });

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository.getQuestion(
      license,
      questionIndex,
      filterDifficultQuestions: true,
    );
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getIsDifficultQuestionsPageByLicense(
      license,
      pageIndex,
    );
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getQuestionsCount(
      license,
      filterDifficultQuestions: true,
    );
  }
}

class CustomQuestionListQuestionHandler implements QuestionsHandler {
  final QuestionsRepository questionsRepository;
  final List<int> sortedQuestionDbIndexes;

  CustomQuestionListQuestionHandler({
    required this.questionsRepository,
    required this.sortedQuestionDbIndexes,
  }) : assert(sortedQuestionDbIndexes.isSorted((a, b) => a - b));

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository
        .getQuestionByDbIndex(sortedQuestionDbIndexes[questionIndex]);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getQuestionsPageByDbIndexes(
      sortedQuestionDbIndexes,
      pageIndex,
    );
  }

  @override
  FutureOr<int> getQuestionCount() {
    return Future.value(sortedQuestionDbIndexes.length);
  }
}
