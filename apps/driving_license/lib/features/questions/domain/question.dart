import 'package:driving_license/features/questions/domain/question_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
abstract class Question with _$Question {
  const factory Question({
    required int questionDbIndex,
    required int chapterDbIndex,
    required String title,
    String? questionImagePath,
    required bool isDanger,
    required bool isDifficult,
    required List<String> answers,
    required int correctAnswerIndex,
    String? explanation,
    String? rememberTip,
  }) = _Question;
  const Question._();

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  factory Question.prototype() => const Question(
        questionDbIndex: -1,
        chapterDbIndex: -1,
        title: 'Prototype\nPrototype',
        isDanger: false,
        isDifficult: false,
        correctAnswerIndex: 0,
        answers: ['0'],
      );

  /// Returns a [QuestionMetadata] object with the metadata of this question.
  ///
  /// This method is useful when you want to save the metadata of a question
  /// without saving the whole question object.
  QuestionMetadata get metadata => QuestionMetadata(
        questionDbIndex: questionDbIndex,
        chapterDbIndex: chapterDbIndex,
        isDanger: isDanger,
        isDifficult: isDifficult,
        correctAnswerIndex: correctAnswerIndex,
      );
}
