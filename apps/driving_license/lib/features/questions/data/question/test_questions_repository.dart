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
  FutureOr<Question> get(int index) async {
    await Future.delayed(artificialDelay);
    return kTestQuestions[index];
  }

  @override
  FutureOr<int> getCount() async {
    await Future.delayed(artificialDelay);
    return kTestQuestions.length;
  }

  @override
  FutureOr<List<Question>> getPage(int pageNumber) async {
    await Future.delayed(artificialDelay);

    final int start = QuestionsRepository.pageSize * pageNumber;
    final int end = start + QuestionsRepository.pageSize > kTestQuestions.length
        ? kTestQuestions.length
        : start + QuestionsRepository.pageSize;

    return kTestQuestions.sublist(start, end);
  }

  @override
  FutureOr<Question> getByDbIndex(int dbIndex) {
    // TODO: implement getByDbIndex
    throw UnimplementedError();
  }

  @override
  FutureOr<Question> getByLicenseAndChapter(
      License license, Chapter chapter, int index) {
    // TODO: implement getByLicenseAndChapter
    throw UnimplementedError();
  }

  @override
  FutureOr<int> getCountByLicenseAndChapter(License license, Chapter chapter) {
    // TODO: implement getCountByLicenseAndChapter
    throw UnimplementedError();
  }

  @override
  FutureOr<Question> getIsDangerByLicense(License license, int index) {
    // TODO: implement getIsDangerByLicense
    throw UnimplementedError();
  }

  @override
  FutureOr<int> getIsDangerCountByLicense(License license) {
    // TODO: implement getIsDangerCountByLicense
    throw UnimplementedError();
  }

  @override
  FutureOr<List<Question>> getIsDangerPageByLicense(
      License license, int pageNumber) {
    // TODO: implement getIsDangerPageByLicense
    throw UnimplementedError();
  }

  @override
  FutureOr<Question> getIsDifficultByLicense(License license, int index) {
    // TODO: implement getIsDifficultByLicense
    throw UnimplementedError();
  }

  @override
  FutureOr<int> getIsDifficultCountByLicense(License license) {
    // TODO: implement getIsDifficultCountByLicense
    throw UnimplementedError();
  }

  @override
  FutureOr<List<Question>> getIsDifficultPageByLicense(
      License license, int pageNumber) {
    // TODO: implement getIsDifficultPageByLicense
    throw UnimplementedError();
  }

  @override
  FutureOr<List<Question>> getPageByDbIndexes(
      Iterable<int> dbIndexes, int pageNumber) {
    // TODO: implement getPageByDbIndexes
    throw UnimplementedError();
  }

  @override
  FutureOr<List<Question>> getPageByLicenseAndChapter(
      License license, Chapter chapter, int pageNumber) {
    // TODO: implement getPageByLicenseAndChapter
    throw UnimplementedError();
  }
}
