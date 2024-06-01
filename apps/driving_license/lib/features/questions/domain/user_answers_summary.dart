import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_answers_summary.freezed.dart';
part 'user_answers_summary.g.dart';

/// A summary of user answers. We show this in the ChapterCards in the
/// home screen.
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
