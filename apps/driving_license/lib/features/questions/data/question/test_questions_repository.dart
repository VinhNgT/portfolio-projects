// ignore_for_file: override_on_non_overriding_member

import 'dart:async';

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/chapters/domain/sub_chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/question/k_test_questions.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';

class TestQuestionsRepository implements QuestionsRepository {
  TestQuestionsRepository({
    this.artificialDelay = Duration.zero,
  });
  final Duration artificialDelay;

  @override
  FutureOr<Question> getQuestion(
    License license,
    int index, {
    Chapter? chapter,
    bool filterDangerQuestions = false,
    bool filterDifficultQuestions = false,
  }) async {
    await Future.delayed(artificialDelay);
    return kTestQuestions[index];
  }

  @override
  Future<int> getQuestionsCount(
    License license, {
    Chapter? chapter,
    bool filterDangerQuestions = false,
    bool filterDifficultQuestions = false,
  }) async {
    await Future.delayed(artificialDelay);
    return kTestQuestions.length;
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(
    License license,
    int pageNumber, {
    Chapter? chapter,
    bool filterDangerQuestions = false,
    bool filterDifficultQuestions = false,
  }) async {
    await Future.delayed(artificialDelay);

    final int start = QuestionsRepository.pageSize * pageNumber;
    final int end = start + QuestionsRepository.pageSize > kTestQuestions.length
        ? kTestQuestions.length
        : start + QuestionsRepository.pageSize;

    return kTestQuestions.sublist(start, end);
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
  FutureOr<Question> getIsDangerQuestionByLicense(License license, int index) {
    // TODO: implement getIsDangerByLicense
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
    License license,
    int index,
  ) {
    // TODO: implement getIsDifficultByLicense
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

  @override
  FutureOr<Iterable<int>> getIsDangerQuestionDbIndexesByLicense(
    License license, {
    bool skipIsDanger = false,
  }) {
    // TODO: implement getIsDangerQuestionDbIndexesByLicense
    throw UnimplementedError();
  }

  @override
  FutureOr<Iterable<int>> getQuestionDbIndexesByLicenseAndChapter(
    License license,
    Chapter chapter, {
    bool skipIsDanger = false,
  }) {
    // TODO: implement getQuestionDbIndexesByLicenseAndChapter
    throw UnimplementedError();
  }

  @override
  FutureOr<Iterable<int>> getQuestionDbIndexesByLicenseAndSubChapter(
    License license,
    SubChapter chapter, {
    bool skipIsDanger = false,
  }) {
    // TODO: implement getQuestionDbIndexesByLicenseAndSubChapter
    throw UnimplementedError();
  }

  @override
  FutureOr<Question> getQuestionByDbIndex(int dbIndex) {
    // TODO: implement getQuestionByDbIndex
    throw UnimplementedError();
  }

  @override
  FutureOr<Iterable<int>> getQuestionDbIndexes(
    License license, {
    Chapter? chapter,
    SubChapter? subChapter,
    bool filterDangerQuestions = false,
    bool skipDangerQuesions = false,
  }) {
    // TODO: implement getQuestionDbIndexes
    throw UnimplementedError();
  }
}
