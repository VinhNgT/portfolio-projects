import 'dart:async';

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
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
  FutureOr<int> getQuestionsCount() async {
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
  FutureOr<Question> getQuestionByDbIndex(int dbIndex) {
    // TODO: implement getByDbIndex
    throw UnimplementedError();
  }

  @override
  FutureOr<Question> getQuestionByLicenseAndChapter(
    License license,
    Chapter chapter,
    int index,
  ) {
    // TODO: implement getByLicenseAndChapter
    throw UnimplementedError();
  }

  @override
  FutureOr<int> getQuestionsCountByLicenseAndChapter(
    License license,
    Chapter chapter,
  ) {
    // TODO: implement getCountByLicenseAndChapter
    throw UnimplementedError();
  }

  @override
  FutureOr<Question> getIsDangerQuestionByLicense(License license, int index) {
    // TODO: implement getIsDangerByLicense
    throw UnimplementedError();
  }

  @override
  FutureOr<int> getIsDangerQuestionsCountByLicense(License license) {
    // TODO: implement getIsDangerCountByLicense
    throw UnimplementedError();
  }

  @override
  FutureOr<List<Question>> getIsDangerQuestionsPageByLicense(
    License license,
    int pageNumber,
  ) {
    // TODO: implement getIsDangerPageByLicense
    throw UnimplementedError();
  }

  @override
  FutureOr<Question> getIsDifficultQuestionByLicense(
      License license, int index) {
    // TODO: implement getIsDifficultByLicense
    throw UnimplementedError();
  }

  @override
  FutureOr<int> getIsDifficultQuestionsCountByLicense(License license) {
    // TODO: implement getIsDifficultCountByLicense
    throw UnimplementedError();
  }

  @override
  FutureOr<List<Question>> getIsDifficultQuestionsPageByLicense(
    License license,
    int pageNumber,
  ) {
    // TODO: implement getIsDifficultPageByLicense
    throw UnimplementedError();
  }

  @override
  FutureOr<List<Question>> getQuestionsPageByDbIndexes(
    Iterable<int> dbIndexes,
    int pageNumber,
  ) {
    // TODO: implement getPageByDbIndexes
    throw UnimplementedError();
  }

  @override
  FutureOr<List<Question>> getQuestionsPageByLicenseAndChapter(
    License license,
    Chapter chapter,
    int pageNumber,
  ) {
    // TODO: implement getPageByLicenseAndChapter
    throw UnimplementedError();
  }
}
