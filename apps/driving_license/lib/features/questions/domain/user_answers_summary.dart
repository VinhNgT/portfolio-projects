import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_answers_summary.freezed.dart';
part 'user_answers_summary.g.dart';

@freezed
abstract class UserAnswersSummary with _$UserAnswersSummary {
  const factory UserAnswersSummary({
    required int correctAnswers,
    required int wrongAnswers,
    required int wrongAnswersIsDanger,
  }) = _UserAnswersSummary;
  const UserAnswersSummary._();

  factory UserAnswersSummary.fromJson(Map<String, dynamic> json) =>
      _$UserAnswersSummaryFromJson(json);

  int get answeredQuestions => correctAnswers + wrongAnswers;
}
