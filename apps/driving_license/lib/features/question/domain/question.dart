import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required int questionId,
    required String question,
    String? questionImagePath,
    required List<String> answers,
    required bool isDanger,
    String? tip,
    String? rememberTip,
  }) = _Question;
}
