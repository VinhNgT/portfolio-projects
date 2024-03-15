import 'package:driving_license/features/questions/application/question_service.dart';
import 'package:driving_license/features/questions/data/user_answer_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_answer_service.g.dart';

class UserAnswerService {
  UserAnswerService(this.ref);
  final Ref ref;

  UserAnswerRepository get userAnswerRepository =>
      ref.read(userAnswerRepositoryProvider);

  Future<void> saveUserAnswer(
    int questionIndex,
    int selectedAnswerIndex,
  ) async {
    final question =
        await ref.read(questionFutureProvider(questionIndex).future);

    await userAnswerRepository.saveUserAnswer(
      question.questionDbIndex,
      selectedAnswerIndex,
    );
  }

  Future<void> deleteUserAnswer(int questionIndex) async {
    final question =
        await ref.read(questionFutureProvider(questionIndex).future);
    await userAnswerRepository.deleteUserAnswer(question.questionDbIndex);
  }

  Future<void> deleteAllUserAnswers() async {
    await userAnswerRepository.deleteAllUserAnswers();
  }

  Stream<int?> watchUserSelectedAnswerIndex(int questionIndex) async* {
    final question =
        await ref.read(questionFutureProvider(questionIndex).future);

    yield* userAnswerRepository
        .watchUserSelectedAnswerIndex(question.questionDbIndex);
  }
}

@Riverpod(keepAlive: true)
UserAnswerService userAnswerService(UserAnswerServiceRef ref) {
  return UserAnswerService(ref);
}

@riverpod
Stream<int?> userSelectedAnswerIndex(
  UserSelectedAnswerIndexRef ref,
  int questionIndex,
) {
  final userAnswerService = ref.watch(userAnswerServiceProvider);
  return userAnswerService.watchUserSelectedAnswerIndex(questionIndex);
}
