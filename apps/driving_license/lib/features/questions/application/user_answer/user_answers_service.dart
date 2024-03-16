import 'package:driving_license/features/questions/data/user_answer/sembast_user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_answers_service.g.dart';

class UserAnswersService {
  UserAnswersService(this.ref);
  final Ref ref;

  SembastUserAnswersRepository get userAnswersRepository =>
      ref.read(sembastUserAnswersRepositoryProvider);

  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) async {
    await userAnswersRepository.saveUserAnswer(question, selectedAnswerIndex);
  }

  Future<void> deleteUserAnswer(Question question) async {
    await userAnswersRepository.deleteUserAnswer(question);
  }

  Future<void> deleteAllUserAnswers() async {
    await userAnswersRepository.deleteAllUserAnswers();
  }

  Stream<int?> watchUserSelectedAnswerIndex(Question question) async* {
    yield* userAnswersRepository.watchUserSelectedAnswerIndex(question);
  }

  Stream<List<UserAnswer>> watchAllWrongAnswers() {
    return userAnswersRepository.watchAllWrongAnswers();
  }

  Future<List<UserAnswer>> getAllWrongAnswers() {
    return userAnswersRepository.getAllWrongAnswers();
  }
}

@Riverpod(keepAlive: true)
UserAnswersService userAnswersService(UserAnswersServiceRef ref) {
  return UserAnswersService(ref);
}

@riverpod
Stream<int?> userSelectedAnswerIndex(
  UserSelectedAnswerIndexRef ref,
  Question question,
) {
  final userAnswersService = ref.watch(userAnswersServiceProvider);
  return userAnswersService.watchUserSelectedAnswerIndex(question);
}
