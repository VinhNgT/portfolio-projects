import 'package:collection/collection.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:driving_license/utils/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'in_memory_user_answers_repository.g.dart';

class InMemoryUserAnswersRepository implements UserAnswersRepository {
  final allAnswersStore = InMemoryStore<List<UserAnswer>>(List.empty());
  final answeredWrongStore = InMemoryStore<List<UserAnswer>>(List.empty());

  @override
  FutureOr<void> saveUserAnswer(Question question, int selectedAnswerIndex) {
    final userAnswer = UserAnswer(
      questionDbIndex: question.questionDbIndex,
      selectedAnswerIndex: selectedAnswerIndex,
    );

    allAnswersStore.value.add(userAnswer);
    if (question.correctAnswerIndex != selectedAnswerIndex) {
      answeredWrongStore.value.add(userAnswer);
    }
  }

  @override
  FutureOr<void> deleteAllUserAnswers() {
    allAnswersStore.value = List.empty();
    answeredWrongStore.value = List.empty();
  }

  @override
  FutureOr<void> deleteUserAnswer(Question question) {
    allAnswersStore.value.removeWhere(
      (answer) => answer.questionDbIndex == question.questionDbIndex,
    );
    answeredWrongStore.value.removeWhere(
      (answer) => answer.questionDbIndex == question.questionDbIndex,
    );
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    return allAnswersStore.stream.map((answers) {
      final userAnswer = answers.firstWhereOrNull(
        (answer) => answer.questionDbIndex == question.questionDbIndex,
      );
      return userAnswer?.selectedAnswerIndex;
    });
  }

  @override
  FutureOr<List<UserAnswer>> getAllWrongAnswers() {
    return answeredWrongStore.value;
  }
}

@Riverpod(keepAlive: true)
InMemoryUserAnswersRepository inMemoryUserAnswersRepository(
  InMemoryUserAnswersRepositoryRef ref,
) {
  return InMemoryUserAnswersRepository();
}
