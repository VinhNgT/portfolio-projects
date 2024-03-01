import 'package:driving_license/features/question/data/k_test_questions.dart';
import 'package:driving_license/features/question/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_repository.g.dart';

class QuestionRepository {
  Question getQuestion(int index) {
    return kTestQuestions[index];
  }

  int getQuestionCount() {
    return kTestQuestions.length;
  }
}

@riverpod
QuestionRepository questionRepository(QuestionRepositoryRef ref) {
  return QuestionRepository();
}
