import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_answers_summary.freezed.dart';
part 'user_answers_summary.g.dart';

/// A summary of user answers. We show this in the ChapterCards in the
/// home screen.
@freezed
abstract class UserAnswersSummary with _$UserAnswersSummary {
  const factory UserAnswersSummary({
    required int correct,
    required int wrong,
    required int isDanger,
    required int wrongIsDanger,
  }) = _UserAnswersSummary;
  const UserAnswersSummary._();

  factory UserAnswersSummary.fromJson(Map<String, dynamic> json) =>
      _$UserAnswersSummaryFromJson(json);

  static const empty = UserAnswersSummary(
    correct: 0,
    wrong: 0,
    isDanger: 0,
    wrongIsDanger: 0,
  );

  int get total => correct + wrong;
}
