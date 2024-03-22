import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_metadata.freezed.dart';
part 'question_metadata.g.dart';

@freezed
abstract class QuestionMetadata with _$QuestionMetadata {
  const factory QuestionMetadata({
    required int questionDbIndex,
    required int chapterDbIndex,
    required bool isDanger,
    required bool isDifficult,
    required int correctAnswerIndex,
  }) = _QuestionMetadata;

  factory QuestionMetadata.fromJson(Map<String, dynamic> json) =>
      _$QuestionMetadataFromJson(json);
}
