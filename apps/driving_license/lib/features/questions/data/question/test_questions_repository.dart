import 'dart:async';

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/data/question/k_test_questions.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';

class TestQuestionsRepository implements QuestionsRepository {
  final Duration artificialDelay;
  TestQuestionsRepository({
    this.artificialDelay = Duration.zero,
  });

  @override
  FutureOr<Question> getQuestion(int index) async {
    await Future.delayed(artificialDelay);
    return kTestQuestions[index];
  }

  @override
  FutureOr<int> getQuestionCount() async {
    await Future.delayed(artificialDelay);
    return kTestQuestions.length;
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageNumber) async {
    await Future.delayed(artificialDelay);

    final int start = QuestionsRepository.pageSize * pageNumber;
    final int end = start + QuestionsRepository.pageSize > kTestQuestions.length
        ? kTestQuestions.length
        : start + QuestionsRepository.pageSize;

    return kTestQuestions.sublist(start, end);
  }

  @override
  FutureOr<Question> getQuestionByChapter(Chapter chapter, int index) async {
    return getQuestion(index);
  }

  @override
  FutureOr<List<Question>> getQuestionsPageByChapter(
    Chapter chapter,
    int pageNumber,
  ) {
    return getQuestionsPage(pageNumber);
  }

  @override
  FutureOr<int> getQuestionCountByChapter(Chapter chapter) {
    return getQuestionCount();
  }

  @override
  FutureOr<List<Question>> getQuestionsPageByDbIndexes(
    Iterable<int> indexes,
    int pageNumber,
  ) {
    // TODO: implement getQuestionsPageByIndexes
    throw UnimplementedError();
  }

  @override
  FutureOr<Question> getQuestionByDbIndex(int dbIndex) {
    // TODO: implement getQuestionByDbIndex
    throw UnimplementedError();
  }

  @override
  FutureOr<Question> getIsDangerQuestion(int index) {
    // TODO: implement getIsDangerQuestion
    throw UnimplementedError();
  }

  @override
  FutureOr<int> getIsDangerQuestionsCount() {
    // TODO: implement getIsDangerQuestionsCount
    throw UnimplementedError();
  }

  @override
  FutureOr<List<Question>> getIsDangerQuestionsPage(int pageNumber) {
    // TODO: implement getIsDangerQuestionsPage
    throw UnimplementedError();
  }

  @override
  FutureOr<Question> getIsDifficultQuestion(int index) {
    // TODO: implement getIsDifficultQuestion
    throw UnimplementedError();
  }

  @override
  FutureOr<int> getIsDifficultQuestionsCount() {
    // TODO: implement getIsDifficultQuestionsCount
    throw UnimplementedError();
  }

  @override
  FutureOr<List<Question>> getIsDifficultQuestionsPage(int pageNumber) {
    // TODO: implement getIsDifficultQuestionsPage
    throw UnimplementedError();
  }

  @override
  FutureOr<List<int>> getIsDangerDbQuestionIndexes() {
    // TODO: implement getIsDangerQuestionIndexes
    throw UnimplementedError();
  }

  @override
  FutureOr<List<int>> getIsDifficultDbQuestionIndexes() {
    // TODO: implement getIsDifficultQuestionIndexes
    throw UnimplementedError();
  }

  @override
  FutureOr<List<int>> getQuestionDbIndexesByChapter(Chapter chapter) {
    // TODO: implement getQuestionIndexesByChapter
    throw UnimplementedError();
  }
}
