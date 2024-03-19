import 'dart:async';

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:driving_license/utils/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'in_memory_user_answers_repository.g.dart';

class InMemoryUserAnswersRepository implements UserAnswersRepository {
  InMemoryUserAnswersRepository({
    required this.allAnswersStore,
    required this.answeredWrongStore,
  });

  final InMemoryStore<Map<int, UserAnswer>> allAnswersStore;
  final InMemoryStore<Map<int, UserAnswer>> answeredWrongStore;

  void notifyListeners() {
    allAnswersStore.emmit();
    answeredWrongStore.emmit();
  }

  @override
  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) async {
    final userAnswer = UserAnswer(
      questionDbIndex: question.questionDbIndex,
      chapterDbIndex: question.chapterDbIndex,
      selectedAnswerIndex: selectedAnswerIndex,
    );

    allAnswersStore.value[question.questionDbIndex] = userAnswer;

    if (question.correctAnswerIndex != selectedAnswerIndex) {
      answeredWrongStore.value[question.questionDbIndex] = userAnswer;
    } else {
      answeredWrongStore.value.remove(question.questionDbIndex);
    }
    notifyListeners();
  }

  @override
  Future<void> clearAllUserAnswers() async {
    allAnswersStore.value = {};
    answeredWrongStore.value = {};
    // No need to call notifyListeners() here because the store will emits the
    // new value automatically when 'value' is updated directly using '='.
  }

  @override
  Future<void> clearUserAnswer(Question question) async {
    allAnswersStore.value.remove(question.questionDbIndex);
    answeredWrongStore.value.remove(question.questionDbIndex);
    notifyListeners();
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    return allAnswersStore.stream.map((answers) {
      final userAnswer = answers[question.questionDbIndex];
      return userAnswer?.selectedAnswerIndex;
    });
  }

  @override
  Future<UserAnswersMap> getAllWrongAnswers() {
    return Future.value(answeredWrongStore.value);
  }

  @override
  Stream<int> watchChapterAnswersCount(Chapter chapter) {
    return allAnswersStore.stream.map((userAnswersMap) {
      return userAnswersMap.values.fold(0, (count, userAnswer) {
        if (userAnswer.chapterDbIndex == chapter.chapterDbIndex) {
          return count++;
        }
        return count;
      });
    });
  }

  @override
  Stream<int> watchChapterWrongAnswersCount(Chapter chapter) {
    return answeredWrongStore.stream.map((userAnswersMap) {
      return userAnswersMap.values.fold(0, (count, userAnswer) {
        if (userAnswer.chapterDbIndex == chapter.chapterDbIndex) {
          return count++;
        }
        return count;
      });
    });
  }
}

@Riverpod(keepAlive: true)
InMemoryUserAnswersRepository inMemoryUserAnswersRepository(
  InMemoryUserAnswersRepositoryRef ref,
) {
  final allAnswersStore = InMemoryStore<Map<int, UserAnswer>>({});
  final answeredWrongStore = InMemoryStore<Map<int, UserAnswer>>({});

  ref.onDispose(() {
    unawaited(allAnswersStore.close());
    unawaited(answeredWrongStore.close());
  });

  return InMemoryUserAnswersRepository(
    allAnswersStore: allAnswersStore,
    answeredWrongStore: answeredWrongStore,
  );
}
