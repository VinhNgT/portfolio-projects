import 'dart:async';

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:driving_license/features/questions/domain/user_answers_map.dart';
import 'package:driving_license/features/questions/domain/user_answers_summary.dart';
import 'package:driving_license/utils/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'in_memory_user_answers_repository.g.dart';

class InMemoryUserAnswersRepository implements UserAnswersRepository {
  InMemoryUserAnswersRepository({required this.allAnswersStore});

  final InMemoryStore<Map<int, UserAnswer>> allAnswersStore;

  @override
  Future<void> saveAnswer(
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
  Future<void> clearAllAnswers(
    License license, {
    Chapter? chapter,
    bool filterDangerAnswers = false,
  }) async {
    allAnswersStore.value.removeWhere((questionDbIndex, userAnswer) {
      // Check if the question is not included in the license
      if (!_licenseFilter(userAnswer, license)) {
        return false;
      }

      // Check if the question is not in the chapter
      if (chapter != null && !_chapterFilter(userAnswer, chapter)) {
        return false;
      }

      // Check if the question is not dangerous
      if (filterDangerAnswers && !_dangerQuestionsFilter(userAnswer)) {
        return false;
      }

      return true;
    });

    allAnswersStore.emmit();
  }

  @override
  Future<void> clearDatabase() async {
    allAnswersStore.value = {};
    // No need to call emmit() here because the store will emits the
    // new value automatically when 'value' is updated directly using '='.
  }

  @override
  Future<void> clearAnswer(Question question) async {
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
  Future<UserAnswersMap> getAllAnswers(
    License license, {
    Chapter? chapter,
    bool filterWrongAnswers = false,
    bool filterDangerAnswers = false,
    bool filterDifficultAnswers = false,
  }) {
    final wrongAnswers = <UserAnswer>[];
    for (final entry in allAnswersStore.value.entries) {
      final userAnswer = entry.value;

      // Check if the question is not included in the license
      if (!_licenseFilter(userAnswer, license)) {
        continue;
      }

      // Check if the question is not in the chapter
      if (chapter != null && !_chapterFilter(userAnswer, chapter)) {
        continue;
      }

      // Check if the question is not wrong
      if (filterWrongAnswers && !_wrongAnswersFilter(userAnswer)) {
        continue;
      }

      // Check if the question is not dangerous
      if (filterDangerAnswers && !_dangerQuestionsFilter(userAnswer)) {
        continue;
      }

      // Check if the question is not difficult
      if (filterDifficultAnswers && !_difficultQuestionsFilter(userAnswer)) {
        continue;
      }

      wrongAnswers.add(userAnswer);
    }

    return Future.value(UserAnswersMap.fromUserAnswers(wrongAnswers));
  }

  @override
  Stream<UserAnswersSummary> watchUserAnswersSummary(
    License license, {
    Chapter? chapter,
    bool filterDangerAnswers = false,
  }) {
    return allAnswersStore.stream.map((userAnswersMap) {
      int corrects = 0;
      int wrong = 0;
      int wrongIsDanger = 0;

      userAnswersMap.forEach((questionDbIndex, userAnswer) {
        // Check if the user answer is not in the license
        if (!_licenseFilter(userAnswer, license)) {
          return;
        }

        // Check if the user answer is not in the chapter
        if (chapter != null && !_chapterFilter(userAnswer, chapter)) {
          return;
        }

        // Check if the user answer is correct
        if (_correctAnswersFilter(userAnswer)) {
          corrects++;
        } else {
          wrong++;

          if (_dangerQuestionsFilter(userAnswer)) {
            wrongIsDanger++;
          }
        }
      });

      return UserAnswersSummary(
        correctAnswers: corrects,
        wrongAnswers: wrong,
        wrongAnswersIsDanger: wrongIsDanger,
      );
    });
  }

  @override
  Future<int?> getFirstUnansweredPositionInList(Iterable<int> dbIndexes) {
    int location = -1;

    for (final dbIndex in dbIndexes) {
      location++;

      if (!allAnswersStore.value.containsKey(dbIndex)) {
        return Future.value(location);
      }
    }

    return Future.value(null);
  }

  @override
  Future<UserAnswersMap> getAnswersByQuestionDbIndexes(
    Iterable<int> dbIndexes,
  ) {
    final userAnswers = <UserAnswer>[];
    for (final dbIndex in dbIndexes) {
      final userAnswer = allAnswersStore.value[dbIndex];
      if (userAnswer != null) {
        userAnswers.add(userAnswer);
      }
    }

    return Future.value(UserAnswersMap.fromUserAnswers(userAnswers));
  }
}

extension _FilterExtension on InMemoryUserAnswersRepository {
  bool _chapterFilter(UserAnswer userAnswer, Chapter chapter) {
    return userAnswer.questionMetadata.chapterDbIndex == chapter.chapterDbIndex;
  }

  bool _licenseFilter(UserAnswer userAnswer, License license) {
    if (license == License.all) {
      return true;
    }
    return userAnswer.questionMetadata.includedLicenses.contains(license);
  }

  bool _correctAnswersFilter(UserAnswer userAnswer) {
    return userAnswer.isCorrect;
  }

  bool _wrongAnswersFilter(UserAnswer userAnswer) {
    return !userAnswer.isCorrect;
  }

  bool _difficultQuestionsFilter(UserAnswer userAnswer) {
    return userAnswer.questionMetadata.isDifficult;
  }

  bool _dangerQuestionsFilter(UserAnswer userAnswer) {
    return userAnswer.questionMetadata.isDanger;
  }
}

@Riverpod(keepAlive: true)
InMemoryUserAnswersRepository inMemoryUserAnswersRepository(
  InMemoryUserAnswersRepositoryRef ref,
) {
  final allAnswersStore = InMemoryStore<Map<int, UserAnswer>>({});
  ref.onDispose(() {
    unawaited(allAnswersStore.close());
  });

  return InMemoryUserAnswersRepository(allAnswersStore: allAnswersStore);
}
