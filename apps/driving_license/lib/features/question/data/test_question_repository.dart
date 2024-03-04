import 'dart:async';

import 'package:driving_license/features/question/data/k_test_questions.dart';
import 'package:driving_license/features/question/data/question_repository.dart';
import 'package:driving_license/features/question/domain/question.dart';

class TestQuestionRepository implements QuestionRepository {
  final Duration artificialDelay;
  TestQuestionRepository({
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
  FutureOr<List<Question>> getQuestionsPage(int pageKey) async {
    await Future.delayed(artificialDelay);

    final int start = QuestionRepository.pageSize * pageKey;
    final int end = start + QuestionRepository.pageSize > kTestQuestions.length
        ? kTestQuestions.length
        : start + QuestionRepository.pageSize;

    return kTestQuestions.sublist(start, end);
  }
}
