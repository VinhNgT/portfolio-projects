import 'package:driving_license/features/questions/data/user_answer/user_answer_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_answer_service.g.dart';

class UserAnswerService {
  UserAnswerService(this.ref);
  final Ref ref;

  UserAnswerRepository get userAnswerRepository =>
      ref.read(userAnswerRepositoryProvider);

  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) async {
    await userAnswerRepository.saveUserAnswer(question, selectedAnswerIndex);
  }

  Future<void> deleteUserAnswer(Question question) async {
    await userAnswerRepository.deleteUserAnswer(question);
  }

  Future<void> deleteAllUserAnswers() async {
    await userAnswerRepository.deleteAllUserAnswers();
  }

  Stream<int?> watchUserSelectedAnswerIndex(Question question) async* {
    yield* userAnswerRepository.watchUserSelectedAnswerIndex(question);
  }

  Stream<List<UserAnswer>> watchAllWrongAnswers() {
    return userAnswerRepository.watchAllWrongAnswers();
  }

  Future<List<UserAnswer>> getAllWrongAnswers() {
    return userAnswerRepository.getAllWrongAnswers();
  }
}

@Riverpod(keepAlive: true)
UserAnswerService userAnswerService(UserAnswerServiceRef ref) {
  return UserAnswerService(ref);
}

@riverpod
Stream<int?> userSelectedAnswerIndex(
  UserSelectedAnswerIndexRef ref,
  Question question,
) {
  final userAnswerService = ref.watch(userAnswerServiceProvider);
  return userAnswerService.watchUserSelectedAnswerIndex(question);
}
