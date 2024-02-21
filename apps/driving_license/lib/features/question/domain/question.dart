import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required String title,
    String? questionImagePath,
    required List<String> answers,
    required bool isDanger,
    required int correctAnswerIndex,
    String? explanation,
    String? rememberTip,
  }) = _Question;
}
