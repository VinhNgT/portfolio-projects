import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:driving_license/features/questions/domain/user_answers_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_answers_map.freezed.dart';
part 'user_answers_map.g.dart';

@freezed
abstract class UserAnswersMap with _$UserAnswersMap {
  const factory UserAnswersMap({
    required Map<int, UserAnswer> answersMap,
    required UserAnswersSummary summary,
  }) = _UserAnswersMap;

  factory UserAnswersMap.fromJson(Map<String, dynamic> json) =>
      _$UserAnswersMapFromJson(json);

  factory UserAnswersMap.fromUserAnswers(Iterable<UserAnswer> userAnswers) {
    final Map<int, UserAnswer> resultAnswersMap = {};

    int correctAnswers = 0;
    int wrongAnswers = 0;
    int wrongAnswersIsDanger = 0;

    for (final userAnswer in userAnswers) {
      resultAnswersMap[userAnswer.questionMetadata.questionDbIndex] =
          userAnswer;

      if (userAnswer.questionMetadata.correctAnswerIndex ==
          userAnswer.selectedAnswerIndex) {
        correctAnswers++;
      } else {
        wrongAnswers++;
        if (userAnswer.questionMetadata.isDanger) {
          wrongAnswersIsDanger++;
        }
      }
    }

    return UserAnswersMap(
      answersMap: resultAnswersMap,
      summary: UserAnswersSummary(
        correctAnswers: correctAnswers,
        wrongAnswers: wrongAnswers,
        wrongAnswersIsDanger: wrongAnswersIsDanger,
      ),
    );
  }

  static const empty = UserAnswersMap(
    answersMap: {},
    summary: UserAnswersSummary(
      correctAnswers: 0,
      wrongAnswers: 0,
      wrongAnswersIsDanger: 0,
    ),
  );
}

extension UserAnswersMapOperations on UserAnswersMap {
  UserAnswer? operator [](int index) => answersMap[index];
  int get length => answersMap.length;
  List<int> get questionDbIndexes => answersMap.keys.toList();
}
