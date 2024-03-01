import 'package:driving_license/features/question/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_repository.g.dart';

abstract class QuestionRepository {
  Question getQuestion(int index);
  FutureOr<int> getQuestionCount();
}

@riverpod
QuestionRepository questionRepository(QuestionRepositoryRef ref) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}

@riverpod
Question questionFuture(QuestionFutureRef ref, int index) {
  final questionRepository = ref.watch(questionRepositoryProvider);
  return questionRepository.getQuestion(index);
}

@riverpod
FutureOr<int> questionCountFuture(QuestionCountFutureRef ref) {
  final questionRepository = ref.watch(questionRepositoryProvider);
  return questionRepository.getQuestionCount();
}
