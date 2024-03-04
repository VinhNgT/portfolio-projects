import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_repository.g.dart';

abstract class QuestionRepository {
  static int pageSize = 20;

  FutureOr<Question> getQuestion(int index);
  FutureOr<int> getQuestionCount();
  FutureOr<List<Question>> getQuestionsPage(int pageKey);
}

@riverpod
QuestionRepository questionRepository(QuestionRepositoryRef ref) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}

@riverpod
FutureOr<Question> questionFuture(QuestionFutureRef ref, int index) {
  final questionRepository = ref.watch(questionRepositoryProvider);
  return questionRepository.getQuestion(index);
}

@riverpod
FutureOr<int> questionCountFuture(QuestionCountFutureRef ref) {
  final questionRepository = ref.watch(questionRepositoryProvider);
  return questionRepository.getQuestionCount();
}
