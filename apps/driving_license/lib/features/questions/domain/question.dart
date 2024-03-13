import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required int questionIndex,
    required int chapterIndex,
    required String title,
    String? questionImagePath,
    required bool isDanger,
    required List<String> answers,
    required int correctAnswerIndex,
    String? explanation,
    String? rememberTip,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
