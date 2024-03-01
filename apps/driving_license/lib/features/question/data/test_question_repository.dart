import 'dart:async';

import 'package:driving_license/features/question/data/k_test_questions.dart';
import 'package:driving_license/features/question/data/question_repository.dart';
import 'package:driving_license/features/question/domain/question.dart';

class TestQuestionRepository implements QuestionRepository {
  TestQuestionRepository();

  @override
  Question getQuestion(int index) {
    return kTestQuestions[index];
  }

  @override
  FutureOr<int> getQuestionCount() async {
    return kTestQuestions.length;
  }
}
