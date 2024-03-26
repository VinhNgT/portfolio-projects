import 'dart:async';

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:driving_license/utils/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'in_memory_user_answers_repository.g.dart';

class InMemoryUserAnswersRepository implements UserAnswersRepository {
  InMemoryUserAnswersRepository({required this.allAnswersStore});

  final InMemoryStore<UserAnswersMap> allAnswersStore;

  @override
  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) async {
    final userAnswer = UserAnswer(
      questionMetadata: question.metadata,
      selectedAnswerIndex: selectedAnswerIndex,
    );

    allAnswersStore.value[question.questionDbIndex] = userAnswer;
    allAnswersStore.emmit();
  }

  @override
  Future<void> clearAllUserAnswers() async {
    allAnswersStore.value = {};
    // No need to call emmit() here because the store will emits the
    // new value automatically when 'value' is updated directly using '='.
  }

  @override
  Future<void> clearUserAnswer(Question question) async {
    allAnswersStore.value.remove(question.questionDbIndex);
    allAnswersStore.emmit();
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
    final wrongAnswersMap = {
      for (final entry in allAnswersStore.value.entries)
        if (entry.value.selectedAnswerIndex !=
            entry.value.questionMetadata.correctAnswerIndex)
          entry.key: entry.value,
    };

    return Future.value(wrongAnswersMap);
  }

  @override
  Future<UserAnswersMap> getAllDifficultQuestionsAnswers() async {
    final difficultAnswersMap = {
      for (final entry in allAnswersStore.value.entries)
        if (entry.value.questionMetadata.isDifficult) entry.key: entry.value,
    };

    return Future.value(difficultAnswersMap);
  }

  @override
  Stream<int> watchChapterAnswersCount(Chapter chapter) {
    return allAnswersStore.stream.map((userAnswersMap) {
      return userAnswersMap.values.fold(0, (count, userAnswer) {
        // Check if the user answer is for the chapter
        if (userAnswer.questionMetadata.chapterDbIndex !=
            chapter.chapterDbIndex) {
          return count;
        }

        // User answer is for the chapter, increment the count
        return count++;
      });
    });
  }

  @override
  Stream<int> watchChapterWrongAnswersCount(Chapter chapter) {
    return allAnswersStore.stream.map((userAnswersMap) {
      return userAnswersMap.values.fold(0, (count, userAnswer) {
        // Check if the user answer is for the chapter
        if (userAnswer.questionMetadata.chapterDbIndex !=
            chapter.chapterDbIndex) {
          return count;
        }

        // Check if the user answer is not wrong
        if (userAnswer.selectedAnswerIndex ==
            userAnswer.questionMetadata.correctAnswerIndex) {
          return count;
        }

        // User answer is wrong, increment the count
        return count++;
      });
    });
  }
}

@Riverpod(keepAlive: true)
InMemoryUserAnswersRepository inMemoryUserAnswersRepository(
  InMemoryUserAnswersRepositoryRef ref,
) {
  final allAnswersStore = InMemoryStore<UserAnswersMap>({});
  ref.onDispose(() {
    unawaited(allAnswersStore.close());
  });

  return InMemoryUserAnswersRepository(allAnswersStore: allAnswersStore);
}
