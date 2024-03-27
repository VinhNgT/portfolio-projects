import 'dart:async';

import 'package:collection/collection.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';

abstract class QuestionsHandler {
  FutureOr<Question> getQuestion(int questionIndex);
  FutureOr<List<Question>> getQuestionsPage(int pageIndex);
  FutureOr<int> getQuestionCount();
}

class FullQuestionsHandler implements QuestionsHandler {
  final QuestionsRepository questionsRepository;
  FullQuestionsHandler({required this.questionsRepository});

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository.get(questionIndex);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getPage(pageIndex);
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getCount();
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
    return questionsRepository.getByLicenseAndChapter(
      license,
      chapter,
      questionIndex,
    );
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getPageByLicenseAndChapter(
      license,
      chapter,
      pageIndex,
    );
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getCountByLicenseAndChapter(license, chapter);
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
    return questionsRepository.getIsDangerByLicense(license, questionIndex);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getIsDangerPageByLicense(license, pageIndex);
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getIsDangerCountByLicense(license);
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
    return questionsRepository.getIsDifficultByLicense(license, questionIndex);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getIsDifficultPageByLicense(license, pageIndex);
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getIsDifficultCountByLicense(license);
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
        .getByDbIndex(sortedQuestionDbIndexes[questionIndex]);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getPageByDbIndexes(
      sortedQuestionDbIndexes,
      pageIndex,
    );
  }

  @override
  FutureOr<int> getQuestionCount() {
    return Future.value(sortedQuestionDbIndexes.length);
  }
}
